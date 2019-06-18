import 'package:flutter/material.dart';
import 'package:sms/contact.dart';
import 'package:sms/sms.dart';
import 'dart:io';

class DetectionResults extends StatelessWidget {
  ContactQuery contacts = new ContactQuery();
  SmsQuery query = new SmsQuery();

  // This needs to be static because contact-picking happens long before instantiation
  static String address;

  List<SmsMessage> messages;
//  bool _messagesCollected = false;//, _messagesAnalyzed = false;
  List<Widget> conversation;
  int msgCount, abusiveCount;

  static void setContact(String number) {
    address = number;
  }

  void getMessages() async {
    messages = await query.getAllSms;
  }

  List<Widget> createConversation() {
    List<Widget> conversation;
    while (messages == null) {
      sleep(const Duration(seconds: 1));
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

  bool isAbusive(String message) {
    // TODO: Send to detection algorithm
    return message.length % 2 == 0;
  }

  bool sameNumber(String contact, SmsMessage msg2) {
    int address1, address2;

    String temp = contact.replaceAll(r'(', '');
    temp.replaceAll(r')', '');
    temp.replaceAll(r'-', '');
    temp.replaceAll(r' ', '');
    print('address 1: ' + temp);
    address1 = int.parse(temp);

    temp = msg2.address.replaceAll(r'(', '');
    temp.replaceAll(r')', '');
    temp.replaceAll(r'-', '');
    temp.replaceAll(r' ', '');
    print('address 2:' + temp);
    address2 = int.parse(temp);

    return (address1 == address2);
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