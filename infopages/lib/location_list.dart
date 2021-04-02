import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infopages/models/location.dart';
import 'package:infopages/styles.dart';

class LocationList extends StatelessWidget {
  final List<Location> locations;

  LocationList(this.locations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Locations',
        style: Styles.navBarTitle,
      )),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) => ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: _itemThumbnail(locations[index]),
          title: _itemTitle(locations[index]),
        ),
      ),
    );
  }

  Widget _itemThumbnail(Location location) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 100),
      child: Image.network(
        location.url,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _itemTitle(Location location) {
    return Text(
      '${location.name}', //string interpolation
      style: Styles.textDefault,
    );
  }
}
