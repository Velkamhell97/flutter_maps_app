import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({Key? key}) : super(key: key);

  static const _text = "Debes aceptar los permisos de ubicacion para poder utilizar los servicios de mapas correctamente";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(_text, textAlign: TextAlign.center, style: TextStyle()),
          const SizedBox(height: 5.0),
          ElevatedButton( 
            onPressed: () => context.read<PermissionsBloc>().init(),
            child: const Text('Solicitar Permisos')
          )
        ],
      ),
    );
  }
}