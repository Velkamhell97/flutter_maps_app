import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/models.dart';

class TraficService {
  //-Forma 1 de inicializar el dio, utilizando el constructor ya sea privado o punblico
  // final Dio _dioTraffic = Dio();
  //
  // TraficService._internal(){
  //   _dioTraffic.interceptors.add(_TrafficInterceptor())
  // }
  //
  // TraficService() {
  //   _dioTraffic.interceptors.add(_TrafficInterceptor())
  // }

  //-Forma 2 de inicializar el dio, despues del constructor ya sea publico o privado
  // final Dio _dioTraffic;
  //
  // TraficService._internal() : _dioTraffic = Dio()..interceptors.add(_TrafficInterceptor());
  // TraficService() : _dioTraffic = Dio()..interceptors.add(_TrafficInterceptor());

  //-Por si se quisiera crear una clase singlenton (no necesario porque se utilizara un repository)
  // static final TraficService _instance = TraficService._internal();
  //
  // factory TraficService() {
  //   return _instance;
  // }
  //

  //-Otra forma de agregar informacion a las peticiones de la instancia sin el interceptor
  // final _dioTraffic = Dio(BaseOptions(
  //   queryParameters: {
  //     'alternatives': true,
  //     'geometries': 'polyline6',
  //     'overview': 'simplified',
  //     'steps': false,
  //     'access_token': _accessToken
  //   }
  // ));

  //-Forma final del curso
  final Dio _dioTraffic;
  final Dio _dioPlaces;

  TraficService() : 
    _dioTraffic = Dio()..interceptors.add(_TrafficInterceptor()),
    _dioPlaces  = Dio()..interceptors.add(_PlacesInterceptor());

  static const _baseTrafficUrl = 'https://api.mapbox.com/directions/v5/mapbox';
  static const _basePlacesUrl = 'https://api.mapbox.com/geocoding/v5/mapbox.places';
  // static const _accessToken = 'pk.eyJ1IjoidmVsa2FtaGVsbCIsImEiOiJja20ybnZqMWkwMGN0MndsYzNlanJrd3ZzIn0.LuAPvZMdlCWckrJ3jgbNYg';

  Future<TrafficResponse> getTraffic(LatLng start, LatLng end) async {
    final coords = '${start.longitude},${start.latitude};${end.longitude},${end.latitude}';
    final url = '$_baseTrafficUrl/driving/$coords';

    final resp = await _dioTraffic.get(url);
    final trafficResponse = TrafficResponse.fromJson(resp.data);

    return trafficResponse;
  }

  Future<List<Feature>> getPlaces(String query, LatLng proximity) async {
    final url = '$_basePlacesUrl/$query.json';

    final resp = await _dioPlaces.get(url, queryParameters: {
      'proximity': '${proximity.longitude},${proximity.latitude}',
      'limit': 5
    });

    // final directionsResponse = DirectionsResponse.fromJson(resp.data);
    final placesResponse = PlacesResponse.fromJson(json.decode(resp.data));

    return placesResponse.features;
  }

  Future<Feature> getInfo(LatLng target) async {
    final url = '$_basePlacesUrl/${target.longitude},${target.latitude}.json';

    final resp = await _dioPlaces.get(url, queryParameters: {
      'limit': 1,
    });

    final placesResponse = PlacesResponse.fromJson(json.decode(resp.data));
    
    return placesResponse.features[0];
  }
}

//-Los interceptores basicamente permiten tener mayor flexibilidad en todas las etapas de la peticion
//-podemos agregar datos en el request, filtrar datos del response, o actuar frente a un error
class _TrafficInterceptor extends Interceptor {
  static const _accessToken = 'pk.eyJ1IjoidmVsa2FtaGVsbCIsImEiOiJja20ybnZqMWkwMGN0MndsYzNlanJrd3ZzIn0.LuAPvZMdlCWckrJ3jgbNYg';
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': _accessToken
    });

    super.onRequest(options, handler);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   super.onResponse(response, handler);
  // }

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   super.onError(err, handler);
  // }
}


class _PlacesInterceptor extends Interceptor {
  static const _accessToken = 'pk.eyJ1IjoidmVsa2FtaGVsbCIsImEiOiJja20ybnZqMWkwMGN0MndsYzNlanJrd3ZzIn0.LuAPvZMdlCWckrJ3jgbNYg';
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'country': 'co',
      'language': 'es',
      'access_token': _accessToken
    });

    super.onRequest(options, handler);
  }
}