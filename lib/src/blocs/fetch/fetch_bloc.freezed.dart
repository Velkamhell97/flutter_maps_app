// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FetchEventTearOff {
  const _$FetchEventTearOff();

  _FetchRoute route({required LatLng from, required LatLng to}) {
    return _FetchRoute(
      from: from,
      to: to,
    );
  }

  _FetchPlaces places({required String query, required LatLng proximity}) {
    return _FetchPlaces(
      query: query,
      proximity: proximity,
    );
  }

  _FetchSet set({required FetchState state}) {
    return _FetchSet(
      state: state,
    );
  }
}

/// @nodoc
const $FetchEvent = _$FetchEventTearOff();

/// @nodoc
mixin _$FetchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LatLng from, LatLng to) route,
    required TResult Function(String query, LatLng proximity) places,
    required TResult Function(FetchState state) set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LatLng from, LatLng to)? route,
    TResult Function(String query, LatLng proximity)? places,
    TResult Function(FetchState state)? set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LatLng from, LatLng to)? route,
    TResult Function(String query, LatLng proximity)? places,
    TResult Function(FetchState state)? set,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRoute value) route,
    required TResult Function(_FetchPlaces value) places,
    required TResult Function(_FetchSet value) set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchRoute value)? route,
    TResult Function(_FetchPlaces value)? places,
    TResult Function(_FetchSet value)? set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRoute value)? route,
    TResult Function(_FetchPlaces value)? places,
    TResult Function(_FetchSet value)? set,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchEventCopyWith<$Res> {
  factory $FetchEventCopyWith(
          FetchEvent value, $Res Function(FetchEvent) then) =
      _$FetchEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FetchEventCopyWithImpl<$Res> implements $FetchEventCopyWith<$Res> {
  _$FetchEventCopyWithImpl(this._value, this._then);

  final FetchEvent _value;
  // ignore: unused_field
  final $Res Function(FetchEvent) _then;
}

/// @nodoc
abstract class _$FetchRouteCopyWith<$Res> {
  factory _$FetchRouteCopyWith(
          _FetchRoute value, $Res Function(_FetchRoute) then) =
      __$FetchRouteCopyWithImpl<$Res>;
  $Res call({LatLng from, LatLng to});
}

/// @nodoc
class __$FetchRouteCopyWithImpl<$Res> extends _$FetchEventCopyWithImpl<$Res>
    implements _$FetchRouteCopyWith<$Res> {
  __$FetchRouteCopyWithImpl(
      _FetchRoute _value, $Res Function(_FetchRoute) _then)
      : super(_value, (v) => _then(v as _FetchRoute));

  @override
  _FetchRoute get _value => super._value as _FetchRoute;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_FetchRoute(
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as LatLng,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$_FetchRoute implements _FetchRoute {
  const _$_FetchRoute({required this.from, required this.to});

  @override
  final LatLng from;
  @override
  final LatLng to;

  @override
  String toString() {
    return 'FetchEvent.route(from: $from, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchRoute &&
            const DeepCollectionEquality().equals(other.from, from) &&
            const DeepCollectionEquality().equals(other.to, to));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(from),
      const DeepCollectionEquality().hash(to));

  @JsonKey(ignore: true)
  @override
  _$FetchRouteCopyWith<_FetchRoute> get copyWith =>
      __$FetchRouteCopyWithImpl<_FetchRoute>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LatLng from, LatLng to) route,
    required TResult Function(String query, LatLng proximity) places,
    required TResult Function(FetchState state) set,
  }) {
    return route(from, to);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LatLng from, LatLng to)? route,
    TResult Function(String query, LatLng proximity)? places,
    TResult Function(FetchState state)? set,
  }) {
    return route?.call(from, to);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LatLng from, LatLng to)? route,
    TResult Function(String query, LatLng proximity)? places,
    TResult Function(FetchState state)? set,
    required TResult orElse(),
  }) {
    if (route != null) {
      return route(from, to);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRoute value) route,
    required TResult Function(_FetchPlaces value) places,
    required TResult Function(_FetchSet value) set,
  }) {
    return route(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchRoute value)? route,
    TResult Function(_FetchPlaces value)? places,
    TResult Function(_FetchSet value)? set,
  }) {
    return route?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRoute value)? route,
    TResult Function(_FetchPlaces value)? places,
    TResult Function(_FetchSet value)? set,
    required TResult orElse(),
  }) {
    if (route != null) {
      return route(this);
    }
    return orElse();
  }
}

