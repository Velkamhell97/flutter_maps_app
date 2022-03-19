part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class FirstLocationEvent extends LocationEvent {
  final LatLng? latlng;
  const FirstLocationEvent(this.latlng);
}

class NewLocationEvent extends LocationEvent {
  final LatLng latlng;
  const NewLocationEvent(this.latlng);
}

class TrackingLocationEvent extends LocationEvent {}
class UntrackingLocationEvent extends LocationEvent {}

