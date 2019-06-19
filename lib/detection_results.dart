import 'package:flutter/material.dart';

class DetectionResults extends StatelessWidget {
  List<Widget> conversation;
  int msgCount = 0, abusiveCount = 0;

  List<Widget> createConversation() {
    List<Widget> conversation;
    while (messages == null) {
      Future sleepy = Future.delayed(Duration(seconds: 30));
    }
    messages.sort((msg1, msg2) => msg1.dateSent.compareTo(msg2.dateSent));

    for(var i = 0; i < messages.length; i++) {
      if (sameNumber(address, messages.elementAt(i))) { // If the other person sent it.
        if (isAbusive(messages.elementAt(i).body)) {
          conversation.add(new Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.pinkAccent[400],
            child: Text(messages.elementAt(i).body,  style: TextStyle(color: Colors.white),), // Text
          ));
          abusiveCount++;
        } else {
          conversation.add(new Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.grey[200],
            child: Text(messages.elementAt(i).body,  style: TextStyle(color: Colors.black),), // Text
          ));
        }
      } else {    // If I sent it.
        conversation.add(new Container(
          padding: EdgeInsets.all(8.0),
          color: Colors.pinkAccent[100],
          child: Text(messages.elementAt(i).body,  style: TextStyle(color: Colors.black),), // Text
        ));
      }
      msgCount++;
    }
    return conversation;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: add BottomSheet
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: createConversation() as List<Widget>,
    );
  }

}