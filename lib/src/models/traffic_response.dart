import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';

import '../extensions/extensions.dart';
import '../models/models.dart';

class TrafficResponse {
  final List<Route> routes;
  final List<Waypoint> waypoints;
  final String code;
  final String uuid;
  Feature? startPlace;
  Feature? endPlace;

  TrafficResponse({
    required this.routes,
    required this.waypoints,
    required this.code,
    required this.uuid,
    this.startPlace,
    this.endPlace
  });

  factory TrafficResponse.fromJson(Map<String, dynamic> json) => TrafficResponse(
    routes: List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
    waypoints: List<Waypoint>.from(json["waypoints"].map((x) => Waypoint.fromJson(x))),
    code: json["code"],
    uuid: json["uuid"],
  );
}

class Route {
  final String weightName;
  final double weight;
  final double duration;
  final double distance;
  final List<Leg> legs;
  final String geometry;
  final List<LatLng> points;

  String getDistance(){
    final km = distance / 1000;

    final distanceUnit = km < 1 ? 'm' : 'km';
    final distanceValue = km < 1 ? distance.round() : km > 10 ? km.round() : km.toPrecision(1);

    return '$distanceValue $distanceUnit';
  }

  String getDuration(){
    final min = duration / 60;

    final durationUnit = min < 60 ? 'm' : 'h';
    final durationValue = min < 60 ? min.round() : (min / 60).toPrecision(2);

    return '$durationValue $durationUnit';
  }

  static List<LatLng> _getPoints(String encode) {
    final decode = decodePolyline(encode, accuracyExponent: 6);
    return List.from(decode.map((p) => LatLng(p[0].toDouble(), p[1].toDouble())));
  }

  const Route({
    required this.weightName,
    required this.weight,
    required this.duration,
    required this.distance,
    required this.legs,
    required this.geometry,
    this.points = const []
  });

  factory Route.fromJson(Map<String, dynamic> json) => Route(
    weightName: json["weight_name"],
    weight: json["weight"].toDouble(),
    duration: json["duration"].toDouble(),
    distance: json["distance"].toDouble(),
    legs: List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
    geometry: json["geometry"],
    points: _getPoints(json["geometry"])
  );
}

class Leg {
  List<dynamic> viaWaypoints;
  List<Admin> admins;
  double weight;
  double duration;
  List<dynamic> steps;
  double distance;
  String summary;

  Leg({
    required this.viaWaypoints,
    required this.admins,
    required this.weight,
    required this.duration,
    required this.steps,
    required this.distance,
    required this.summary,
  });

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
    viaWaypoints: List<dynamic>.from(json["via_waypoints"].map((x) => x)),
    admins: List<Admin>.from(json["admins"].map((x) => Admin.fromJson(x))),
    weight: json["weight"].toDouble(),
    duration: json["duration"].toDouble(),
    steps: List<dynamic>.from(json["steps"].map((x) => x)),
    distance: json["distance"].toDouble(),
    summary: json["summary"],
  );
}

class Admin {
  final String iso31661Alpha3;
  final String iso31661;

  const Admin({
    required this.iso31661Alpha3,
    required this.iso31661,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
    iso31661Alpha3: json["iso_3166_1_alpha3"],
    iso31661: json["iso_3166_1"],
  );
}

class Waypoint {
  final double distance;
  final String name;
  final List<double> location;

  String getName() {
    if(name.isEmpty){
      return 'vacio';
    } else {
      return name;
    }
  }

  LatLng get latlng => LatLng(location[1], location[0]);

  const Waypoint({
    required this.distance,
    required this.name,
    required this.location,
  });



  factory Waypoint.fromJson(Map<String, dynamic> json) => Waypoint(
    distance: json["distance"].toDouble(),
    name: json["name"],
    location: List<double>.from(json["location"].map((x) => x.toDouble())),
  );
}