abstract class _FetchRoute implements FetchEvent {
  const factory _FetchRoute({required LatLng from, required LatLng to}) =
      _$_FetchRoute;

  LatLng get from;
  LatLng get to;
  @JsonKey(ignore: true)
  _$FetchRouteCopyWith<_FetchRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FetchPlacesCopyWith<$Res> {
  factory _$FetchPlacesCopyWith(
          _FetchPlaces value, $Res Function(_FetchPlaces) then) =
      __$FetchPlacesCopyWithImpl<$Res>;
  $Res call({String query, LatLng proximity});
}

/// @nodoc
class __$FetchPlacesCopyWithImpl<$Res> extends _$FetchEventCopyWithImpl<$Res>
    implements _$FetchPlacesCopyWith<$Res> {
  __$FetchPlacesCopyWithImpl(
      _FetchPlaces _value, $Res Function(_FetchPlaces) _then)
      : super(_value, (v) => _then(v as _FetchPlaces));

  @override
  _FetchPlaces get _value => super._value as _FetchPlaces;

  @override
  $Res call({
    Object? query = freezed,
    Object? proximity = freezed,
  }) {
    return _then(_FetchPlaces(
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      proximity: proximity == freezed
          ? _value.proximity
          : proximity // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$_FetchPlaces implements _FetchPlaces {
  const _$_FetchPlaces({required this.query, required this.proximity});

  @override
  final String query;
  @override
  final LatLng proximity;

  @override
  String toString() {
    return 'FetchEvent.places(query: $query, proximity: $proximity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchPlaces &&
            const DeepCollectionEquality().equals(other.query, query) &&
            const DeepCollectionEquality().equals(other.proximity, proximity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(query),
      const DeepCollectionEquality().hash(proximity));

  @JsonKey(ignore: true)
  @override
  _$FetchPlacesCopyWith<_FetchPlaces> get copyWith =>
      __$FetchPlacesCopyWithImpl<_FetchPlaces>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LatLng from, LatLng to) route,
    required TResult Function(String query, LatLng proximity) places,
    required TResult Function(FetchState state) set,
  }) {
    return places(query, proximity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LatLng from, LatLng to)? route,
    TResult Function(String query, LatLng proximity)? places,
    TResult Function(FetchState state)? set,
  }) {
    return places?.call(query, proximity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LatLng from, LatLng to)? route,
    TResult Function(String query, LatLng proximity)? places,
    TResult Function(FetchState state)? set,
    required TResult orElse(),
  }) {
    if (places != null) {
      return places(query, proximity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRoute value) route,
    required TResult Function(_FetchPlaces value) places,
    required TResult Function(_FetchSet value) set,
  }) {
    return places(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchRoute value)? route,
    TResult Function(_FetchPlaces value)? places,
    TResult Function(_FetchSet value)? set,
  }) {
    return places?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRoute value)? route,
    TResult Function(_FetchPlaces value)? places,
    TResult Function(_FetchSet value)? set,
    required TResult orElse(),
  }) {
    if (places != null) {
      return places(this);
    }
    return orElse();
  }
}

abstract class _FetchPlaces implements FetchEvent {
  const factory _FetchPlaces(
      {required String query, required LatLng proximity}) = _$_FetchPlaces;

  String get query;
  LatLng get proximity;
  @JsonKey(ignore: true)
  _$FetchPlacesCopyWith<_FetchPlaces> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FetchSetCopyWith<$Res> {
  factory _$FetchSetCopyWith(_FetchSet value, $Res Function(_FetchSet) then) =
      __$FetchSetCopyWithImpl<$Res>;
  $Res call({FetchState state});

  $FetchStateCopyWith<$Res> get state;
}

/// @nodoc
class __$FetchSetCopyWithImpl<$Res> extends _$FetchEventCopyWithImpl<$Res>
    implements _$FetchSetCopyWith<$Res> {
  __$FetchSetCopyWithImpl(_FetchSet _value, $Res Function(_FetchSet) _then)
      : super(_value, (v) => _then(v as _FetchSet));

  @override
  _FetchSet get _value => super._value as _FetchSet;

  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(_FetchSet(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as FetchState,
    ));
  }

