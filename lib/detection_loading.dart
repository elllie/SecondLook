import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sms_maintained/sms.dart';
import "detection_results.dart";

class DetectionLoadingState extends State<DetectionLoading> {
  String _phoneNumber;
  String get phoneNumber => _phoneNumber;
  set phoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
  }

  String _currentAction;
  String get currentAction => _currentAction;
  set currentAction(String action) {
    _currentAction = action;
  }

  SmsQuery query = new SmsQuery();

  void doStuff() {
    DetectionResults resultsPage = new DetectionResults();
  }

  Future<List<SmsMessage>> getMessages() async {
    setState(() {
      currentAction = "Retrieving messages... (Step 1 of 4)";
    });
    return await query.querySms(address: phoneNumber);
  }

  List<SmsMessage> analyzeMessages() {
    List<SmsMessage> messages = getMessages() as List<SmsMessage>;
    setState(() { currentAction = "Preparing for analysis... (Step 2 of 4)"; });
    List<AnalyzedMessage> analyzedMessages;
    setState(() { currentAction = "Analyzing messages... (Step 3 of 4)"; });
    for(var i = 0; i < messages.length; i++) {
      analyzedMessages.add(new AnalyzedMessage(messages.elementAt(i).address, messages.elementAt(i).body, messages.elementAt(i).body.length % 2 == 0));
    }
    // TODO: Add server stuff
    return analyzedMessages;
  }

  void createConversation(List<AnalyzedMessage> analyzedMessages, DetectionResults results) {
    List<Widget> conversation;
    setState(() { currentAction = "Generating report... (Step 4 of 4)"; });
    for(var i = 0; i < analyzedMessages.length; i++) {
      if (phoneNumber == analyzedMessages.elementAt(i).address) { // If the other person sent it.
        if (analyzedMessages.elementAt(i).isAbusive) {
          conversation.add(new Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.pinkAccent[400],
            child: Text(analyzedMessages.elementAt(i).body,  style: TextStyle(color: Colors.white),), // Text
          ));
          results.abusiveCount++;
        } else {
          conversation.add(new Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.grey[200],
            child: Text(analyzedMessages.elementAt(i).body,  style: TextStyle(color: Colors.black),), // Text
          ));
        }
      } else {    // If I sent it.
        conversation.add(new Container(
          padding: EdgeInsets.all(8.0),
          color: Colors.pinkAccent[100],
          child: Text(analyzedMessages.elementAt(i).body,  style: TextStyle(color: Colors.black),), // Text
        ));
      }
      results.msgCount++;
    }
    results.conversation = conversation;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SpinKitPumpingHeart(
            color: Colors.pinkAccent,
            size: 40.0,
          ),
          Spacer(),
          Text(currentAction),
        ],
      ),
    );
  }
}

class DetectionLoading extends StatefulWidget {
  @override
  DetectionLoadingState createState() => DetectionLoadingState();
}

class AnalyzedMessage extends SmsMessage {
  bool isAbusive;

  AnalyzedMessage(String address, String body, bool abusive) :
        isAbusive = abusive,
        super(address, body);
}