import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

import '../models/models.dart';
import '../blocs/blocs.dart';
import '../extensions/extensions.dart';
import '../helpers/helpers.dart';

class PlacesList extends StatelessWidget {
  final List<Feature> places;
  final Function(Feature) onTap;
  final VoidCallback onManual;
  final String query;

  const PlacesList({
    Key? key, 
    required this.onTap, 
    required this.onManual, 
    required this.query,
    required this.places
  }) : super(key: key);

  static const _bold = TextStyle(fontWeight: FontWeight.bold);
  static const _grey = TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    final location = context.read<LocationBloc>().state.location!;

    return ListView(
      children: [
        if(places.isEmpty) 
          const ListTile(
            title: Text('No se encontraron resultados', style: _grey)
          ),

        ...places.map((place) {
          final distance = location.distanceTo(LatLng(place.center[1], place.center[0]));

          //-Forma 1:encuentra todas las coincidencias y las parte en un arreglo (no prodabo del todo)
          final matches = splitByMatch(place.text, query);

          //-Forma 2: encuetra las coincidencias pero solo si esta al inicio
          // final reg = RegExp(query, caseSensitive: false);
          // final highlight = reg.firstMatch(place.text)?.group(0) ?? '';
          // final rest = highlight.isEmpty ? place.text : place.text.split(highlight).last; 

          return ListTile(
            title: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 14),
                children: [
                  ...matches.map((text) => TextSpan(text:text, style: text.equals(query) ? _bold : null))
                ]
              ),
            ),
            subtitle: Text(place.getCity(), maxLines: 1),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.place_outlined),
                Text('$distance km')
              ],
            ),
            onTap: () {
              // searchBloc.record.insert(0,place);
              onTap(place);
            }
          );
        }),

        if(places.isNotEmpty) const Divider(color: Colors.grey,thickness: 0.8),
        
        ManualTile(onTap: onManual)
      ],
    );
  }
}

class EmptyList extends StatelessWidget {
  final Function(Feature) onHistory;
  final VoidCallback onManual;

  const EmptyList({Key? key, required this.onManual, required this.onHistory}) : super(key: key);

  //-Al parecer hay un pequeño flick cuando el query initial es muy largo y el cursor va hasta el final de la patalla
  @override
  Widget build(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);

    //-Seria exactamente lo mismo si se hiciera con cualquiera
    // final search2Bloc = BlocProvider.of<Search2Bloc>(context).state;

    return ListView(
      children: [
        ...searchBloc.record.map((place) { 
          return ListTile(
            title: Text(place.text),
            subtitle: Text(place.getCity()),
            leading: const Icon(Icons.history),
            onTap: () => onHistory(place),
          );
        }).toList().reversed,
              
        ManualTile(onTap: onManual)
      ],
    );
  }
}

class ManualTile extends StatelessWidget {
  final VoidCallback onTap;
  const ManualTile({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.place, color: Colors.black),
      title: const Text('Colocar ubicacion manual '),
      onTap: onTap,
    );
  }
}