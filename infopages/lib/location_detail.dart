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
          title: Text(location.name),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _renderBody(context, location)));
  }

  List<Widget> _renderBody(BuildContext context, Location location) {
    var res = <Widget>[_bannerImage(location.url, 170.0)];
    for (LocationFact locfact in location.loc_facts) {
      res.addAll([_secTitle(locfact.title), _secText(locfact.text)]);
    }
    return res;
  }

  Widget _secTitle(String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(25, 25, 25, 10),
        child: Text(text,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 25, color: Colors.black)));
  }

  Widget _secText(String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(25, 15, 25, 15), child: Text(text));
  }

  Widget _bannerImage(String url, double height) {
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: Image.network(url, fit: BoxFit.fitWidth),
    );
  }
}
