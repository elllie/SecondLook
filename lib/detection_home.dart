import 'package:flutter/material.dart';
import 'package:contact_picker/contact_picker.dart';
import "detection_loading.dart";
import "awareness_relationship_spectrum.dart";
import "relationship_quiz.dart";
import "resources_home.dart";


class DetectionHome extends StatefulWidget {
  @override
  _DetectionHomeState createState() => _DetectionHomeState();
}

class _DetectionHomeState extends State<DetectionHome> {
  final _myController = TextEditingController();
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
                print("fax");
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
                  DetectionLoadingState.phoneNumber = _myController.text;
//                  return showDialog(
//                    context: context,
//                    builder: (context) {
//                      return AlertDialog(
//                        title: Text('Context matters.'),
//                        content: Text('Each text message on the following page has been labeled as “abusive” or “non-abusive” by our detection algorithm.\n\nThe algorithm only analyzes one message at a time. It is your job to look at the whole story.\n\nThough you will see a percentage of abusive messages, it is NOT a final judgement on the healthiness of your relationship. It is only a tool to aid your personal decision.\n\nIf you need the support of a human, the Resources tab can help.'),
//                        actions: <Widget>[
//                          FlatButton(
//                            child: Text('OK', softWrap: true, maxLines: 3, textAlign: TextAlign.right,),
//                            onPressed: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetectionLoading()));
                              // TODO: Create Bottom Sheet
                             // Scaffold.of(context).showBottomSheet(builder);
//                            },
//                          )
//                        ],
//                      );
//                    }
//                  );
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