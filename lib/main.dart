import 'package:flutter/material.dart';
import "awareness_relationship_spectrum.dart";
import "detection_home.dart";
import "resources_home.dart";
import "relationship_quiz.dart";

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
        primarySwatch: Colors.cyan,
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
//            AwarenessHome(),
            Navigator(
              initialRoute: '/awareness',
              onGenerateRoute: (routeSettings) {
                return MaterialPageRoute(
                    builder: (context) => AwarenessHome());
              },
          ),
            Navigator(
              initialRoute: '/detection',
              onGenerateRoute: (routeSettings) {
                return MaterialPageRoute(
                  builder: (context) => DetectionHome());
              },
            ),
            ResourcesHome(),
          ]),
        ),
      ),
      routes: <String, WidgetBuilder> {
        '/awareness': (BuildContext context) => AwarenessHome(),
        '/detection': (BuildContext context) => DetectionHome(),
        '/resources': (BuildContext context) => ResourcesHome(),
      },
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
          splashColor: Theme.of(context).splashColor,
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
          splashColor: Theme.of(context).splashColor,
          onTap: () {
            print('Card 2 tapped.');
          },
          child: const ListTile(
            leading: Icon(Icons.live_help, color: Colors.pinkAccent),
            title: Text('Dating abuse statistics'),
            subtitle: Text('Frequently asked questions about dating abuse'),
            dense: false,
          ),
        ),
        ),
        Card(child: InkWell(
          splashColor: Theme.of(context).splashColor,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RelationshipQuizHome()));
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





