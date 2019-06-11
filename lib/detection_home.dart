import 'package:flutter/material.dart';
import 'package:contact_picker/contact_picker.dart';

class DetectionHome extends StatefulWidget {
  @override
  _DetectionHomeState createState() => _DetectionHomeState();
}

class _DetectionHomeState extends State<DetectionHome> {
  final myController = TextEditingController();
  final ContactPicker _contactPicker = new ContactPicker();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
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
              controller: myController,
            ), ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(child: Text('...or', textAlign: TextAlign.center,),), // Expanded
              RaisedButton(
                onPressed: () async {
                  Contact contact = await _contactPicker.selectContact();
                  setState(() {
                    myController.text = contact.phoneNumber.number;
                  });
                },
                child: const Text('SELECT CONTACT'),
              ),
              Spacer(),
              RaisedButton(
                onPressed: () {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(content: Text(myController.text),);
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