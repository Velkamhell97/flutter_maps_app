part of 'search2_bloc.dart';

class Search2State extends Equatable  {

  final bool manual;
  final bool fetching;
  final Feature? last;
  final List<Feature> places;
  final List<Feature> record;

  const Search2State({this.manual = false, this.fetching = false, this.last, this.places = const [], this.record = const []});

  Search2State copyWith({
    bool? manual, 
    bool? fetching,
    Feature? last,
    List<Feature>? record,
    List<Feature>? places,
    bool clear = false
  }) => Search2State(
    manual: manual ?? this.manual,
    fetching: fetching ?? this.fetching,
    last: clear ? null : last ?? this.last,
    record: record ?? this.record,
    places: places ?? this.places
  );

  @override
  List<Object?> get props => [manual, fetching, last, places, record];
}