  @override
  $FetchStateCopyWith<$Res> get state {
    return $FetchStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$_FetchSet implements _FetchSet {
  const _$_FetchSet({required this.state});

  @override
  final FetchState state;

  @override
  String toString() {
    return 'FetchEvent.set(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchSet &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  _$FetchSetCopyWith<_FetchSet> get copyWith =>
      __$FetchSetCopyWithImpl<_FetchSet>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LatLng from, LatLng to) route,
    required TResult Function(String query, LatLng proximity) places,
    required TResult Function(FetchState state) set,
  }) {
    return set(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LatLng from, LatLng to)? route,
    TResult Function(String query, LatLng proximity)? places,
    TResult Function(FetchState state)? set,
  }) {
    return set?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LatLng from, LatLng to)? route,
    TResult Function(String query, LatLng proximity)? places,
    TResult Function(FetchState state)? set,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRoute value) route,
    required TResult Function(_FetchPlaces value) places,
    required TResult Function(_FetchSet value) set,
  }) {
    return set(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchRoute value)? route,
    TResult Function(_FetchPlaces value)? places,
    TResult Function(_FetchSet value)? set,
  }) {
    return set?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRoute value)? route,
    TResult Function(_FetchPlaces value)? places,
    TResult Function(_FetchSet value)? set,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(this);
    }
    return orElse();
  }
}

abstract class _FetchSet implements FetchEvent {
  const factory _FetchSet({required FetchState state}) = _$_FetchSet;

  FetchState get state;
  @JsonKey(ignore: true)
  _$FetchSetCopyWith<_FetchSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$FetchStateTearOff {
  const _$FetchStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _Error error({required String error}) {
    return _Error(
      error: error,
    );
  }

  _Routed routed({required TrafficResponse directions}) {
    return _Routed(
      directions: directions,
    );
  }

  _Suggested suggested({required List<Feature> places}) {
    return _Suggested(
      places: places,
    );
  }
}

/// @nodoc
const $FetchState = _$FetchStateTearOff();

/// @nodoc
mixin _$FetchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(TrafficResponse directions) routed,
    required TResult Function(List<Feature> places) suggested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(TrafficResponse directions)? routed,
    TResult Function(List<Feature> places)? suggested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(TrafficResponse directions)? routed,
    TResult Function(List<Feature> places)? suggested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Routed value) routed,
    required TResult Function(_Suggested value) suggested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Routed value)? routed,
    TResult Function(_Suggested value)? suggested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Routed value)? routed,
    TResult Function(_Suggested value)? suggested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchStateCopyWith<$Res> {
  factory $FetchStateCopyWith(
          FetchState value, $Res Function(FetchState) then) =
      _$FetchStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FetchStateCopyWithImpl<$Res> implements $FetchStateCopyWith<$Res> {
  _$FetchStateCopyWithImpl(this._value, this._then);

  final FetchState _value;
  // ignore: unused_field
  final $Res Function(FetchState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$FetchStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'FetchState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(TrafficResponse directions) routed,
    required TResult Function(List<Feature> places) suggested,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(TrafficResponse directions)? routed,
    TResult Function(List<Feature> places)? suggested,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(TrafficResponse directions)? routed,
    TResult Function(List<Feature> places)? suggested,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Routed value) routed,
    required TResult Function(_Suggested value) suggested,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Routed value)? routed,
    TResult Function(_Suggested value)? suggested,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Routed value)? routed,
    TResult Function(_Suggested value)? suggested,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FetchState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$FetchStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'FetchState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(TrafficResponse directions) routed,
    required TResult Function(List<Feature> places) suggested,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(TrafficResponse directions)? routed,
    TResult Function(List<Feature> places)? suggested,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(TrafficResponse directions)? routed,
    TResult Function(List<Feature> places)? suggested,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Routed value) routed,
    required TResult Function(_Suggested value) suggested,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Routed value)? routed,
    TResult Function(_Suggested value)? suggested,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Routed value)? routed,
    TResult Function(_Suggested value)? suggested,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements FetchState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$FetchStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_Error(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'FetchState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(TrafficResponse directions) routed,
    required TResult Function(List<Feature> places) suggested,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(TrafficResponse directions)? routed,
    TResult Function(List<Feature> places)? suggested,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(TrafficResponse directions)? routed,
    TResult Function(List<Feature> places)? suggested,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Routed value) routed,
    required TResult Function(_Suggested value) suggested,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Routed value)? routed,
    TResult Function(_Suggested value)? suggested,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Routed value)? routed,
    TResult Function(_Suggested value)? suggested,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements FetchState {
  const factory _Error({required String error}) = _$_Error;

  String get error;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RoutedCopyWith<$Res> {
  factory _$RoutedCopyWith(_Routed value, $Res Function(_Routed) then) =
      __$RoutedCopyWithImpl<$Res>;
  $Res call({TrafficResponse directions});
}

/// @nodoc
class __$RoutedCopyWithImpl<$Res> extends _$FetchStateCopyWithImpl<$Res>
    implements _$RoutedCopyWith<$Res> {
  __$RoutedCopyWithImpl(_Routed _value, $Res Function(_Routed) _then)
      : super(_value, (v) => _then(v as _Routed));

  @override
  _Routed get _value => super._value as _Routed;

  @override
  $Res call({
    Object? directions = freezed,
  }) {
    return _then(_Routed(
      directions: directions == freezed
          ? _value.directions
          : directions // ignore: cast_nullable_to_non_nullable
              as TrafficResponse,
    ));
  }
}

/// @nodoc

class _$_Routed implements _Routed {
  const _$_Routed({required this.directions});

  @override
  final TrafficResponse directions;

  @override
  String toString() {
    return 'FetchState.routed(directions: $directions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Routed &&
            const DeepCollectionEquality()
                .equals(other.directions, directions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(directions));

  @JsonKey(ignore: true)
  @override
  _$RoutedCopyWith<_Routed> get copyWith =>
      __$RoutedCopyWithImpl<_Routed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(TrafficResponse directions) routed,
    required TResult Function(List<Feature> places) suggested,
  }) {
    return routed(directions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(TrafficResponse directions)? routed,
    TResult Function(List<Feature> places)? suggested,
  }) {
    return routed?.call(directions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(TrafficResponse directions)? routed,
    TResult Function(List<Feature> places)? suggested,
    required TResult orElse(),
  }) {
    if (routed != null) {
      return routed(directions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Routed value) routed,
    required TResult Function(_Suggested value) suggested,
  }) {
    return routed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Routed value)? routed,
    TResult Function(_Suggested value)? suggested,
  }) {
    return routed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Routed value)? routed,
    TResult Function(_Suggested value)? suggested,
    required TResult orElse(),
  }) {
    if (routed != null) {
      return routed(this);
    }
    return orElse();
  }
}

