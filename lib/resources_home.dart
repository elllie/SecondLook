import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';


class ResourcesHome extends StatefulWidget {
  @override
  _ResourcesHomeState createState() => _ResourcesHomeState();
}

class _ResourcesHomeState extends State<ResourcesHome> {
  final _myController = TextEditingController();
  Position _position; // User's current location.
  Placemark _placemark;
  String _location;
  List<Widget> places = new List<Widget>();

  @override
  void initState() {
    super.initState();
    places.add(Card(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.album), // image view
          title: Text('\nOffice of Women\'s Health Helpline\n'),
          subtitle: Text('phone: 1-800-994-9662 9a—6p ET Mon — Fri\nweb: https://www.womenshealth.gov/relationships-and-safety/get-help'),
        ),
        ButtonTheme.bar( // make buttons use the appropriate styles for cards
          child: ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('CALL'),
                onPressed: () { launch("tel://+18009949662"); },
              ),
              FlatButton(
                child: const Text('VISIT WEBSITE'),
                onPressed: () { launch("https://www.womenshealth.gov/relationships-and-safety/get-help"); },
              ),
            ],
          ),
        ),
      ],
    ),
    ),);
    places.add(Card(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.album), // image view
          title: Text('\nNational Domestic Violence Hotline\n'),
          subtitle: Text('phone: 1-800-799-SAFE (7233) 24/7\nweb: http://www.thehotline.org/help/'),
        ),
        ButtonTheme.bar( // make buttons use the appropriate styles for cards
          child: ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('CALL'),
                onPressed: () { launch("tel://+18007997233"); },
              ),
              FlatButton(
                child: const Text('VISIT WEBSITE'),
                onPressed: () { launch("http://www.thehotline.org/help/"); },
              ),
            ],
          ),
        ),
      ],
    ),
    ),);
    places.add(Card(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.album), // image view
          title: Text('\nNational Dating Abuse Hotline\n'),
          subtitle: Text('phone: 1-866-331-9474 24/7\nweb: http://www.loveisrespect.org/'),
        ),
        ButtonTheme.bar( // make buttons use the appropriate styles for cards
          child: ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('CALL'),
                onPressed: () { launch("tel://+18663319474"); },
              ),
              FlatButton(
                child: const Text('VISIT WEBSITE'),
                onPressed: () { launch("http://www.loveisrespect.org/"); },
              ),
            ],
          ),
        ),
      ],
    ),
    ),);
    places.add(Card(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.album), // image view
          title: Text('\nNational Sexual Assault Hotline\n'),
          subtitle: Text('phone: 1-800-656-4673 24/7\nweb: https://www.rainn.org/get-help (live chat available)'),
        ),
        ButtonTheme.bar( // make buttons use the appropriate styles for cards
          child: ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('CALL'),
                onPressed: () { launch("tel://+18006564673"); },
              ),
              FlatButton(
                child: const Text('VISIT WEBSITE'),
                onPressed: () { launch("https://www.rainn.org/get-help"); },
              ),
            ],
          ),
        ),
      ],
    ),
    ),);
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: 'Enter your location'),
                          controller: _myController,
                          onChanged: (text) async {
                            if (text != _location) {
                              _location = text;
                              List<Placemark> placemarks = await Geolocator().placemarkFromAddress(_location);
                              _placemark = placemarks.elementAt(0);
                              _position = _placemark.position;
                              print("location: " + _position.latitude.toString() + " lat, " + _position.longitude.toString() + " long");
                              print("named location: " + _location);
                            }
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.room),
                        onPressed: () async {
                          _position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
                          List<Placemark> placemarks = await Geolocator().placemarkFromCoordinates(_position.latitude, _position.longitude);
                          _placemark = placemarks.elementAt(0);
                          _location = _placemark.locality + ", " + _placemark.subAdministrativeArea + ", " + _placemark.administrativeArea;
                          print("location: " + _position.latitude.toString() + " lat, " + _position.longitude.toString() + " long");
                          print("named location: " + _location);
                          setState(() {
                            _myController.text = _location;
                          });
                        },
                      )
                    ],
                  )),
            Text(" "),
            Expanded(child: ListView(children: places))
            ]));
  }
}
