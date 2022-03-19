import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

import '../../extensions/extensions.dart';
import '../../services/services.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  //-Posicion initial random en caso que entre con el gps apagado
  static const _random = LatLng(37.7749, -122.4194);

  //-Como no hace parte del cambio de estado (no redibuja nada) se puede declara en el bloc
  bool _listening = false;
  bool unknow = false;

  late final StreamSubscription<ServiceStatus> _gpsStream;

  static const _settings = LocationSettings(distanceFilter: 10); //distancia en metros
  late final StreamSubscription<Position> _positionStream;

  LocationBloc() : super(const LocationState()) {
    on<FirstLocationEvent>((event, emit) {
      return emit(state.copyWith(locating: false, location: event.latlng ?? _random, initial: event.latlng));
    });

    on<NewLocationEvent>((event, emit) {
      final record = [...state.record, event.latlng];
      emit(state.copyWith(location: event.latlng, record: record, initial: _random));
    });

    on<TrackingLocationEvent>((event, emit) => emit(state.copyWith(tracking: true)));
    on<UntrackingLocationEvent>((event, emit) => emit(state.copyWith(tracking: false)));

    init();
  }

  Future<void> init() async {
    Position? position;

    try {
      position = await Geolocator.getCurrentPosition();
    } catch (e) {
      position = await Geolocator.getLastKnownPosition();
    }

    if(position == null){
      unknow = true;
    }

    add(FirstLocationEvent(position?.toLatLng()));
  }

  void toggleLocationTracking(){
    if(_listening){
      if(state.tracking){
        _positionStream.pause();
        add(UntrackingLocationEvent());
      } else {
        _positionStream.resume();
        add(TrackingLocationEvent());
      }
    }
  }

  void listenPositionStream() {
    if(!_listening){
      _positionStream = Geolocator.getPositionStream(locationSettings: _settings).listen((position) {
        add(NewLocationEvent(position.toLatLng()));
      });

      _listening = true;

      _positionStream.onError((error) => print('Position Stream Error $error'));
    }
  }

  Future<void> initListeners() async {
    final isGpsEnable = await Geolocator.isLocationServiceEnabled();

    if(isGpsEnable){
      listenPositionStream();
    } else {
      NotificationsService.showLocationServicesDialog();
    }

    _gpsStream = Geolocator.getServiceStatusStream().listen((status) {
      if(status == ServiceStatus.disabled){
        NotificationsService.showLocationServicesDialog();
      } else {
        listenPositionStream();
      }
    });
  }

  void disposeListeners(){
    _gpsStream.cancel();
    _positionStream.cancel();
  }
}
