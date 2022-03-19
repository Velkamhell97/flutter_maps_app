// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchEventTearOff {
  const _$SearchEventTearOff();

  _SearchAction action({required SearchState state}) {
    return _SearchAction(
      state: state,
    );
  }
}

/// @nodoc
const $SearchEvent = _$SearchEventTearOff();

/// @nodoc
mixin _$SearchEvent {
  SearchState get state => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SearchState state) action,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SearchState state)? action,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SearchState state)? action,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchAction value) action,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchAction value)? action,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchAction value)? action,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchEventCopyWith<SearchEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res>;
  $Res call({SearchState state});

  $SearchStateCopyWith<$Res> get state;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res> implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  final SearchEvent _value;
  // ignore: unused_field
  final $Res Function(SearchEvent) _then;

  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SearchState,
    ));
  }

  @override
  $SearchStateCopyWith<$Res> get state {
    return $SearchStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
abstract class _$SearchActionCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory _$SearchActionCopyWith(
          _SearchAction value, $Res Function(_SearchAction) then) =
      __$SearchActionCopyWithImpl<$Res>;
  @override
  $Res call({SearchState state});

  @override
  $SearchStateCopyWith<$Res> get state;
}

/// @nodoc
class __$SearchActionCopyWithImpl<$Res> extends _$SearchEventCopyWithImpl<$Res>
    implements _$SearchActionCopyWith<$Res> {
  __$SearchActionCopyWithImpl(
      _SearchAction _value, $Res Function(_SearchAction) _then)
      : super(_value, (v) => _then(v as _SearchAction));

  @override
  _SearchAction get _value => super._value as _SearchAction;

  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(_SearchAction(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SearchState,
    ));
  }
}

/// @nodoc

class _$_SearchAction implements _SearchAction {
  const _$_SearchAction({required this.state});

  @override
  final SearchState state;

  @override
  String toString() {
    return 'SearchEvent.action(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchAction &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  _$SearchActionCopyWith<_SearchAction> get copyWith =>
      __$SearchActionCopyWithImpl<_SearchAction>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SearchState state) action,
  }) {
    return action(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SearchState state)? action,
  }) {
    return action?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SearchState state)? action,
    required TResult orElse(),
  }) {
    if (action != null) {
      return action(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchAction value) action,
  }) {
    return action(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchAction value)? action,
  }) {
    return action?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchAction value)? action,
    required TResult orElse(),
  }) {
    if (action != null) {
      return action(this);
    }
    return orElse();
  }
}

abstract class _SearchAction implements SearchEvent {
  const factory _SearchAction({required SearchState state}) = _$_SearchAction;

  @override
  SearchState get state;
  @override
  @JsonKey(ignore: true)
  _$SearchActionCopyWith<_SearchAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SearchStateTearOff {
  const _$SearchStateTearOff();

  _SearchInitial initial() {
    return const _SearchInitial();
  }

  _SearchCanceled canceled() {
    return const _SearchCanceled();
  }

  _SearchManual manual() {
    return const _SearchManual();
  }

  _SearchDone done({required Feature place}) {
    return _SearchDone(
      place: place,
    );
  }
}

/// @nodoc
const $SearchState = _$SearchStateTearOff();

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() canceled,
    required TResult Function() manual,
    required TResult Function(Feature place) done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? canceled,
    TResult Function()? manual,
    TResult Function(Feature place)? done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? canceled,
    TResult Function()? manual,
    TResult Function(Feature place)? done,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchInitial value) initial,
    required TResult Function(_SearchCanceled value) canceled,
    required TResult Function(_SearchManual value) manual,
    required TResult Function(_SearchDone value) done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchInitial value)? initial,
    TResult Function(_SearchCanceled value)? canceled,
    TResult Function(_SearchManual value)? manual,
    TResult Function(_SearchDone value)? done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchInitial value)? initial,
    TResult Function(_SearchCanceled value)? canceled,
    TResult Function(_SearchManual value)? manual,
    TResult Function(_SearchDone value)? done,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;
}

