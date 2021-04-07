import 'dart:async';

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
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    if (this.mounted) {
      setState(() {
        this.loading = true;
      });
      Timer(Duration(microseconds: 3000), () async {
        final locations = await Location.fetchAll();
        setState(() {
          this.locations = locations;
          this.loading = false;
        });
      });
      // check is mounted

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
        body: RefreshIndicator(
            onRefresh: loadData,
            child: Column(
              children: [
                renderProgressBar(context),
                Expanded(child: renderListView(context))
              ],
            )));
  }

  Widget renderListView(BuildContext context) {
    return ListView.builder(
      itemCount: this.locations.length,
      itemBuilder: _listViewItemBuilder,
    );
  }

  Widget renderProgressBar(BuildContext context) {
    return (this.loading
        ? LinearProgressIndicator(
            value: 0.1,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
          )
        : Container());
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
