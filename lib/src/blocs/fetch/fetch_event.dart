part of 'fetch_bloc.dart';

@freezed
class FetchEvent with _$FetchEvent {
  const factory FetchEvent.route({required LatLng from, required LatLng to}) = _FetchRoute;
  const factory FetchEvent.places({required String query, required LatLng proximity}) = _FetchPlaces;
  const factory FetchEvent.set({required FetchState state}) = _FetchSet;
}