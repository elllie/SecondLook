import 'package:flutter/material.dart';
import "awareness_relationship_spectrum.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SecondLook',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('SecondLook'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'AWARENESS'),
                Tab(text: 'DETECTION'),
                Tab(text: 'RESOURCES'),
              ],
            ),
          ),
          body: TabBarView(children: [
            AwarenessHome(),
            DetectionHome(),
            Text('Resources'),
          ]),
        ),
      ),
    );
  }
}

class AwarenessHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        Card(child: InkWell(
          splashColor: Colors.pinkAccent.withAlpha(30),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AwarenessRelationshipSpectrum()));
            },
          child: const ListTile(
            leading: Icon(Icons.favorite, color: Colors.pinkAccent,),
            title: Text('The relationship spectrum'),
            subtitle: Text('Learn the factors that make a relationship healthy, abusive, or somewhere in between'),
            dense: false,
          ),
          ),
        ),
        Card(child: InkWell(
          splashColor: Colors.pinkAccent.withAlpha(30),
          onTap: () {
            print('Card 2 tapped.');
          },
          child: const ListTile(
            leading: Icon(Icons.live_help, color: Colors.pinkAccent,),
            title: Text('Dating abuse statistics'),
            subtitle: Text('Frequently asked questions about dating abuse'),
            dense: false,
          ),
        ),
        ),
        Card(child: InkWell(
          splashColor: Colors.pinkAccent.withAlpha(30),
          onTap: () {
            print('Card 3 tapped.');
          },
          child: const ListTile(
            leading: Icon(Icons.content_paste, color: Colors.pinkAccent,),
            title: Text('Relationship quiz'),
            subtitle: Text('Are you in an abusive relationship? This quiz can help you find out'),
            dense: false,
          ),
        ),
        ),
      ],
    );
  }

}

class DetectionHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text('This app contains a machine learning algorithm which can detect abusive language patterns in text messages.\n\nSelect a contact or enter any phone number to analyze all the messages that person has sent you.'),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: TextField(decoration: InputDecoration(
            labelText: 'Enter a phone #...'),
            keyboardType: TextInputType.phone,
        ), ),
        Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(child: Text('...or', textAlign: TextAlign.center,),), // Expanded
              RaisedButton(
                onPressed: () {},
                child: const Text('SELECT CONTACT'),
              ),
              Spacer(),
              RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                color: Colors.pinkAccent,
                child: const Text('ANALYZE'),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

class ResourcesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('Resources');
  }
  }




