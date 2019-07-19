import 'package:flutter/material.dart';

class AwarenessRelationshipSpectrum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Text("\nThe Relationship Spectrum\n", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0),
        textAlign: TextAlign.center,),
      Text("\nAll relationships exist on a spectrum from healthy to abusive with unhealthy somewhere in the middle\n",
        textAlign: TextAlign.center,),
      // healthy section
      Container(decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter, end: Alignment.bottomCenter,
              colors: [ Colors.white, Colors.cyan[700] ])),
                child: Column(children: <Widget>[
                  Text("\nHealthy relationships are based on equality and respect.\n",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white)),
                  Text("\nYou make decisions together and can openly discuss what you're dealing with, like relationship problems and sexual choices. You enjoy spending time together but can be happy apart.\n",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  Center(child: Row(children: <Widget>[
                    Text("RESPECT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white),),
                    Text("TRUST", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white),),
                  ],)),
                  Center(child: Row(children: <Widget>[
                    Text("HONESTY", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white),),
                    Text("EQUALITY", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white),)
                  ],)),
                  Center(child: Text("GOOD COMMUNICATION", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white),)),
                ],)),
      // unhealthy section
      Container(decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter, end: Alignment.bottomCenter,
              colors: [ Colors.cyan[700], Colors.purple ])),
          child: Column(children: <Widget>[
            Text("\nUnealthy relationships are based on attempts to control the other person.\n",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white)),
            Text("\nOne person tries to make most of the decisions. They may pressure their partner about sex or refuse to see how their actions can hurt. In an unhealthy relationship, you feel like you should only spend time with your partner.\n",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            Center(child: Text("BREAKS IN COMMUNICATION", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white),)),
            Center(child: Row(children: <Widget>[
              Text("PRESSURE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white),),
              Text("DISHONESTY", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white),),
            ],)),
            Center(child: Text("STRUGGLES FOR CONTROL", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white),)),
            Center(child: Text("INCONSIDERATE BEHAVIOR", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white),)),
          ],)),
      // todo abusive section
      Container(decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter, end: Alignment.bottomCenter,
              colors: [ Colors.purple, Colors.red[800]
              ])),
          child: Column(children: <Widget>[
            // todo title
            // todo list of things
          ],))
    ],);
  }

}