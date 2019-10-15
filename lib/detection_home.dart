import 'package:flutter/material.dart';
import 'package:contact_picker/contact_picker.dart';
import "detection_loading.dart";
import "awareness_relationship_spectrum.dart";
import "relationship_quiz.dart";
import "resources_home.dart";
import "dating_abuse_statistics.dart";
import "main.dart";


class DetectionHome extends StatefulWidget {
  @override
  _DetectionHomeState createState() => _DetectionHomeState();
}

class _DetectionHomeState extends State<DetectionHome> {
  final _myController = TextEditingController();
  final _ipController = TextEditingController();
  final ContactPicker _contactPicker = new ContactPicker();

//  public
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
//        ListTile(
//          title: Text('Set Flask IP address'),
//          onTap: () {
//            Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) => new Scaffold(
//                      appBar: AppBar(title: Text("Set IP address")),
//                      body: Padding(
//                        padding: EdgeInsets.all(16.0),
//                        child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.center,
//                            mainAxisAlignment: MainAxisAlignment.start,
//                            children: <Widget>[
//                            Text('Enter the IP address of the server.\n\nNote: must have :5000 at the end, otherwise a random port number will be selected'),
//                        Padding(
//                          padding: EdgeInsets.symmetric(vertical: 8.0),
//                          child: TextField(
//                            decoration: InputDecoration(labelText: '123.456.7.89:5000'),
//                            controller: _ipController,
//                          ), ),
//                              RaisedButton(child: Text('SET'), onPressed: () {
//                                DetectionLoadingState.ip = _ipController.text;
//                              },)
//                    ]))))
//            );},),
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
    body: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('This app contains a machine learning algorithm which can detect abusive language patterns in text messages.\n\nSelect a contact or enter any phone number to analyze all the messages that person has sent you.'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Enter a phone #...'),
              keyboardType: TextInputType.phone,
              controller: _myController,
            ), ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(child: Text('...or', textAlign: TextAlign.center,),), // Expanded
              RaisedButton(
                onPressed: () async {
                  Contact contact = await _contactPicker.selectContact();
                  setState(() {
                    _myController.text = contact.phoneNumber.number;
                  });
                },
                child: const Text('SELECT CONTACT'),
              ),
              Spacer(),
              RaisedButton(
                onPressed: () {
                  String num = _myController.text;
                  String num2 = "";
                  for(int i=0; i<num.length; i++) {
                    var char = num[i];
                    if (char.contains(new RegExp(r'[0-9]'))) num2 += char;
                    print(num2);
                  }

                  if (num2.startsWith('1')) num2 = "+" + num2;
                  else num2 = "+1" + num2;
                  print(num2);

                  DetectionLoadingState.phoneNumber = num2;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetectionLoading()));
                },
                textColor: Colors.white,
                color: Colors.pinkAccent,
                child: const Text('ANALYZE'),
              ),
            ],
          ),
        ],
      ),
    ));
  }

}