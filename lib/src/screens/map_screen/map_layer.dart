part of 'map_screen.dart';

class MapLayer extends StatelessWidget {

  const MapLayer({Key? key}) : super(key: key);

  //-Posicion initial random en caso que entre con el gps apagado
  static const _random = LatLng(37.7749, -122.4194);

  @override
  Widget build(BuildContext context) {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    //-Detecta cambios en las polilines y markers
    return BlocListener<FetchBloc, FetchState>(
      listener: (context, state) => state.maybeWhen(
        routed: (directions) => mapBloc.add(AddRoutePolylineEvent(directions)),
        error: (error) => NotificationsService.showSnackBar(error),
        orElse: () => null
      ),
      child: BlocSelector<LocationBloc, LocationState, LatLng?>(
        selector: (state) => state.initial,
        builder: (_, initial) => BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            //-No sirve porque no esta el controller
            // if(!state.mapInitialized) {
            //   return const Center(child: CircularProgressIndicator());
            // }

            return GoogleMap(
              minMaxZoomPreference: const MinMaxZoomPreference(8, 18),
              initialCameraPosition: CameraPosition(
                target: locationBloc.state.initial ?? _random, 
                zoom: 14
              ),
              compassEnabled: false,
              zoomControlsEnabled: false,
              myLocationEnabled: initial == null ? false : true,
              myLocationButtonEnabled: false,
              mapToolbarEnabled: false,
              onMapCreated: (controller) {
                context.read<MapBloc>().add(MapCreatedEvent(controller));
      
                // context.read<MapBloc>().add(AddMarkerEvent(Marker(
                //   markerId: const MarkerId('I'),
                //   position: target
                // )));
              },
      
              markers: state.markers.values.toSet(),
      
              polylines: {
                Polyline(
                  polylineId: const PolylineId('route-line'),
                  color: Colors.blue,
                  width: 4,
                  startCap: Cap.roundCap,
                  endCap: Cap.roundCap,
                  points: state.routePoints
                ),
                Polyline(
                  polylineId: const PolylineId('user-line'),
                  color: Colors.blue.shade200,
                  width: 4,
                  startCap: Cap.roundCap,
                  endCap: Cap.roundCap,
                  points: state.userPoints
                ),
              },
            );
          },
        ),
      ),
    );
  }
}