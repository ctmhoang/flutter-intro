import 'location_fact.dart';

class Location {
  final String name;
  final String url;
  final List<LocationFact> facts;

  Location({this.name, this.url, this.facts}); // {} optional params

  List<LocationFact> get loc_facts => facts;
}
