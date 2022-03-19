part of 'map_screen.dart';

class ManualLayer extends StatefulWidget {
  const ManualLayer({Key? key}) : super(key: key);

  @override
  State<ManualLayer> createState() => _ManualLayerState();
}

class _ManualLayerState extends State<ManualLayer> with SingleTickerProviderStateMixin {
  late final SearchBloc searchBloc;
  late final Search2Bloc search2Bloc;
  
  late final AnimationController _controller;
  late final Animation<double> _bouncing;
  late final Animation<double> _sliding;
  late final Animation<double> _fading;

  static const _delayDuration = 200;
  static const _animationDuration = 400;

  static const _duration = _delayDuration + _animationDuration;
  static const _start =  _delayDuration / _duration;

  @override
  void initState() {
    super.initState();
    searchBloc = BlocProvider.of<SearchBloc>(context);
    search2Bloc = BlocProvider.of<Search2Bloc>(context);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _duration),
      reverseDuration: const Duration(milliseconds: _animationDuration)
    );

    //-Forma 1 de animaciones: 
    _bouncing = Tween(begin: -40.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(_start, 1.0, curve: Curves.bounceOut))
    );

    //se pone de -1 para poder reutilizarse en otros lados
    _sliding = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(_start, 1.0, curve: Curves.easeOut))
    );

    _fading = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(_start, 1.0, curve: Curves.easeIn))
    );

    //-Forma 2 de animaciones
    //-Si los elementos se mueven en 400ml para empezar en los 200 ml
    // _bouncing = CurvedAnimation(
    //   parent: _controller, 
    //   curve: const Interval(_delayFraction, 1.0, curve: Curves.bounceOut)
    // );
    //
    // _fading = CurvedAnimation(
    //   parent: _controller, 
    //   curve: const Interval(_delayFraction, 1.0, curve: Curves.easeIn)
    // );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _close() async {
    //-Espera a que termine y luego si hace la transicion
    // await _controller.reverse();
    // searchBloc.add(const SearchEvent.action(state: SearchState.canceled()));

    //-Para que la transicion no tarde tanto
    _controller.reverse();
    Future.delayed(const Duration(milliseconds: 200), () {
      searchBloc.add(const SearchEvent.action(state: SearchState.initial()));

      //-con el search2Bloc
      // search2Bloc.add(Search2HideMarkerEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);
    final center = ((mq.size * mq.devicePixelRatio) / 2);

    final location   = BlocProvider.of<LocationBloc>(context).state.location;
    final fetchBloc  = BlocProvider.of<FetchBloc>(context);
    final mapBloc    = BlocProvider.of<MapBloc>(context);

    //-Para cerrar el widget una vez se tenga respuesta, tambien podria escucharse elevento del mapa al pintar la linea
    return BlocListener<FetchBloc, FetchState>(
      // listenWhen: .. //-Como no se rebibuja no importa escuchar todos (CREO),
      listener: (context, state) => state.maybeWhen(
        routed: (_) => _close(), //-El dibujado se hace en el listener del map, aqui solo cerramos
        error: (_) => _close(), //-El error tambien se captura alli aqui solo aprovechamos que tenemos el controller
        orElse: () => null
      ),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Stack(
            children: [
              Positioned(
                left: 16,
                top: mq.padding.top + 10,
                child: Transform.translate(
                  offset: Offset(100 * _sliding.value, 0.0),
                  child: Material(
                    elevation: 3,
                    shape: const CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: _close,
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.arrow_back_ios_new)
                      ),
                    ),
                  ),
                ),
              ),
    
              Align(
                child: Transform.translate(
                  offset: Offset(0.0, -12.0 + _bouncing.value),
                  child: Opacity(
                    opacity: _fading.value,
                    child: const Icon(Icons.location_on_rounded, size: 30),
                  ),
                ),
              ),
    
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Transform.translate(
                  offset: Offset(0.0, -100 * _sliding.value),
                  child: ElevatedButton(
                    onPressed: () async {
                      if(location == null) return;
    
                      final marker = await mapBloc.getLatLngFromPoint(
                        ScreenCoordinate(x: center.width.round(), y: center.height.round())
                      );

                      //-Forma 1: cont fetch bloc, maneja el loading, error y data completamente
                      fetchBloc.add(FetchEvent.route(from: location, to: marker));

                      //-Forma 2: con el search2Bloc, utilizamos un metodo del bloc asi como podriamos usar el 
                      //-trafficService directamente, se deben capturar los estados de fetching, error y data manualemten
                      //
                      //-En el video utilizan un dialog como pantalla de carga
                      //NotificationsService.showLocationServicesDialog()
                      //
                      // final route = await search2Bloc.getRoute(location, marker);
                      //-navigation.pop() //-para cerrar el loading
                      //
                      // mapBloc.add(AddRoutePolylineEvent(route));
                      // _close();
                    },
                    child: const Text('Confirmar'),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}