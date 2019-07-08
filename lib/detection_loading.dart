import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sms_maintained/sms.dart';
import "detection_results.dart";
import 'package:http/http.dart' as http;

class DetectionLoadingState extends State<DetectionLoading> {
  static String phoneNumber;

  String _currentAction = "Starting up...";
  String get currentAction => _currentAction;
  set currentAction(String action) {
    _currentAction = action;
  }
  double progress = 0.0;

  SmsQuery query = new SmsQuery();

  @override
  void initState() {
    super.initState();
    doStuff(Duration(microseconds: 1));
  }

  void doStuff(Duration d) async { // need the Duration so it will work in addPostFrameCallback - don't use it for anything else
    DetectionResults resultsPage = new DetectionResults();
    List msgList = await analyzeMessages();
    createConversation(msgList, resultsPage); // msgList
    Navigator.push(context, MaterialPageRoute(builder: (context) => resultsPage));
  }

  Future<String> getMessages() async {
    setState(() {
      currentAction = "Retrieving messages...";
    });
    List<SmsMessage> messages = await query.querySms(address: phoneNumber);
    setState(() {
      progress += 0.2;
      currentAction = "Preparing for analysis...";
    });
    final double inch = 0.2 / (messages.length + 2);    // how much to move the progress bar
    String messageString = "";// """"""{ "thread" : [""";
    setState(() { progress += inch; });
    for (var i = 0; i < messages.length; i++) {
      messageString += """{"body":"${messages.elementAt(i).body}", "date":"${messages.elementAt(i).date.millisecondsSinceEpoch}"}
      """;
//      if (i != messages.length - 1) messageString += ",";
      setState(() {
        progress += inch;
      });
    }
//    messageString += "]}";
    setState(() { progress += inch; });
    print(messageString);
    return messageString;
  }

  Future<List> analyzeMessages() async {
    final String ip = "192.168.0.14:5000";    // matt house
//    final String ip = "172.16.8.88:5000";    // ncf
    setState(() { currentAction = "Analyzing messages..."; });
    String cleanMessages = await getMessages();
    var response = await http.post(new Uri.http(ip, "/file"), body: cleanMessages);
    print(json.decode(response.body));  // list of maps
    return json.decode(response.body);
  }

  void createConversation(List analyzedMessages, DetectionResults results) {
    List<Widget> conversation = new List<Widget>();
    setState(() { currentAction = "Generating report..."; });
    List abusiveOnly = new List<Map>();
    for(var i = analyzedMessages.length - 1; i >= 0; i--) {
      if (analyzedMessages.elementAt(i)["abusive"]) {
        abusiveOnly.add(analyzedMessages.elementAt(i));
        results.abusiveCount++;
        conversation.add(new Container(
          padding: EdgeInsets.all(20.0),
          child: Text(analyzedMessages.elementAt(i)["body"],
                      style: TextStyle(color: Colors.white)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
              color: Colors.pinkAccent),
        ));
      } else {
        conversation.add(new Container(
          padding: EdgeInsets.all(20.0),
          child: Text(analyzedMessages.elementAt(i)["body"],
              style: TextStyle(color: Colors.black)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
              color: Theme.of(context).primaryColorLight),
        ));
      }
      results.msgCount++;
    }
    results.conversation = conversation;
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    WidgetsBinding.instance.addPostFrameCallback(doStuff);
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SpinKitPumpingHeart(
            color: Colors.pinkAccent,
            size: 40.0,
          ),
          Spacer(),
          LinearProgressIndicator(
            value: progress,
          ),
          Spacer(),
          Text(currentAction),
        ],
      ),
    ),
    );
  }
}

class DetectionLoading extends StatefulWidget {
  @override
  DetectionLoadingState createState() => DetectionLoadingState();

}

class AnalyzedMessage {
  String address;
  String body;
  int date;
  bool isAbusive;

  AnalyzedMessage(String address, String body, int date, bool abusive) :
      this.address = address,
      this.body = body,
      this.date = date,
      isAbusive = abusive;
}