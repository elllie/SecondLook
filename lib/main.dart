import 'package:flutter/material.dart';
import "awareness_relationship_spectrum.dart";
import "detection_home.dart";
import "resources_home.dart";
import "relationship_quiz.dart";
import "dating_abuse_statistics.dart";
import "detection_loading.dart";

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
      home: new Home(),
      routes: <String, WidgetBuilder>{
        '/awareness': (BuildContext context) => AwarenessHome(),
        '/detection': (BuildContext context) => DetectionHome(),
        '/resources': (BuildContext context) => ResourcesHome(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondLook'),
      ),
      body: Column(children: <Widget>[
        Text(" "),
        Image(image: AssetImage('assets/relationship-spectrum-card-1.png')),
        Center(child: Text('\nWelcome to SecondLook\n', style: Theme.of(context).textTheme.title)),
        Padding(padding: EdgeInsets.symmetric(horizontal: 32.0), child: Text("Here you can learn about dating abuse and the factors that make a relationship healthy, detect abusive patterns in your SMS inbox, and find dating support in your area.\n\nOpen the menu on the left to get started.", textAlign: TextAlign.left,)),
      ],),
      drawer: Drawer(child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          DrawerHeader(
            child: Text('SecondLook', style: TextStyle(color: Colors.white)),
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
                    colors: <Color>[Colors.cyan, Colors.pinkAccent])
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home()));
            },
          ),
          Text('\n   AWARENESS', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 11.0),),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => DatingAbuseStatistics()));
            },
          ),
          ListTile(title: Text('Relationship quiz'), onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RelationshipQuizHome()));
          },),
          Text('\n   DETECTION', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 11.0),),
          ListTile(title: Text('Analyze messages'), onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetectionHome()));
          },),
          Text('\n   RESOURCES', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 11.0),),
          ListTile(title: Text('In your area'), onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResourcesHome()));
          },),
        ],
      )),
    );
  }

}

class SetIP extends StatelessWidget {
  final _myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
              'Format: "192.168.0.14:5000" - the :5000 is necessary for Flask to function. Press Enter to set.'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
                decoration: InputDecoration(labelText: 'Enter IP address'),
                controller: _myController,
                onChanged: (text) async {
                  DetectionLoadingState.ip = _myController.text;
                  print(DetectionLoadingState.ip);
                }),
          ),
        ]);
  }
}

class AwarenessHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        Card(
          child: InkWell(
              splashColor: Theme.of(context).splashColor,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AwarenessRelationshipSpectrum()));
              },
              child: Column(
                children: <Widget>[
                  Image(
                      image:
                          AssetImage('assets/relationship-spectrum-card-1.png'),
                      fit: BoxFit.contain),
                  Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              'The relationship spectrum',
                              style: TextStyle(fontSize: 24.0),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            'Learn the factors that make a relationship healthy, abusive, or somewhere in between',
                            style: TextStyle(color: Colors.black54),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ))
                ],
              )),
        ),
        Card(
          child: InkWell(
              splashColor: Theme.of(context).splashColor,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DatingAbuseStatistics()));
              },
              child: Column(
                children: <Widget>[
                  Image(
                      image: AssetImage('assets/abuse-statistics-3.png'),
                      fit: BoxFit.contain),
                  Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              'Dating abuse statistics',
                              style: TextStyle(fontSize: 24.0),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            'Frequently asked questions about dating abuse',
                            style: TextStyle(color: Colors.black54),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ))
                ],
              )),
        ),
        Card(
          child: InkWell(
            splashColor: Theme.of(context).splashColor,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RelationshipQuizHome()));
            },
            child: Column(
              children: <Widget>[
                Image(
                    image:
                    AssetImage('assets/relationship-quiz-1.png'),
                    fit: BoxFit.contain),
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                              'Relationship quiz',
                            style: TextStyle(fontSize: 24.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text(
                          'Do you know if your relationship is healthy? This quiz can help you find out',
                          style: TextStyle(color: Colors.black54),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ))
              ],
            )
          ),
        ),
      ],
    );
  }
}
