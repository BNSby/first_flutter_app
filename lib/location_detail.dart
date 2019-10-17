import 'package:first_flutter_app/models/location.dart';
import 'package:first_flutter_app/styles.dart';
import 'package:flutter/material.dart';

class LocationDetail extends StatelessWidget {
  // String _title;
  final Location location;
  LocationDetail(this.location);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          location.name,
          style: TextStyle(fontFamily: Styles.fontNameDefaut),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _bannerImage(location.url, 150.0),
        ]..addAll(_listOfWidget(location)),
      ),
    );
  }

  Widget _bannerImage(String url, double height) {
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: Image.network(url, fit: BoxFit.fitWidth),
    );
  }

  List<Widget> _listOfWidget(Location location) {
    return location.facts
        .map((fact) => _section(fact.title, fact.text))
        .toList();
  }

  Widget _section(String title, String text) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: Styles.headerLarge,
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
              child: Text(text))
        ],
      ),
    );
  }
}
