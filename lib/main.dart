import 'dart:convert';

import 'package:first_flutter_app/location_list.dart';
import 'package:first_flutter_app/models/location.dart';
import 'package:flutter/material.dart';
import 'location_detail.dart';
import 'models/post.dart';
import 'package:http/http.dart' as http;

const String TITLE_APP = 'My App';

// void main() => runApp(MyApp());
void mainX() => runApp(MaterialApp(
      title: 'Flutter App',
      home: Scaffold(
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
      ),
    ));

void main2() {
  List<Location> locations = Location.fetchAll();
  // Location location = locations.first;

  runApp(MaterialApp(
    title: 'New App',
    home: LocationList(locations),
  ));
}

Future<Post> fetchPost() async {
  final resp = await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (resp.statusCode == 200) {
    return Post.fromJson(json.decode(resp.body));
  } else {
    throw Exception('failed to load');
  }
}

void main() {
  runApp(MyApp(
//    items: List<String>.generate(100, (i) => "List Item $i"),
      post: fetchPost()));
}

class SecondScreen extends StatelessWidget {
  final String title;

  SecondScreen({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(title)));
  }
}

class MyApp extends StatelessWidget {
  final Future<Post> post;

  MyApp({this.post});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Demo')),
        body: Center(
          child: FutureBuilder<Post>(
            future: post,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data.title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontWeight: FontWeight.normal),
                  textScaleFactor: 1.5,
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
