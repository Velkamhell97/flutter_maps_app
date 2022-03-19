import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class PlacesResponse {
  final String type;
  final List<String> query;
  final List<Feature> features;
  final String attribution;

  const PlacesResponse({
    required this.type,
    required this.query,
    required this.features,
    required this.attribution,
  });

  factory PlacesResponse.fromJson(Map<String, dynamic> json) => PlacesResponse(
    type: json["type"],
    query: List<String>.from(json["query"].map((x) => x.toString())),
    features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
    attribution: json["attribution"],
  );
}

class Feature extends Equatable {
  final String id;
  final String type;
  final List<String> placeType;
  // final int relevance; //-No necesaria y puede venir null
  final Properties? properties;
  final String textEs;
  final String placeNameEs;
  final String text;
  final String placeName;
  final List<double> center;
  final Geometry geometry;
  final List<Context> context;
  final Language? languageEs;
  final Language? language;
  final String? matchingText;
  final String? matchingPlaceName;

  String getName() {
    if(int.tryParse(text) == null){
      return text;
    } else if(context.isNotEmpty) {
      return context[0].text;
    } else {
      return text;
    }
  }

  String getCity() {
    final parts = context.skip(1).fold<String>('', (String p0, Context p1) => p0 + p1.text + ', ');

    if(parts.isEmpty){
      //todo
      return placeName;
    } else {
      return parts.substring(0, parts.length - 2);
    }
  }

  const Feature({
    required this.id,
    required this.type,
    required this.placeType,
    // required this.relevance,
    this.properties,
    required this.textEs,
    required this.placeNameEs,
    required this.text,
    required this.placeName,
    required this.center,
    required this.geometry,
    this.context = const [],
    this.languageEs,
    this.language,
    this.matchingText,
    this.matchingPlaceName,
  });

  LatLng get latlng => LatLng(center[1], center[0]);

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    id: json["id"],
    type: json["type"],
    placeType: List<String>.from(json["place_type"].map((x) => x)),
    // relevance: json["relevance"],
    properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
    textEs: json["text_es"],
    placeNameEs: json["place_name_es"],
    text: json["text"],
    placeName: json["place_name"],
    center: List<double>.from(json["center"].map((x) => x.toDouble())),
    geometry: Geometry.fromJson(json["geometry"]),
    context: json["context"] == null ? [] : List<Context>.from(json["context"].map((x) => Context.fromJson(x))),
    languageEs: json["language_es"] == null ? null : languageValues.map[json["language_es"]],
    language: json["language"] == null ? null : languageValues.map[json["language"]],
    matchingText: json["matching_text"],
    matchingPlaceName: json["matching_place_name"],
  );

  @override
  List<Object> get props => [id];
}

class Context {
  final String id;
  final String textEs;
  final String text;
  final String? wikidata;
  final Language? languageEs;
  final Language? language;
  final String? shortCode;

  const Context({
    required this.id,
    required this.textEs,
    required this.text,
    this.wikidata,
    this.languageEs,
    this.language,
    this.shortCode,
  });

  factory Context.fromJson(Map<String, dynamic> json) => Context(
    id: json["id"],
    textEs: json["text_es"],
    text: json["text"],
    wikidata: json["wikidata"],
    languageEs: json["language_es"] == null ? null : languageValues.map[json["language_es"]],
    language: json["language"] == null ? null : languageValues.map[json["language"]],
    shortCode: json["short_code"],
  );
}

enum Language { ES }

final languageValues = EnumValues({
  "es": Language.ES
});

class Geometry {
  final List<double> coordinates;
  final String type;

  const Geometry({
    required this.coordinates,
    required this.type,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    type: json["type"],
  );
}

class Properties {
  final String? foursquare;
  final bool? landmark;
  final String? address;
  final String? category;
  final String? maki;
  final String? wikidata;

  Properties({
    this.foursquare,
    this.landmark,
    this.address,
    this.category,
    this.maki,
    this.wikidata,
  });
    
  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    foursquare: json["foursquare"],
    landmark: json["landmark"],
    address: json["address"],
    category: json["category"],
    maki: json["maki"],
    wikidata: json["wikidata"],
  );
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
      return reverseMap ??= map.map((k, v) => MapEntry(v, k));
    }
}
