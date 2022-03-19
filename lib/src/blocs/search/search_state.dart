part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _SearchInitial;
  const factory SearchState.canceled() = _SearchCanceled;
  const factory SearchState.manual() = _SearchManual;
  const factory SearchState.done({required Feature place}) = _SearchDone; //Los arguemntos deben ser nombrados
}
