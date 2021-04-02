import 'package:flutter/material.dart';
import 'package:infopages/location_list.dart';
import 'package:infopages/mocks/mock_location.dart';

void main() {
  return runApp(MaterialApp(home: LocationList(MockLocation.FetchAll())));
}
