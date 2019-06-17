import 'package:flutter/material.dart';
import 'package:contact_picker/contact_picker.dart';
import "detection_results.dart";

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
    return Padding(
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
                  DetectionResults.setContact(_myController.text);
//                  DetectionResults().createConversation();
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Context matters.'),
                        content: Text('Each text message on the following page has been labeled as “abusive” or “non-abusive” by our detection algorithm.\n\nThe algorithm only analyzes one message at a time. It is your job to look at the whole story.\n\nThough you will see a percentage of abusive messages, it is NOT a final judgement on the healthiness of your relationship. It is only a tool to aid your personal decision.\n\nIf you need the support of a human, the Resources tab can help.'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('I UNDERSTAND, SHOW\nME THE RESULTS', softWrap: true, maxLines: 3, textAlign: TextAlign.right,),
                            onPressed: () async {
                              DetectionResults resultsPage = new DetectionResults();
                              resultsPage.getMessages();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => resultsPage));
                              // TODO: Create Bottom Sheet
                             // Scaffold.of(context).showBottomSheet(builder);
                            },
                          )
                        ],
                      );
                    }
                  );
                },
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