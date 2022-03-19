import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

import 'extensions.dart';

extension LatLngParsing on LatLng {
  String parse() {
    return "${longitude.toStringAsFixed(4)}, ${latitude.toStringAsFixed(4)}";
  }

  List<double> toList() {
    return [longitude, latitude];
  }

  num distanceTo(LatLng dest){
    const R = 6371.0710; // Radius of the Earth in km
    const rad = pi/180;
    
    final rlat1 = latitude * rad; // Convert degrees to radians
    final rlat2 = dest.latitude * rad; // Convert degrees to radians
      
    final difflat = rlat2-rlat1; // Radian difference (latitudes)
    final difflon = (dest.longitude - longitude) * rad; // Radian difference (longitudes)

    double d = 2 * R * asin(sqrt(sin(difflat/2) * sin(difflat/2) + cos(rlat1) * cos(rlat2) * sin(difflon/2) * sin(difflon/2)));
    
    return d > 10 ? d.round() : d.toPrecision(1);
  }
  
}