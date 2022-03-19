import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

List<String> splitByMatch(String text, String query){
  final reg = RegExp('(?<=$query)|(?=$query)', caseSensitive: false);
  return text.split(reg);
}

Future<BitmapDescriptor> markerFromAsset(String path) async {
  return BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(
      devicePixelRatio: 2.5
    ), 
    path
  );
}

Future<BitmapDescriptor> markerFromNetwork(String url) async { 
  final resp = await Dio().get(url, options: Options(
    responseType: ResponseType.bytes
  ));

  final imageCodec = await ui.instantiateImageCodec(resp.data, targetHeight: 150, targetWidth: 150);
  final frame = await imageCodec.getNextFrame();

  final data = await frame.image.toByteData(format: ui.ImageByteFormat.png);

  if(data == null){
    return await markerFromAsset('assets/images/custom-pin.png');
  }

  return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
}

Future<BitmapDescriptor> markerFromPainter(CustomPainter painter) async {
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);

  const size = Size(650, 180); 
  painter.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
}