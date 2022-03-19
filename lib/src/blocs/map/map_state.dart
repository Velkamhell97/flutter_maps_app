part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool cameraTracking;
  final bool mapInitialized;

  final List<LatLng> userPoints;
  final List<LatLng> routePoints;

  //-Otra forma de crear elementos dinamicos, tambien se pudo hacer asi con las polilineas
  final Map<String, Marker> markers;

  final bool showUserLine;

  const MapState({
    this.cameraTracking = false, 
    this.mapInitialized = false,

    this.userPoints = const [],
    this.routePoints = const [],

    this.markers = const {},
    this.showUserLine = false,
  }); 

  MapState copyWith({
    bool? cameraTracking,
    bool? mapInitialized,

    List<LatLng>? userPoints,
    List<LatLng>? routePoints,

    Map<String, Marker>? markers,
    bool? showUserLine,
  }) => MapState(
    cameraTracking: cameraTracking ?? this.cameraTracking,
    mapInitialized: mapInitialized ?? this.mapInitialized,

    userPoints: userPoints ?? this.userPoints,
    routePoints: routePoints ?? this.routePoints,
    
    markers: markers ?? this.markers,
    showUserLine: showUserLine ?? this.showUserLine,
  );

  @override
  List<Object> get props => [cameraTracking, mapInitialized, userPoints, routePoints, markers, showUserLine];
}
