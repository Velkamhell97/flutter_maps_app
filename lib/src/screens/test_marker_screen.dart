import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class TestMarkerScreen extends StatelessWidget {
  const TestMarkerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // color: Colors.red,
          width: 350,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
          ),
          child: const CustomPaint(
            painter: MarkerBPainter(
              distance: '1.8 km',
              duration: '55 min',
              title: 'Mi casa',
              subtitle: 'Neiva, Huila, Colombia'
            ),
          ),
        ),
      ),
    );
  }
}