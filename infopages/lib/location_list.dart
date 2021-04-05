import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infopages/location_detail.dart';
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
        itemBuilder: _listViewItemBuilder,
      ),
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: _itemThumbnail(locations[index]),
      title: _itemTitle(locations[index]),
      onTap: () => _navigateToLocationDetail(context, this.locations[index]),
    );
  }

  void _navigateToLocationDetail(BuildContext context, Location location) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationDetail(location)));
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
