import 'package:flutter/material.dart';
import 'package:infopages/mocks/mock_location.dart';
import 'location_detail.dart';

void main() {
  return runApp(MaterialApp(home: LocationDetail(MockLocation.FetchAny())));
}
