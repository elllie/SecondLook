import 'package:flutter/material.dart';

class AwarenessRelationshipSpectrum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Text("\nThe Relationship Spectrum\n", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0),
        textAlign: TextAlign.center,),
      Text("All relationships exist on a spectrum from healthy to abusive with unhealthy somewhere in the middle\n",
        textAlign: TextAlign.center,),
      // healthy section
      Container(decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter, end: Alignment.bottomCenter,
              colors: [ Theme.of(context).canvasColor, Colors.cyan, Colors.cyan[700] ])),
                child: Column(children: <Widget>[
                  Text("\nHealthy relationships are based on equality and respect.\n",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white, shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 4.0,
                          color: Colors.black38,
                        ),
                      ],),
                      textAlign: TextAlign.center,),
                  Text("You make decisions together and can openly discuss what you're dealing with, like relationship problems and sexual choices. You enjoy spending time together but can be happy apart.\n",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,),
                  Center(child: Row(children: <Widget>[
                    Spacer(),
                    Text("RESPECT", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                    Spacer(),
                    Text("TRUST", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                    Spacer(),
                  ],)),
                  Center(child: Row(children: <Widget>[
                    Spacer(),
                    Text("HONESTY", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                    Spacer(),
                    Text("EQUALITY", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                    Spacer(),
                  ],)),
                  Center(child: Text("GOOD COMMUNICATION", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                ],)),
      // unhealthy section
      Container(decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter, end: Alignment.bottomCenter,
              colors: [ Colors.cyan[700], Colors.purple ])),
          child: Column(children: <Widget>[
            Text("\nUnealthy relationships are based on attempts to control the other person.\n",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0.0, 0.0),
                  blurRadius: 4.0,
                  color: Colors.black38,
                ),
              ],),
            textAlign: TextAlign.center,),
            Text("\nOne person tries to make most of the decisions. They may pressure their partner about sex or refuse to see how their actions can hurt. In an unhealthy relationship, you feel like you should only spend time with your partner.\n",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,),
            Center(child: Text("BREAKS IN COMMUNICATION", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
            Center(child: Row(children: <Widget>[
              Spacer(),
              Text("PRESSURE", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
              Spacer(),
              Text("DISHONESTY", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
              Spacer(),
            ],)),
            Center(child: Text("STRUGGLES FOR CONTROL", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
            Center(child: Text("INCONSIDERATE BEHAVIOR", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
          ],)),
      // abusive section
      Container(decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter, end: Alignment.bottomCenter,
              colors: [ Colors.purple, Colors.red[800]
              ])),
          child: Column(children: <Widget>[
            Text("\nAbusive relationships are based on an imbalance of power and control.\n",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white, shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0.0, 0.0),
                    blurRadius: 4.0,
                    color: Colors.black38,
                  ),
                ],), textAlign: TextAlign.center,),
            Text("One person is making all of the decisions — about sexual choices, friend groups, boundaries, even what’s true and what's not. You spend all of your time together and feel like you can't talk to other people, especially about what's really happening in your relationship.\n",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,),
            Center(child: Row(children: <Widget>[
              Spacer(),
              Text("ACCUSATIONS", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
              Spacer(),
              Text("MANIPULATION", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
              Spacer(),
            ],)),
            Center(child: Row(children: <Widget>[
              Spacer(),
              Text("ISOLATION", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
              Spacer(),
              Text("PRESSURE", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
              Spacer(),
            ],)),
            Center(child: Text("BLAME SHIFTING\n", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
          ],))
    ],);
  }

}