/// @nodoc
abstract class _$SearchInitialCopyWith<$Res> {
  factory _$SearchInitialCopyWith(
          _SearchInitial value, $Res Function(_SearchInitial) then) =
      __$SearchInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$SearchInitialCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchInitialCopyWith<$Res> {
  __$SearchInitialCopyWithImpl(
      _SearchInitial _value, $Res Function(_SearchInitial) _then)
      : super(_value, (v) => _then(v as _SearchInitial));

  @override
  _SearchInitial get _value => super._value as _SearchInitial;
}

/// @nodoc

class _$_SearchInitial implements _SearchInitial {
  const _$_SearchInitial();

  @override
  String toString() {
    return 'SearchState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SearchInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() canceled,
    required TResult Function() manual,
    required TResult Function(Feature place) done,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? canceled,
    TResult Function()? manual,
    TResult Function(Feature place)? done,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? canceled,
    TResult Function()? manual,
    TResult Function(Feature place)? done,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchInitial value) initial,
    required TResult Function(_SearchCanceled value) canceled,
    required TResult Function(_SearchManual value) manual,
    required TResult Function(_SearchDone value) done,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchInitial value)? initial,
    TResult Function(_SearchCanceled value)? canceled,
    TResult Function(_SearchManual value)? manual,
    TResult Function(_SearchDone value)? done,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchInitial value)? initial,
    TResult Function(_SearchCanceled value)? canceled,
    TResult Function(_SearchManual value)? manual,
    TResult Function(_SearchDone value)? done,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SearchInitial implements SearchState {
  const factory _SearchInitial() = _$_SearchInitial;
}

/// @nodoc
abstract class _$SearchCanceledCopyWith<$Res> {
  factory _$SearchCanceledCopyWith(
          _SearchCanceled value, $Res Function(_SearchCanceled) then) =
      __$SearchCanceledCopyWithImpl<$Res>;
}

/// @nodoc
class __$SearchCanceledCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchCanceledCopyWith<$Res> {
  __$SearchCanceledCopyWithImpl(
      _SearchCanceled _value, $Res Function(_SearchCanceled) _then)
      : super(_value, (v) => _then(v as _SearchCanceled));

  @override
  _SearchCanceled get _value => super._value as _SearchCanceled;
}

/// @nodoc

class _$_SearchCanceled implements _SearchCanceled {
  const _$_SearchCanceled();

  @override
  String toString() {
    return 'SearchState.canceled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SearchCanceled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() canceled,
    required TResult Function() manual,
    required TResult Function(Feature place) done,
  }) {
    return canceled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? canceled,
    TResult Function()? manual,
    TResult Function(Feature place)? done,
  }) {
    return canceled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? canceled,
    TResult Function()? manual,
    TResult Function(Feature place)? done,
    required TResult orElse(),
  }) {
    if (canceled != null) {
      return canceled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchInitial value) initial,
    required TResult Function(_SearchCanceled value) canceled,
    required TResult Function(_SearchManual value) manual,
    required TResult Function(_SearchDone value) done,
  }) {
    return canceled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchInitial value)? initial,
    TResult Function(_SearchCanceled value)? canceled,
    TResult Function(_SearchManual value)? manual,
    TResult Function(_SearchDone value)? done,
  }) {
    return canceled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchInitial value)? initial,
    TResult Function(_SearchCanceled value)? canceled,
    TResult Function(_SearchManual value)? manual,
    TResult Function(_SearchDone value)? done,
    required TResult orElse(),
  }) {
    if (canceled != null) {
      return canceled(this);
    }
    return orElse();
  }
}

abstract class _SearchCanceled implements SearchState {
  const factory _SearchCanceled() = _$_SearchCanceled;
}

/// @nodoc
abstract class _$SearchManualCopyWith<$Res> {
  factory _$SearchManualCopyWith(
          _SearchManual value, $Res Function(_SearchManual) then) =
      __$SearchManualCopyWithImpl<$Res>;
}

