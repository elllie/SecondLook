import 'package:flutter/material.dart';

class ResourcesHome extends StatefulWidget {
  @override
  _ResourcesHomeState createState() => _ResourcesHomeState();
}

class _ResourcesHomeState extends State<ResourcesHome> {
  final _myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: 'Enter your location'),
                          controller: _myController,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.room),
                        onPressed: () {
                          print("pressed location button");
                        },
                      )
                    ],
                  )),
            ]));
  }
}
