import 'package:json_annotation/json_annotation.dart';

import 'location_fact.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  final String name;
  final String url;
  final List<LocationFact> _facts;

  Location({this.name, this.url, List<LocationFact> facts})
      : _facts = facts; // {} optional params

  List<LocationFact> get loc_facts => _facts;
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
