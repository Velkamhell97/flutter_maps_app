import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

import '../models/models.dart';
import '../providers/providers.dart';
import '../services/services.dart';

class ApiRepository {
  final mapboxApiProvider = MapboxApiProvider();
  final trafficService = TraficService();

  //-Si manejara mas apis se podrian colocar aqui el resto de providers y metodos principales
  //-en este caso que solo es una se podria colocar la logica del mapboxProvider en este repositorio

  Future<TrafficResponse> fetchRoute(LatLng start, LatLng end) async {
    //-Some other process (transforms, middlewares etc)
    return await mapboxApiProvider.fetchRoute(start, end);
  }

  Future<List<Feature>> fetchPlaces(String query, LatLng proximity) async {
    return await mapboxApiProvider.fetchPlaces(query, proximity);
  }

  Future<Feature> fetchInfo(LatLng target) async {
    return await mapboxApiProvider.fetchInfo(target);
  }
  
  Future<TrafficResponse> getTraffic(LatLng start, LatLng end) async {
    return await trafficService.getTraffic(start, end);
  }

  Future<List<Feature>> getPlaces(String query, LatLng proximity) async {
    return trafficService.getPlaces(query, proximity);
  }

  Future<Feature> getInfo(LatLng target) async {
    return await trafficService.getInfo(target);
  }
}