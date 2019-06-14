import 'package:flutter/material.dart';
import 'package:sms/contact.dart';
import 'package:sms/sms.dart';

class DetectionResults extends StatelessWidget {
  ContactQuery contacts = new ContactQuery();
  SmsQuery query = new SmsQuery();
  static String address;

  List<SmsMessage> messages;
  List<Widget> conversation;
  int msgCount, abusiveCount;

  static void setContact(String number) {
    address = number;
  }

  Future<void> collectMsgs() async {
    messages =  await query.querySms(address: address);
    print(messages);
  }

  List<Widget> createConversation() {
    List<Widget> conversation;
    messages.sort((msg1, msg2) => msg1.address.compareTo(msg2.address));

    for(var i = 0; i < messages.length; i++) {
      if (sameNumber(address, messages.elementAt(i))) { // If the other person sent it.
        if (isAbusive(messages.elementAt(i).body)) {
          // TODO: Create abusive message container
        } else {
          // TODO: Create non-abusive message container
        }
      } else {    // If I sent it.
        // TODO: Create sent message container
      }
    }
    return conversation;
  }

  bool isAbusive(String message) {
    // TODO: Send to detection algorithm
    return message.length >= 100;
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
    // TODO: implement build
    return null;
  }

}