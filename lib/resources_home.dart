import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class ResourcesHome extends StatefulWidget {
  @override
  _ResourcesHomeState createState() => _ResourcesHomeState();
}

class _ResourcesHomeState extends State<ResourcesHome> {
  final _myController = TextEditingController();
  Position _position; // User's current location.
  Placemark _placemark;
  String _location;

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
            ]));
  }
}
