import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../blocs/blocs.dart';
import '../models/models.dart';
import 'places_list.dart';

class SearchDestinationDelegate extends SearchDelegate<SearchState> {
  final FetchBloc fetchBloc;
  final String initial;
  final TextEditingController controller;
  final LatLng proximity;

  SearchDestinationDelegate({
    required this.fetchBloc, 
    required this.initial,
    required this.controller,
    required this.proximity
  });

  final _debouncer = Debouncer();
  String _last = '';

  @override
  String? get searchFieldLabel => 'Buscar...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(
      onPressed: () {
        query = '';
        controller.text = '';

        //-Para cuando se utilizo el last de los bloc
        // context.read<Search2Bloc>().add(const Search2SetLastEvent(null));
        //
        // context.read<SearchBloc>().last = null;
        //-se debe disparar un evento para redibujar
        // context.read<SearchBloc>().add(const SearchEvent.action(state: SearchState.initial()));
      },
      splashRadius: 22,
      icon: const Icon(Icons.clear)
    )];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        _debouncer.cancel();
        close(context, const SearchState.canceled());
      },
      splashRadius: 22,
      icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //-Como se hara la logica en las sugerencias no se llegara a este metodo
    // return const SizedBox();

    //-Forma 1: con el fetchBloc
    // fetchBloc.add(const FetchEvent.set(state: FetchState.loading()));
    //
    // final proximity = context.read<LocationBloc>().state.location!;
    // fetchBloc.add(FetchEvent.places(query: query, proximity: proximity));
    //
    // return _PlacesList(
    //   onTap: (place) => close(context, SearchState.done(place: place)), 
    //   onManual: () => close(context, const SearchState.manual())
    // );

    //-Forma 2: con el search2Bloc
    final search2Bloc = BlocProvider.of<Search2Bloc>(context);
    search2Bloc.add(Search2StartFetchingEvent());
    search2Bloc.getPlaces(query, proximity);

    //-El el video el sea
    return BlocBuilder<Search2Bloc, Search2State>(
      builder: (context, state) {
        if(state.fetching){
          return const Center(child: CircularProgressIndicator());
        }

        return PlacesList(
          onTap: (place){
            controller.text = place.text;

            //-Para el search2Bloc graba el ultimo y guarda en historial
            search2Bloc.add(Search2SetLastEvent(place));
            search2Bloc.add(Search2AddRecordEvent(place));
            close(context, SearchState.done(place: place));
          }, 
          onManual: () => close(context, const SearchState.manual()), //si no se mostrara, no seria necesario
          query: query, //-Para el match de los textos 
          places: state.places
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //-Muestro el historial en caso de que se entre con el mismo texto (asi lo hace google maps)
    if(query.isEmpty || query == initial){
      _debouncer.cancel();
      //fetchBloc.add(const FetchEvent.set(state: FetchState.initial())); //-Cancela la busqueda

      return EmptyList(
        onManual: () {
          context.read<MapBloc>().add(const RemoveMarkersEvent());
          close(context, const SearchState.manual());
        },
        onHistory: (place) {
          controller.text = place.text;
          close(context, SearchState.done(place: place));
          query = '';
        },
      );
    }

    //-Para no redisparar la peticion cuando se quita el foco
    if(_last != query){
      //-No se redibuja por ser el mismo estado
      fetchBloc.add(const FetchEvent.set(state: FetchState.loading()));
      
      _debouncer.run(() async {
        _last = query;
        fetchBloc.add(FetchEvent.places(query: query, proximity: proximity));
      });
    }
    
    return BlocBuilder<FetchBloc, FetchState>(
      builder: (_, state) => state.maybeWhen(
        loading: () => const Center(child: CircularProgressIndicator()),

        suggested: (places) => PlacesList(
          onTap: (place) {
            controller.text = place.text;

            final searchBloc =  context.read<SearchBloc>();
            searchBloc.record.add(place);
            // searchBloc.last = place;
            // searchBloc.add(SearchEvent.action(state: SearchState.done(place: place)));

            close(context, SearchState.done(place: place));
            query = '';
          }, 
          onManual: () {
            context.read<MapBloc>().add(const RemoveMarkersEvent());
            close(context, const SearchState.manual());
          }, 
          query: query, 
          places: places
        ),

        orElse: () => const SizedBox()
      ),
    );
  }
}



