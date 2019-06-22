import 'package:flutter/material.dart';

class DetectionResults extends StatelessWidget {
  List<Widget> conversation;
  int msgCount = 0, abusiveCount = 0;




  @override
  Widget build(BuildContext context) {
    // TODO: add BottomSheet
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: conversation,
    );
  }

}