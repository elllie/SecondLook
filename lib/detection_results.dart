import 'package:flutter/material.dart';

class DetectionResults extends StatefulWidget {

  @override
  DetectionResultsState createState() => DetectionResultsState();
}

class DetectionResultsState extends State<DetectionResults> {
  static List<Widget> conversation;
  static int msgCount = 0, abusiveCount = 0;


  @override
  Widget build(BuildContext context) {
    // TODO: add BottomSheet
//    Scaffold.of(context).showBottomSheet((BuildContext context) {
//      return Text("Bottom Text");
//    });
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: conversation,
    );
  }
}

            // 17/24 (69%)
            // of messages were marked abusive
            // toggle abusive only
