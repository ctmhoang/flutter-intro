import 'package:flutter/material.dart';

class LocationDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello, World!"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _section("One!", Colors.red),
            _section("Two!", Colors.green),
            _section("Three! aha", Colors.blue)
          ],
        ));
  }

  Widget _section(String title, Color color) //private method
  {
    return Container(
      decoration: BoxDecoration(color: color),
      child: Text(title),
    );
  }
}
