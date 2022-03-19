part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class MapCreatedEvent extends MapEvent {
  final GoogleMapController controller;
  const MapCreatedEvent(this.controller);
}

class CameraTrackingEvent extends MapEvent {}
class CameraUntrackingEvent extends MapEvent {}

class AddUserPolylineEvent extends MapEvent {
  final List<LatLng> points;
  const AddUserPolylineEvent(this.points);
}

//-Siempre que se dibuja una ruta se muestran los marcadores
class AddRoutePolylineEvent extends MapEvent {
  final TrafficResponse route;
  const AddRoutePolylineEvent(this.route);
}

class AddMarkerEvent extends MapEvent {
  final Marker marker;
  const AddMarkerEvent(this.marker);
}

class RemoveMarkersEvent extends MapEvent {
  const RemoveMarkersEvent();
}

class ShowUserPolylineEvent extends MapEvent {}
class HideUserPolylineEvent extends MapEvent {}