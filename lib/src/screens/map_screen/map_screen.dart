import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../blocs/blocs.dart';
import '../../services/services.dart';
import '../../widgets/widgets.dart';

part 'map_layer.dart';
part 'manual_layer.dart';
part 'actions_layer.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final LocationBloc locationBloc;
  late final MapBloc mapBloc;

  @override
  void initState() {
    super.initState();
    locationBloc = BlocProvider.of<LocationBloc>(context);
    mapBloc = BlocProvider.of<MapBloc>(context);

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      locationBloc.initListeners();
    });
  }

  @override
  void dispose() {
    locationBloc.disposeListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    return BlocSelector<LocationBloc, LocationState, bool>(
      selector: (state) => state.locating,
      builder: (_, locating) {
        //-Despues de esto nos aseguramos de tener una posicion
        if(locating){
          return const Center(child: CircularProgressIndicator());
        }

        // -A pesar de solo renderizarse cuando cambia el state, el widget completo (root), se renderiza varias veces
        // -al abrir y cerrar el searchDelegate por alguna razon
        return BlocBuilder<SearchBloc, SearchState>(
          builder: (context, searchState) {
            final manual =  searchState.maybeWhen<bool>(manual: () => true, orElse: () => false);
      
            return Stack(
              children: [
                Listener(
                  onPointerMove: (_) => mapBloc.add(CameraUntrackingEvent()),
                  child: const MapLayer()
                ),
                
                if(manual)
                  const Positioned.fill(
                    child: ManualLayer()
                  ),
          
                BlocSelector<MapBloc, MapState, bool>(
                  selector: (state) => state.markers.isEmpty, 
                  builder: (_, markers) {
                    if(markers) return const SizedBox();

                    return Positioned(
                      right: 16,
                      top: mq.padding.top + 10 + 40 + 15,
                      child: Material(
                        elevation: 4,
                        clipBehavior: Clip.antiAlias,
                        shape: const CircleBorder(),
                        child: IconButton(
                          onPressed: () => context.read<MapBloc>().add(const RemoveMarkersEvent()), 
                          icon: const Icon(Icons.close)
                        ),
                      ),
                    );
                  }
                ),

                AnimatedPositioned(
                  duration: const Duration(milliseconds: 400),
                  top: manual ? -100 : mq.padding.top + 10,
                  left: 10,
                  right: 10,
                  child: const SearchBar(),
                ),
          
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 400),
                  right: manual ? -100 : 16,
                  bottom: 16,
                  child: const ActionsLayer()
                ),

                //-Ya sea que se traiga la data o se presente un error el loading cambia, redibujando
                BlocBuilder<FetchBloc, FetchState>(
                  builder: (context, state) => state.maybeWhen( 
                    loading: () => const Positioned.fill(child: RoutinLoading()),
                    orElse: () => const SizedBox()                        
                  )
                )
              ],
            );
          },
        );

        //-Forma 2 del searchBloc
        // return BlocBuilder<Search2Bloc, Search2State>(
        //   builder: (context, state) {
        //
        //     return Stack(
        //       children: [
        //         Listener(
        //           onPointerMove: (_) => mapBloc.add(CameraUntrackingEvent()),
        //           child: const MapLayer()
        //         ),
        //      
        //         if(state.manual)
        //           const Positioned.fill(
        //             child: ManualLayer()
        //           ),
        //
        //         AnimatedPositioned(
        //           duration: const Duration(milliseconds: 400),
        //           top: state.manual ? -100 : mq.padding.top + 10,
        //           left: 10,
        //           right: 10,
        //           child: const SearchBar(),
        //         ),
        // 
        //         AnimatedPositioned(
        //           duration: const Duration(milliseconds: 400),
        //           right: state.manual ? -100 : 16,
        //           bottom: 16,
        //           child: const ActionsLayer()
        //         ),
        //
        //         if(state.fetching)
        //           const Positioned.fill(child: RoutinLoading())
        //       ],
        //     );
        //   },
        // );
      },
    );
  }
}