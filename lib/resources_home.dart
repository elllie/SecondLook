import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import "awareness_relationship_spectrum.dart";
import "relationship_quiz.dart";
import "detection_home.dart";

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
  List<Widget> defaultPlaces;

  @override
  void initState() {
    super.initState();
    print("initxtzte");
    places.add(
      Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Image(
                  image: AssetImage('assets/OWH_Logo-URL_RGB_2C.png'),
                  fit: BoxFit.contain),
              title: Text('\nOffice of Women\'s Health Helpline\n'),
              subtitle: Text(
                  'phone: 1-800-994-9662 9a—6p ET Mon — Fri\nweb: https://www.womenshealth.gov/relationships-and-safety/get-help'),
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('CALL'),
                    onPressed: () {
                      launch("tel://+18009949662");
                    },
                  ),
                  FlatButton(
                    child: const Text('VISIT WEBSITE'),
                    onPressed: () {
                      launch(
                          "https://www.womenshealth.gov/relationships-and-safety/get-help");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    places.add(
      Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Image(
                  image: AssetImage('assets/hotline-logo4.png'),
                  fit: BoxFit.contain),
              title: Text('\nNational Domestic Violence Hotline\n'),
              subtitle: Text(
                  'phone: 1-800-799-SAFE (7233) 24/7\nweb: http://www.thehotline.org/help/'),
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('CALL'),
                    onPressed: () {
                      launch("tel://+18007997233");
                    },
                  ),
                  FlatButton(
                    child: const Text('VISIT WEBSITE'),
                    onPressed: () {
                      launch("http://www.thehotline.org/help/");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    places.add(
      Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Image(
                  image: AssetImage('assets/lir20-logo-1.png'),
                  fit: BoxFit.contain),
              title: Text('\nNational Dating Abuse Hotline\n'),
              subtitle: Text(
                  'phone: 1-866-331-9474 24/7\nweb: http://www.loveisrespect.org/'),
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('CALL'),
                    onPressed: () {
                      launch("tel://+18663319474");
                    },
                  ),
                  FlatButton(
                    child: const Text('VISIT WEBSITE'),
                    onPressed: () {
                      launch("http://www.loveisrespect.org/");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    places.add(
      Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Image(
                  image: AssetImage('assets/RAINN_Logo_25th.png'),
                  fit: BoxFit.contain),
              title: Text('\nNational Sexual Assault Hotline\n'),
              subtitle: Text(
                  'phone: 1-800-656-4673 24/7\nweb: https://www.rainn.org/get-help (live chat available)'),
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('CALL'),
                    onPressed: () {
                      launch("tel://+18006564673");
                    },
                  ),
                  FlatButton(
                    child: const Text('VISIT WEBSITE'),
                    onPressed: () {
                      launch("https://www.rainn.org/get-help");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    places.add(
      Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Image(
                  image: AssetImage('assets/phone--banner.png'),
                  fit: BoxFit.contain),
              title: Text('\nSuicide Prevention Lifeline\n'),
              subtitle: Text(
                  'phone: 1-800-273-8255 24/7\nweb: https://suicidepreventionlifeline.org/ (live chat available)'),
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('CALL'),
                    onPressed: () {
                      launch("tel://+18002738255");
                    },
                  ),
                  FlatButton(
                    child: const Text('VISIT WEBSITE'),
                    onPressed: () {
                      launch("https://suicidepreventionlifeline.org/");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    defaultPlaces = places;
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SecondLook'),
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            DrawerHeader(
              child: Text('SecondLook', style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Colors.cyan, Colors.pinkAccent])),
            ),
            Text(
              '\n   AWARENESS',
              style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 11.0),
            ),
            ListTile(
              title: Text('The relationship spectrum'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AwarenessRelationshipSpectrum()));
              },
            ),
            ListTile(
              title: Text('Dating abuse statistics'),
              onTap: () {
                print("fax");
              },
            ),
            ListTile(
              title: Text('Relationship quiz'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RelationshipQuizHome()));
              },
            ),
            Text(
              '\n   DETECTION',
              style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 11.0),
            ),
            ListTile(
              title: Text('Analyze messages'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetectionHome()));
              },
            ),
            Text(
              '\n   RESOURCES',
              style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 11.0),
            ),
            ListTile(
              title: Text('In your area'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResourcesHome()));
              },
            ),
          ],
        )),
        body: Padding(
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
                              decoration: InputDecoration(
                                  labelText: 'Enter your location'),
                              controller: _myController,
                              onChanged: (text) async {
                                if (text != _location) {
                                  _location = text;
                                  List<Placemark> placemarks =
                                      await Geolocator()
                                          .placemarkFromAddress(_location);
                                  _placemark = placemarks.elementAt(0);
                                  _position = _placemark.position;
                                  print("location: " +
                                      _position.latitude.toString() +
                                      " lat, " +
                                      _position.longitude.toString() +
                                      " long");
                                  print("named location: " + _location);
                                  if (_location.contains("Sarasota") ||
                                      _location.contains("Manatee") ||
                                      _location.contains("Bradenton")) {
                                    print("a\na\nhoooooooooooonh\nh");
                                    setState(() {
                                      print("set state");
                                      places = new List<Widget>();
                                      places.insert(
                                        0,
                                        Card(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              const ListTile(
                                                leading: Image(
                                                    image: AssetImage(
                                                        'assets/sparcc.png'),
                                                    fit: BoxFit.contain),
                                                title: Text(
                                                    '\nSafe Place and Rape Crisis Center\n'),
                                                subtitle: Text(
                                                    'phone: (941) 365-1976 24/7\nweb: https://www.sparcc.net/'),
                                              ),
                                              ButtonTheme.bar(
                                                // make buttons use the appropriate styles for cards
                                                child: ButtonBar(
                                                  children: <Widget>[
                                                    FlatButton(
                                                      child: const Text('CALL'),
                                                      onPressed: () {
                                                        launch(
                                                            "tel://+19413651976");
                                                      },
                                                    ),
                                                    FlatButton(
                                                      child: const Text(
                                                          'VISIT WEBSITE'),
                                                      onPressed: () {
                                                        launch(
                                                            "https://www.sparcc.net/");
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                                    places.add(
                                      Card(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const ListTile(
                                              leading: Icon(Icons.favorite,
                                                  color: Color(0xFF1976D2)),
                                              title: Text(
                                                  '\nNCF-USFSM Counseling and Wellness Center\n'),
                                              subtitle: Text(
                                                  'phone: 941-487-4254 M-F 8-5\nweb: https://www.ncf.edu/cwc/'),
                                            ),
                                            ButtonTheme.bar(
                                              // make buttons use the appropriate styles for cards
                                              child: ButtonBar(
                                                children: <Widget>[
                                                  FlatButton(
                                                    child: const Text('CALL'),
                                                    onPressed: () {
                                                      launch(
                                                          "tel://+19414874254");
                                                    },
                                                  ),
                                                  FlatButton(
                                                    child: const Text(
                                                        'VISIT WEBSITE'),
                                                    onPressed: () {
                                                      launch(
                                                          "https://www.ncf.edu/cwc/");
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                    places.add(
                                      Card(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const ListTile(
                                              leading: Icon(Icons.favorite,
                                                  color: Color(0xFF1976D2)),
                                              title: Text(
                                                  '\nNew College of Florida Victims Advocate\n'),
                                              subtitle: Text(
                                                  'phone: 941-504-8599\nweb: https://www.ncf.edu/campus-life/title-ix/'),
                                            ),
                                            ButtonTheme.bar(
                                              // make buttons use the appropriate styles for cards
                                              child: ButtonBar(
                                                children: <Widget>[
                                                  FlatButton(
                                                    child: const Text('CALL'),
                                                    onPressed: () {
                                                      launch(
                                                          "tel://+19415048599");
                                                    },
                                                  ),
                                                  FlatButton(
                                                    child: const Text(
                                                        'VISIT WEBSITE'),
                                                    onPressed: () {
                                                      launch(
                                                          "https://www.ncf.edu/campus-life/title-ix/");
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    places = defaultPlaces;
                                  }
                                }
                              },
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.room),
                            onPressed: () async {
                              _position = await Geolocator().getCurrentPosition(
                                  desiredAccuracy: LocationAccuracy.lowest);
                              List<Placemark> placemarks = await Geolocator()
                                  .placemarkFromCoordinates(
                                      _position.latitude, _position.longitude);
                              _placemark = placemarks.elementAt(0);
                              _location = _placemark.locality +
                                  ", " +
                                  _placemark.subAdministrativeArea +
                                  ", " +
                                  _placemark.administrativeArea;
                              print("location: " +
                                  _position.latitude.toString() +
                                  " lat, " +
                                  _position.longitude.toString() +
                                  " long");
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
                ])));
  }
}
