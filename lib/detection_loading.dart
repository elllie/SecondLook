import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sms_maintained/sms.dart';
import "detection_results.dart";
import 'package:http/http.dart' as http;

import "awareness_relationship_spectrum.dart";
import "relationship_quiz.dart";
import "resources_home.dart";
import "detection_home.dart";
import "dating_abuse_statistics.dart";
import "main.dart";

class DetectionLoadingState extends State<DetectionLoading> {
  static String phoneNumber;
  static String ip;

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

  void doStuff(Duration d) async {
    // need the Duration so it will work in addPostFrameCallback - don't use it for anything else
    DetectionResults resultsPage = new DetectionResults();
    List msgList = await analyzeMessages();
    createConversation(msgList, resultsPage); // msgList
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => resultsPage));
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
    final double inch =
        0.2 / (messages.length + 2); // how much to move the progress bar
    String messageString = ""; // """"""{ "thread" : [""";
    setState(() {
      progress += inch;
    });
    for (var i = 0; i < messages.length; i++) {
      messageString +=
          """{"body":"${messages.elementAt(i).body}", "date":"${messages.elementAt(i).date.millisecondsSinceEpoch}"}
      """;
//      if (i != messages.length - 1) messageString += ",";
      setState(() {
        progress += inch;
      });
    }
//    messageString += "]}";
    setState(() {
      progress += inch;
    });
    print(messageString);
    return messageString;
  }

  Future<List> analyzeMessages() async {
//    final String ip = "192.168.0.5:5000"; // matt house
    final String ip = "172.16.11.209:5000";    // ncf
    setState(() {
      progress += 0.2;
      currentAction = "Analyzing messages...";
    });
    String cleanMessages = await getMessages();
    var response =
        await http.post(new Uri.http(ip, "/file"), body: cleanMessages);
    print(json.decode(response.body)); // list of maps
    return json.decode(response.body);
  }

  void createConversation(List analyzedMessages, DetectionResults results) {
    DetectionDetails resultDetail = new DetectionDetails();
    List<Widget> conversation = new List<Widget>();
    List<Widget> abusiveOnly = new List<Widget>();
    setState(() {
      currentAction = "Generating report...";
    });

    abusiveOnly.add(Center(
        child: Text(
      "Context matters.\n",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
    )));
    abusiveOnly.add(Text(
        'Each text message on this page has been labeled as abusive by our detection algorithm.\n\nThe algorithm only analyzes one message at a time. It is your job to look at the whole story.\n\nThough our program is written to be accurate, it is NOT a final judgement on the healthiness of your relationship. It is only a tool to aid your personal decision.\n\nIf you need the support of a human, the Resources tab can help.\n'));
    abusiveOnly.add(Center(
        child: FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => results));
            },
            textColor: Colors.pinkAccent,
            child: Text("< Back to all results"))));
    abusiveOnly.add(Text(" "));

    for (var i = analyzedMessages.length - 1; i >= 0; i--) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(
          int.parse(analyzedMessages.elementAt(i)["date"]));
      conversation.add(Text(
        "${date.toLocal()}",
        textAlign: TextAlign.center,
      ));
      if (analyzedMessages.elementAt(i)["abusive"]) {
        abusiveOnly.add(Text(
          "${date.toLocal()}",
          textAlign: TextAlign.center,
        ));
        abusiveOnly.add(new Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          child: Text(analyzedMessages.elementAt(i)["body"],
              style: TextStyle(color: Colors.white)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
              color: Colors.pinkAccent),
        ));
        results.abusiveCount++;
        conversation
            .add(new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(16.0),
//              margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 64.0, bottom: 16.0),
              child: Text(analyzedMessages.elementAt(i)["body"],
                  style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                  color: Colors.pinkAccent),
            ),
          ),
          Icon(Icons.priority_high, color: Colors.pinkAccent, size: 48.0)
        ]));
      } else {
        conversation.add(new Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          child: Text(analyzedMessages.elementAt(i)["body"],
              style: TextStyle(color: Colors.black)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
              color: Theme.of(context).primaryColorLight),
        ));
      }
      results.msgCount++;
      setState(() {
        progress += (0.2 / (analyzedMessages.length + 2));
      });
    }
    abusiveOnly.insert(
        0,
        Center(
            child: Text(
          "${results.abusiveCount} of ${results.msgCount} (${num.parse(((results.abusiveCount / results.msgCount) * 100).toStringAsFixed(2))}%) messages marked abusive\n",
          style: TextStyle(fontSize: 14.0),
        )));
    resultDetail.abusiveList = abusiveOnly;
    resultDetail.count = results.abusiveCount;
    conversation.insert(
        0,
        Center(
            child: Text(
          "${results.abusiveCount} of ${results.msgCount} (${num.parse(((results.abusiveCount / results.msgCount) * 100).toStringAsFixed(2))}%) messages marked abusive\n",
          style: TextStyle(fontSize: 14.0),
        )));
    conversation.insert(
        1,
        Center(
            child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => resultDetail));
                },
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                  Icon(Icons.filter_list),
                  Text("ABUSIVE ONLY")]),
                color: Colors.pinkAccent,
                textColor: Colors.white)));
    conversation.insert(2, Text("\n"));
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
    return Scaffold(
        appBar: AppBar(
          title: Text('SecondLook'),
        ),
        drawer: Drawer(
            child: ListView(
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
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(48.0),
            child: Column(
              children: <Widget>[
                SpinKitPumpingHeart(
                  color: Colors.pinkAccent,
                  size: 96.0,
                ),
                Spacer(),
                Flexible(
                    child: LinearProgressIndicator(
                  value: progress,
                )),
                Text("\n" + currentAction),
              ],
            ),
          ),
        ));
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

  AnalyzedMessage(String address, String body, int date, bool abusive)
      : this.address = address,
        this.body = body,
        this.date = date,
        isAbusive = abusive;
}
