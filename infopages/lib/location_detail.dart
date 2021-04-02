import 'package:flutter/material.dart';
import 'package:infopages/models/location.dart';
import 'package:infopages/models/location_fact.dart';

class LocationDetail extends StatelessWidget {
  final Location location;

  LocationDetail(this.location);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello, World!"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _renderFacts(location)));
  }

  Widget _section(String title, Color color) //private method
  {
    return Container(
      decoration: BoxDecoration(color: color),
      child: Text(title),
    );
  }

  List<Widget> _renderFacts(Location location) {
    var res = <Widget>[];
    for (LocationFact locfact in location.loc_facts) {
      res.add(_secTitle(locfact.title));
      res.add(_secText(locfact.text));
    }
    return res;
  }

  Widget _secTitle(String text) {
    return Text(text);
  }

  Widget _secText(String text) {
    return Text(text);
  }
}
