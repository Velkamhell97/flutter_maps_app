part of 'location_bloc.dart';

//-Forma 1 de manejar estado: creamos como estado una clase global que maneje todos nuestros valores y aprovechamos el
//-uso del metodo copyWith para crear nuevos estados alterando los previos
class LocationState extends Equatable {
  final LatLng? initial;
  final bool locating;
  final bool tracking;
  final LatLng? location;
  final List<LatLng> record;

  const LocationState({
    this.initial,
    this.locating = true, 
    this.tracking = true, 
    this.location, 
    this.record = const [], 
  });

  LocationState copyWith({
    LatLng? initial,
    bool? locating,
    bool? tracking, 
    LatLng? location, 
    List<LatLng>? record,
    bool? unknow
  }) => LocationState(
    initial: initial ?? this.initial,
    locating: locating ?? this.locating,
    tracking: tracking ?? this.tracking,
    location: location ?? this.location,
    record: record ?? this.record,
  );
  
  @override
  List<Object?> get props => [initial, locating, tracking, location, record];
}

//-Forma 2 de manejar los estados: como se manejan varias variables y lo mas probable es que una dependa
//-del ultimo valor de la otra esta forma agrega mucha complejidad a la logica, ademas de tener que
//-enviar de nuevo casi todos los parametros del ultimo estado para poder crear en nuevo
//
// abstract class LocationState extends Equatable {
//   const LocationState();
//  
//   @override
//   List<Object> get props => [];
// }
//
// class LocationInitial extends LocationState {
//   final bool tracking;
//   final LatLng location;
//
//   const LocationInitial({this.tracking = false, this.location = const LatLng(37.7749, -122.4194)});
// }
//
// class LocationTracking extends LocationState {
//   final bool tracking;
//   final LatLng location;
//   const LocationTracking({this.tracking = true, required this.location});
// }
//
// class LocationUntracking extends LocationState {
//   final bool tracking;
//   final LatLng location;
//   const LocationUntracking({this.tracking = false, required this.location});
// }
//
// class LocationChanged extends LocationState {
//   final LatLng location;
//   final bool tracking;
//   final LatLng lastLocation;
//   final List<LatLng> locationRecord;
//
//   const LocationChanged({required this.location, required this.tracking, required this.lastLocation, required this.locationRecord});
// }
