import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

import '../models/models.dart';

class MapboxApiProvider {
  static const _accessToken = 'pk.eyJ1IjoidmVsa2FtaGVsbCIsImEiOiJja20ybnZqMWkwMGN0MndsYzNlanJrd3ZzIn0.LuAPvZMdlCWckrJ3jgbNYg';
  
  static const _directions = 'https://api.mapbox.com/directions/v5/mapbox';
  static const _places = 'https://api.mapbox.com/geocoding/v5/mapbox.places';

  final _dio = Dio();

  Future<TrafficResponse> fetchRoute(LatLng start, LatLng end) async {
    final coords = '${start.longitude},${start.latitude};${end.longitude},${end.latitude}';
    final url = '$_directions/driving/$coords';

    final resp = await _dio.get(url, queryParameters: {
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': _accessToken
    });

    // final directionsResponse = DirectionsResponse.fromJson(resp.data);
    final directionsResponse = TrafficResponse.fromJson(resp.data);

    return directionsResponse;
  }

  Future<List<Feature>> fetchPlaces(String query, LatLng proximity) async {
    print('fetching $query...');

    final url = '$_places/$query.json';

    final resp = await _dio.get(url, queryParameters: {
      'country': 'co',
      'proximity': '${proximity.longitude},${proximity.latitude}',
      'language': 'es',
      'access_token': _accessToken
    });

    final placesResponse = PlacesResponse.fromJson(json.decode(resp.data));
    
    return placesResponse.features;
  }

  Future<Feature> fetchInfo(LatLng target) async {
    final url = '$_places/${target.longitude},${target.latitude}.json';

    final resp = await _dio.get(url, queryParameters: {
      'country': 'co',
      'language': 'es',
      'access_token': _accessToken
    });

    // print(resp.data);

    final placesResponse = PlacesResponse.fromJson(json.decode(resp.data));

    return placesResponse.features[0];
  }
}