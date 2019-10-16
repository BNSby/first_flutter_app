import 'location_fact.dart';

class Location {
  final String name;
  final String url;
  final List<LocationFact> facts;

  Location(this.name, this.url, this.facts);

  static List<Location> fetchAll() {
    return [
      Location('Title 1', 'https://picsum.photos/200', [
        LocationFact('title 01', 'text text text text text text text 01'),
        LocationFact('title 02', 'text text text text text text text 02')
      ]),
      Location('Title 2', 'https://picsum.photos/200', [
        LocationFact('title 20', 'text text text text text text text 20'),
        LocationFact('title 21', 'text text text text text text text 21')
      ]),
      Location('Title 3', 'https://picsum.photos/200', [
        LocationFact('title 30', 'text text text text text text text 30'),
        LocationFact('title 31', 'text text text text text text text 31')
      ])
    ];
  }
}
