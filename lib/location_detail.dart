import 'package:first_flutter_app/models/location.dart';
import 'package:flutter/material.dart';

class LocationDetail extends StatelessWidget {
  // String _title;
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
        children: <Widget>[
          Image.network(location.url),
        ],
      ),
    );
  }

  Widget _section(String title, Color color) {
    return Container(
      decoration: BoxDecoration(color: color),
      child: Text(title),
    );
  }
}
