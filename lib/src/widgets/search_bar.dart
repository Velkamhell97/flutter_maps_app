import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../search/search.dart';
// import '../models/models.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final searchBloc = BlocProvider.of<SearchBloc>(context);
    // final search2Bloc = BlocProvider.of<Search2Bloc>(context);

    final location = BlocProvider.of<LocationBloc>(context).state.location!;

    //-Solucion 1: Con un textController y un input falso
    return Material(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: TextField(
        readOnly: true,
        controller: _textController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          prefixIcon: const Icon(Icons.search, color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none
          ),
          hintText: '¿Donde quieres ir?'
        ),
        onTap: () async {
          final action = await showSearch<SearchState>(
            context: context, 
            delegate: SearchDestinationDelegate(
              fetchBloc: context.read<FetchBloc>(),
              initial: _textController.text,
              controller: _textController,
              proximity: location
            ),
            query: _textController.text
          );

          action?.maybeWhen(
            done: (place) async {
              //-forma 1 con fetchBloc
              context.read<FetchBloc>().add(FetchEvent.route(from: location, to: place.latlng));

              //-forma 2 con el searh2Bloc
              // final route = await search2Bloc.getRoute(location, place.latlng);
              // context.read<MapBloc>().add(AddRoutePolylineEvent(route));
            },
            manual: () {
              context.read<SearchBloc>().add(const SearchEvent.action(state: SearchState.manual()));

              //-Para search2Bloc
              //search2Bloc.add(Search2ShowMarkerEvent());
            },
            orElse: () => null
          );
        },
      ),
    );
    
    //-Solucion 2: Con un blocBuilder de SearchBloc y SearchBloc2 respectivamente
    // return Material(
    //   // color: Colors.red.shade300,
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    //   elevation: 3.0,
    //   clipBehavior: Clip.antiAlias,
    //   child: InkWell(
    //     onTap: () async {
    //       final action = await showSearch<SearchState>(
    //         context: context, 
    //         delegate: SearchDestinationDelegate(
    //           fetchBloc: context.read<FetchBloc>(),
    //           controller: _textController,
    //           // initial: searchBloc.last?.text ?? ''
    //           initial: search2Bloc.state.last?.text ?? ''
    //         ),
    //         // query: searchBloc.last?.text ?? ''
    //         query: search2Bloc.state.last?.text ?? ''
    //       );
    //
    //       action?.maybeWhen(
    //         done: (place) async {
    //           final location = context.read<LocationBloc>().state.location!;
    //           // context.read<FetchBloc>().add(FetchEvent.route(from: location, to: place.latlng));
    //
    //           //-forma 2 con el searh2Bloc
    //           final route = await search2Bloc.getRoute(location, place.latlng);
    //           context.read<MapBloc>().add(AddRoutePolylineEvent(route.points));
    //         },
    //         manual: () {
    //           //-Para search2Bloc
    //           search2Bloc.add(Search2ShowMarkerEvent());
    //         },
    //         orElse: () => context.read<SearchBloc>().add(SearchEvent.action(state: action))
    //       );
    //     },
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
    //       child: Row(
    //         children: [
    //           const Icon(Icons.search),
    //           const SizedBox(width: 5.0),
    //
    //           // BlocBuilder<SearchBloc, SearchState>(
    //           //   builder: (_, state) => state.maybeWhen(
    //           //     orElse: () => Text(searchBloc.last?.text ?? '¿Donde quieres ir?')
    //           //   ),
    //           // )
    //
    //           //-Con search2Bloc
    //           BlocSelector<Search2Bloc, Search2State, Feature?>(
    //             selector: (state) => state.last,
    //             builder: (_, last) {
    //               return Text(last?.text ?? '¿Donde quieres ir?');
    //             },
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}