abstract class _Routed implements FetchState {
  const factory _Routed({required TrafficResponse directions}) = _$_Routed;

  TrafficResponse get directions;
  @JsonKey(ignore: true)
  _$RoutedCopyWith<_Routed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SuggestedCopyWith<$Res> {
  factory _$SuggestedCopyWith(
          _Suggested value, $Res Function(_Suggested) then) =
      __$SuggestedCopyWithImpl<$Res>;
  $Res call({List<Feature> places});
}

/// @nodoc
class __$SuggestedCopyWithImpl<$Res> extends _$FetchStateCopyWithImpl<$Res>
    implements _$SuggestedCopyWith<$Res> {
  __$SuggestedCopyWithImpl(_Suggested _value, $Res Function(_Suggested) _then)
      : super(_value, (v) => _then(v as _Suggested));

  @override
  _Suggested get _value => super._value as _Suggested;

  @override
  $Res call({
    Object? places = freezed,
  }) {
    return _then(_Suggested(
      places: places == freezed
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Feature>,
    ));
  }
}

/// @nodoc

class _$_Suggested implements _Suggested {
  const _$_Suggested({required this.places});

  @override
  final List<Feature> places;

  @override
  String toString() {
    return 'FetchState.suggested(places: $places)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Suggested &&
            const DeepCollectionEquality().equals(other.places, places));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(places));

  @JsonKey(ignore: true)
  @override
  _$SuggestedCopyWith<_Suggested> get copyWith =>
      __$SuggestedCopyWithImpl<_Suggested>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(TrafficResponse directions) routed,
    required TResult Function(List<Feature> places) suggested,
  }) {
    return suggested(places);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(TrafficResponse directions)? routed,
    TResult Function(List<Feature> places)? suggested,
  }) {
    return suggested?.call(places);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(TrafficResponse directions)? routed,
    TResult Function(List<Feature> places)? suggested,
    required TResult orElse(),
  }) {
    if (suggested != null) {
      return suggested(places);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Routed value) routed,
    required TResult Function(_Suggested value) suggested,
  }) {
    return suggested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Routed value)? routed,
    TResult Function(_Suggested value)? suggested,
  }) {
    return suggested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Routed value)? routed,
    TResult Function(_Suggested value)? suggested,
    required TResult orElse(),
  }) {
    if (suggested != null) {
      return suggested(this);
    }
    return orElse();
  }
}

abstract class _Suggested implements FetchState {
  const factory _Suggested({required List<Feature> places}) = _$_Suggested;

  List<Feature> get places;
  @JsonKey(ignore: true)
  _$SuggestedCopyWith<_Suggested> get copyWith =>
      throw _privateConstructorUsedError;
}