/// @nodoc
class __$SearchManualCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchManualCopyWith<$Res> {
  __$SearchManualCopyWithImpl(
      _SearchManual _value, $Res Function(_SearchManual) _then)
      : super(_value, (v) => _then(v as _SearchManual));

  @override
  _SearchManual get _value => super._value as _SearchManual;
}

/// @nodoc

class _$_SearchManual implements _SearchManual {
  const _$_SearchManual();

  @override
  String toString() {
    return 'SearchState.manual()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SearchManual);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() canceled,
    required TResult Function() manual,
    required TResult Function(Feature place) done,
  }) {
    return manual();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? canceled,
    TResult Function()? manual,
    TResult Function(Feature place)? done,
  }) {
    return manual?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? canceled,
    TResult Function()? manual,
    TResult Function(Feature place)? done,
    required TResult orElse(),
  }) {
    if (manual != null) {
      return manual();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchInitial value) initial,
    required TResult Function(_SearchCanceled value) canceled,
    required TResult Function(_SearchManual value) manual,
    required TResult Function(_SearchDone value) done,
  }) {
    return manual(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchInitial value)? initial,
    TResult Function(_SearchCanceled value)? canceled,
    TResult Function(_SearchManual value)? manual,
    TResult Function(_SearchDone value)? done,
  }) {
    return manual?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchInitial value)? initial,
    TResult Function(_SearchCanceled value)? canceled,
    TResult Function(_SearchManual value)? manual,
    TResult Function(_SearchDone value)? done,
    required TResult orElse(),
  }) {
    if (manual != null) {
      return manual(this);
    }
    return orElse();
  }
}

abstract class _SearchManual implements SearchState {
  const factory _SearchManual() = _$_SearchManual;
}

/// @nodoc
abstract class _$SearchDoneCopyWith<$Res> {
  factory _$SearchDoneCopyWith(
          _SearchDone value, $Res Function(_SearchDone) then) =
      __$SearchDoneCopyWithImpl<$Res>;
  $Res call({Feature place});
}

/// @nodoc
class __$SearchDoneCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchDoneCopyWith<$Res> {
  __$SearchDoneCopyWithImpl(
      _SearchDone _value, $Res Function(_SearchDone) _then)
      : super(_value, (v) => _then(v as _SearchDone));

  @override
  _SearchDone get _value => super._value as _SearchDone;

  @override
  $Res call({
    Object? place = freezed,
  }) {
    return _then(_SearchDone(
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as Feature,
    ));
  }
}

/// @nodoc

class _$_SearchDone implements _SearchDone {
  const _$_SearchDone({required this.place});

  @override
  final Feature place;

  @override
  String toString() {
    return 'SearchState.done(place: $place)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchDone &&
            const DeepCollectionEquality().equals(other.place, place));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(place));

  @JsonKey(ignore: true)
  @override
  _$SearchDoneCopyWith<_SearchDone> get copyWith =>
      __$SearchDoneCopyWithImpl<_SearchDone>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() canceled,
    required TResult Function() manual,
    required TResult Function(Feature place) done,
  }) {
    return done(place);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? canceled,
    TResult Function()? manual,
    TResult Function(Feature place)? done,
  }) {
    return done?.call(place);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? canceled,
    TResult Function()? manual,
    TResult Function(Feature place)? done,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(place);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchInitial value) initial,
    required TResult Function(_SearchCanceled value) canceled,
    required TResult Function(_SearchManual value) manual,
    required TResult Function(_SearchDone value) done,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchInitial value)? initial,
    TResult Function(_SearchCanceled value)? canceled,
    TResult Function(_SearchManual value)? manual,
    TResult Function(_SearchDone value)? done,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchInitial value)? initial,
    TResult Function(_SearchCanceled value)? canceled,
    TResult Function(_SearchManual value)? manual,
    TResult Function(_SearchDone value)? done,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class _SearchDone implements SearchState {
  const factory _SearchDone({required Feature place}) = _$_SearchDone;

  Feature get place;
  @JsonKey(ignore: true)
  _$SearchDoneCopyWith<_SearchDone> get copyWith =>
      throw _privateConstructorUsedError;
}
