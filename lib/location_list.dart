import 'package:first_flutter_app/location_detail.dart';
import 'package:first_flutter_app/models/location.dart';
import 'package:first_flutter_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LocationList extends StatelessWidget {
  final List<Location> locations;

  LocationList(this.locations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Список записей',
            style: TextStyle(fontFamily: Styles.fontNameDefaut),
          ),
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: _buildCard,
        ));
  }

  Card _buildCard(BuildContext context, int index) {
    return Card(
      child: ListTile(
        leading: _buildCircleAvatar(index),
        title: _buildText(index),
        onTap: () => _buidNavigator(context, locations[index]),
      ),
    );
  }

  void _buidNavigator(BuildContext context, Location location) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationDetail(location)));
  }

  Text _buildText(int index) => Text(locations[index].name);

  CircleAvatar _buildCircleAvatar(int index) {
    return CircleAvatar(
      child: Container(
        constraints: BoxConstraints.tightFor(width: 100.0),
        child: Image.network(
          locations[index].url,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
