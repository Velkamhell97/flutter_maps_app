import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' show DioError;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

import '../../blocs/blocs.dart';
import '../../models/models.dart';
import '../../services/services.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

part 'fetch_bloc.freezed.dart';

class FetchBloc extends Bloc<FetchEvent, FetchState> {
  final ApiRepository _api;

  static const _routeDefaultError = 'There was an error while fetching the route';
  static const _placesDefaultError = 'There was an error while fetching the places';
  
  FetchBloc(this._api) : super(const _Initial()) {
    on<_FetchRoute>((event, emit) async {
      emit(const _Loading());
      
      try {
        final directions = await _api.fetchRoute(event.from, event.to);
        
        final origin = await _api.fetchInfo(event.from); //-No tan utilizada se podria quitar
        final destination = await _api.fetchInfo(event.to);

        directions.startPlace = origin;
        directions.endPlace = destination;

        emit(_Routed(directions: directions));
      } on DioError catch(e){
        print(e.response);
        emit(_Error(error: e.response?.toString() ?? _routeDefaultError));
      } catch (e) {
        print(e.toString());
        emit(_Error(error: _routeDefaultError + e.toString()));
      }
    });

    on<_FetchPlaces>((event, emit) async {
      // emit(const _Loading());
      
      try {
        final places = await _api.fetchPlaces(event.query, event.proximity);
        emit(_Suggested(places: places));
      } on DioError catch(e){
        //-Aqui decidimos si actualizamos el ui, como no tenmos que cerrar ninguna ventana como en el de manual
        //-podemos simplemente borrar el snackBar, para no utilizar un listener
        // emit(_Error(error: e.response?.toString() ?? _placesDefaultError));

        emit(const _Suggested(places: [])); //-En vez de error mandamos vacio
        NotificationsService.showSnackBar(e.response?.toString() ?? _placesDefaultError);
      } catch (e) {
        //-Para este caso el error solo mostrara el snack y devolvera la lista vacia
        // emit(const _Error(error: _placesDefaultError));

        emit(const _Suggested(places: []));
        NotificationsService.showSnackBar(_placesDefaultError);
      }
    });

    on<_FetchSet>((event, emit) => emit(event.state));
  }
}
