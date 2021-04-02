import 'location_fact.dart';

class Location {
  final String name;
  final String url;
  final List<LocationFact> _facts;

  Location({this.name, this.url, List<LocationFact> facts})
      : _facts = facts; // {} optional params

  List<LocationFact> get loc_facts => _facts;
}
