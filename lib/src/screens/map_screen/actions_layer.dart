part of 'map_screen.dart';

class ActionsLayer extends StatelessWidget {
  const ActionsLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //-Al parecer esto siempre esta con listen en false
    final mapBloc = BlocProvider.of<MapBloc>(context);

    // print('buttons rebuild');

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: null,
          onPressed: () {
            final location = context.read<LocationBloc>().state.location;
            context.read<MapBloc>().animateCamera(location);
          },
          child: const Icon(Icons.my_location_outlined),
        ),

        const SizedBox(height: 10.0),
        
        BlocSelector<MapBloc, MapState, bool>(
          selector: (state) => state.cameraTracking,
          builder: (_, tracking) {
            return FloatingActionButton(
              heroTag: null,
              onPressed: mapBloc.toggleCameraTracking,
              child: Icon(tracking ? Icons.hail_rounded : Icons.directions_run_outlined),
            );
          },
        ),

        const SizedBox(height: 10.0),

        BlocSelector<MapBloc, MapState, bool>(
          selector: (state) => state.showUserLine,
          builder: (_, show) {
            return FloatingActionButton(
              heroTag: null,
              onPressed: mapBloc.toggleUserLine,
              child: Icon(show ? Icons.visibility_off : Icons.visibility),
            );
          },
        )
      ],
    );
  }
}