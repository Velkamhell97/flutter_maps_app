import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../blocs/blocs.dart';
import '../../helpers/helpers.dart';
import '../../widgets/widgets.dart';
import '../../models/models.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  //-Para compartir datos entre blocs
  final LocationBloc locationBloc;

  //-Forma de centralizar mas el stream del location
  late final StreamSubscription<LocationState> locationStream;

  //-Al parecer no todo se debe definir en el estado, o mejor dicho alli solo irian las variables que cambian
  late final GoogleMapController _mapController;
  bool unknow = false; //-Para mover la camara si se inicia con el gps apagado

  MapBloc({required this.locationBloc}) : super(const MapState()) {
    on<MapCreatedEvent>((event, emit) async {
      _mapController = event.controller;
      // _mapController.setMapStyle(jsonEncode(nightMapTheme));

      emit(state.copyWith(mapInitialized: true));
    });

    //-Para que una vez se activa la opcion no espere al sieguiente cambio de posicion para seguirlo
    on<CameraTrackingEvent>((event, emit) {
      animateCamera(locationBloc.state.location);
      emit(state.copyWith(cameraTracking: true)) ;
    });
    on<CameraUntrackingEvent>((event, emit) => emit(state.copyWith(cameraTracking: false)));

    on<AddUserPolylineEvent>((event, emit) => emit(state.copyWith(userPoints: event.points)));

    // static const _random = LatLng(37.7749, -122.4194);

    on<AddRoutePolylineEvent>((event, emit) async {
      final route = event.route.routes[0];
      final waypoints = event.route.waypoints;

      // final startPlace = event.route.startPlace!;
      final endPlace = event.route.endPlace!;

      // final iconA = await markerFromAsset('assets/images/custom-pin.png');
      // final iconB = await markerFromNetwork('https://cdn4.iconfinder.com/data/icons/small-n-flat/24/map-marker-512.png');

      final iconA = await markerFromPainter(MarkerAPainter(
        duration: route.getDuration(), 
        distance: route.getDistance(), 
        title: waypoints[0].getName(), 
        subtitle: 'Mi ubicación',
      ));

      final iconB = await markerFromPainter(MarkerBPainter(
        duration: route.getDuration(), 
        distance: route.getDistance(), 
        title: endPlace.getName(), 
        subtitle: endPlace.getCity()
      ));

      //-De la misma manera se crearia las polilines si fueron un map
      final markerA = Marker(
        markerId: const MarkerId('A'),
        position: waypoints[0].latlng,
        icon: iconA,
        anchor: const Offset(0.05, 1.0)
        // infoWindow: InfoWindow(
        //   title: event.route.waypoints[0].name.isEmpty ? 'Inicio' : event.route.waypoints[0].name,
        //   snippet: 'Distancia: $distance - Duracion: $duration', //-Tampoco deja escribir mucho
        //   // onTap: () {//some actions} 
        // )
      );

      final markerB = Marker(
        markerId: const MarkerId('B'),
        position: waypoints[1].latlng,
        icon: iconB,
        // infoWindow: InfoWindow(
        //   //-Algunos lugares no traen este name
        //   title: (event.route.endPlace?.text ?? '').isEmpty ? 'Final' : event.route.endPlace!.text,
        //   snippet: 'Distancia: $distance - Duracion: $duration',
        //   // onTap: () {//some actions} 
        // )
      );

      final markers = {
        ...state.markers,
        markerA.markerId.value: markerA,
        markerB.markerId.value: markerB,
      };

      emit(state.copyWith(routePoints: route.points, markers: markers));

      //-Para mostrar el window una vez se traza la ruta
      // Future.delayed(const Duration(milliseconds: 500), (){
      //   _mapController.showMarkerInfoWindow(markerA.markerId);
      // });
    });

    on<AddMarkerEvent>((event, emit) {
      final markers = {
        ...state.markers,
        event.marker.mapsId.value: event.marker
      };

      emit(state.copyWith(markers: markers));
    });

    on<RemoveMarkersEvent>((event, emit) => emit(state.copyWith(markers: {}, routePoints: [])));

    //-Al igual que el tracking de la camara, para no tener que esperar el update de la location
    on<ShowUserPolylineEvent>((event, emit) {
      // add(AddUserPolylineEvent(locationBloc.state.record));
      emit(state.copyWith(showUserLine: true));
    });
    
    on<HideUserPolylineEvent>((event, emit) {
      add(const AddUserPolylineEvent([]));
      emit(state.copyWith(showUserLine: false));
    });

    //-Escuchamos los cambios del otro bloc
    locationStream = locationBloc.stream.distinct().listen((locationState) {
      // print('actual ${locationState.location} - initial: ${locationState.initial}');

      if(locationState.initial == null) return;

      if(state.showUserLine){
        add(AddUserPolylineEvent(locationState.record));
      } else {
        add(const AddUserPolylineEvent([]));
      }

      if(locationBloc.unknow){
        animateCamera(locationState.location);
        locationBloc.unknow = false;
      }

      if(state.cameraTracking){
        animateCamera(locationState.location);
      }
    });
  }

  void animateCamera(LatLng? latlng){
    if(latlng != null){
      _mapController.animateCamera(CameraUpdate.newLatLng(latlng));
    }
  }

  void toggleCameraTracking(){
    if(state.cameraTracking){
      add(CameraUntrackingEvent());
    } else {
      add(CameraTrackingEvent());
    }
  }

  void toggleUserLine(){
    if(state.showUserLine){
      add(HideUserPolylineEvent());
    } else {
      add(ShowUserPolylineEvent());
    }
  }

  Future<LatLng> getLatLngFromPoint(ScreenCoordinate point) async {
    return await _mapController.getLatLng(point);
  }

  @override
  Future<void> close() {
    locationStream.cancel();
    return super.close();
  }
}
