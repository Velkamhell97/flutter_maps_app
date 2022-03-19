part of 'fetch_bloc.dart';

@freezed
class FetchState with _$FetchState {
  const factory FetchState.initial() = _Initial;
  const factory FetchState.loading() = _Loading;
  const factory FetchState.error({required String error}) = _Error;
  const factory FetchState.routed({required TrafficResponse directions}) = _Routed;
  const factory FetchState.suggested({required List<Feature> places}) = _Suggested;
}
