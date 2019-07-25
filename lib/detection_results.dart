import 'package:flutter/material.dart';
import "awareness_relationship_spectrum.dart";
import "relationship_quiz.dart";
import "resources_home.dart";
import "detection_home.dart";

class DetectionResults extends StatelessWidget {
  List<Widget> conversation;
  int msgCount = 0, abusiveCount = 0;

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
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
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
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: conversation,
        ));
  }
}

class DetectionDetails extends StatelessWidget {
  List<Widget> abusiveList;
  int count;

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
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
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
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: abusiveList,
        ));
  }
}
