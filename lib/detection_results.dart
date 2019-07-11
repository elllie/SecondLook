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
    // floatingactionbutton to pull up another page with just the
    // abusive messages and the percentage and maybe instructions
  }
}

            // 17/24 (69%)
            // of messages were marked abusive
            // toggle abusive only
