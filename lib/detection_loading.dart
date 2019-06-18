import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sms_maintained/sms.dart';

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