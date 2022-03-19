import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

import '../../models/models.dart';
import '../repository.dart';

part 'search2_event.dart';
part 'search2_state.dart';

class Search2Bloc extends Bloc<Search2Event, Search2State> {
  final ApiRepository _trafficService;

  Search2Bloc(this._trafficService) : super(const Search2State()) {
    on<Search2ShowMarkerEvent>((event, emit) => emit(state.copyWith(manual: true)));
    on<Search2HideMarkerEvent>((event, emit) => emit(state.copyWith(manual: false)));

    on<Search2StartFetchingEvent>((event, emit) => emit(state.copyWith(fetching: true)));
    on<Search2EndFetchingEvent>((event, emit) => emit(state.copyWith(fetching: false)));

    on<Search2AddPlacesEvent>((event, emit) => emit(state.copyWith(places: event.places)));
    on<Search2AddRecordEvent>((event, emit)  {
      final record = [event.place, ...state.record];
      emit(state.copyWith(record: record));
    });

    on<Search2SetLastEvent>((event, emit) {
      //-Si enviamos un nulo no detectara un cambio de estado, por eso la variable auxuliar clear
      final clear = event.place == null ? true : false;
      emit(state.copyWith(last: event.place, clear: clear));
    });
  }

  Future<TrafficResponse> getRoute(LatLng from, LatLng to) async {
    add(Search2StartFetchingEvent());

    final traffic = await _trafficService.getTraffic(from, to);

    final origin = await _trafficService.getInfo(from);
    final destination = await _trafficService.getInfo(to);

    traffic.startPlace = origin;
    traffic.endPlace = destination;

    add(Search2EndFetchingEvent());

    return traffic;
  }

  Future<void> getPlaces(String query, LatLng proximity) async {
    add(Search2StartFetchingEvent());
    
    final places = await _trafficService.getPlaces(query, proximity);
    add(Search2EndFetchingEvent());

    add(Search2AddPlacesEvent(places));
  }
}
