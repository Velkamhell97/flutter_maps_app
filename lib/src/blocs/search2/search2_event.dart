part of 'search2_bloc.dart';

class Search2Event extends Equatable {
  const Search2Event();

  @override
  List<Object?> get props => [];
}

class Search2ShowMarkerEvent extends Search2Event {}
class Search2HideMarkerEvent extends Search2Event {}

class Search2StartFetchingEvent extends Search2Event {}
class Search2EndFetchingEvent extends Search2Event {}

class Search2AddPlacesEvent extends Search2Event {
  final List<Feature> places;
  const Search2AddPlacesEvent(this.places);
}

class Search2AddRecordEvent extends Search2Event {
  final Feature place;
  const Search2AddRecordEvent(this.place);
}

class Search2SetLastEvent extends Search2Event {
  final Feature? place;
  const Search2SetLastEvent(this.place);
}


