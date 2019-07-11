import 'package:flutter/material.dart';

class DetectionResults extends StatelessWidget {
  List<Widget> conversation;
  int msgCount = 0, abusiveCount = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: conversation,
    );
  }
}

class DetectionDetails extends StatelessWidget {
  List<Widget> abusiveList;
  int count;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: abusiveList,
    );
  }

}