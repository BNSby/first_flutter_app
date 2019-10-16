import 'package:flutter/material.dart';

class LocationDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title of App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blueGrey[200]),
            child: Center(child: Text('data 25')),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.yellow),
            child: Text('data 25'),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('data 25'),
          ),
        ],
      ),
    );
  }
}
