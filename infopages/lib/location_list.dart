import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infopages/location_detail.dart';
import 'package:infopages/models/location.dart';
import 'package:infopages/styles.dart';

class LocationList extends StatefulWidget {
  @override
  createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  List<Location> locations = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final locations = await Location.fetchAll();
    if (this.mounted) {
      // check is mounted
      setState(() {
        this.locations = locations;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Locations',
        style: Styles.navBarTitle,
      )),
      body: ListView.builder(
        itemCount: this.locations.length,
        itemBuilder: _listViewItemBuilder,
      ),
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: _itemThumbnail(locations[index]),
      title: _itemTitle(locations[index]),
      onTap: () => _navigateToLocationDetail(context, locations[index].id),
    );
  }

  void _navigateToLocationDetail(BuildContext context, int locationIdx) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationDetail(locationIdx)));
  }

  Widget _itemThumbnail(Location location) {
    Image image;
    try {
      image = Image.network(location.url, fit: BoxFit.fitWidth);
    } catch (e) {
      print("could not load image ${location.url}");
    }
    return Container(
      constraints: BoxConstraints.tightFor(width: 100),
      child: image,
    );
  }

  Widget _itemTitle(Location location) {
    return Text(
      '${location.name}', //string interpolation
      style: Styles.textDefault,
    );
  }
}
