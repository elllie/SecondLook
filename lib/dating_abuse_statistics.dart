import 'package:flutter/material.dart';
import "awareness_relationship_spectrum.dart";
import "detection_home.dart";
import "resources_home.dart";
import "relationship_quiz.dart";
import "main.dart";

class DatingAbuseStatistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('SecondLook'),
    ),
    body: Padding(padding: EdgeInsets.all(16.0),
        child: ListView(children: <Widget>[
          Text("Dating abuse is a big problem, affecting youth in every community across the nation. Learn the facts below.\n"),

          Text("Too common\n", style: Theme.of(context).textTheme.headline,),
          Text(" • Nearly 1.5 million high school students nationwide experience physical abuse from a dating partner in a single year.\n"),
          Text(" • One in three girls in the US is a victim of physical, emotional or verbal abuse from a dating partner, a figure that far exceeds rates of other types of youth violence.\n"),
          Text(" • One in ten high school students has been purposefully hit, slapped or physically hurt by a boyfriend or girlfriend.\n"),

          Text("Why focus on young people?\n", style: Theme.of(context).textTheme.headline,),
          Text(" • Girls and young women between the ages of 16 and 24 experience the highest rate of intimate partner violence, almost triple the national average.\n"),
          Text(" • Among female victims of intimate partner violence, 94% of those age 16-19 and 70% of those age 20-24 were victimized by a current or former boyfriend or girlfriend.\n"),
          Text(" • Violent behavior often begins between the ages of 12 and 18.\n"),
          Text(" • The severity of intimate partner violence is often greater in cases where the pattern of abuse was established in adolescence.\n"),

          Text("Don't forget about college students\n", style: Theme.of(context).textTheme.headline,),
          Text(" • Nearly half (43%) of dating college women report experiencing violent and abusive dating behaviors.\n"),
          Text(" • College students are not equipped to deal with dating abuse – 57% say it is difficult to identify and 58% say they don't know how to help someone who's experiencing it.\n"),
          Text(" • One in three (36%) dating college students has given a dating partner their computer, email or social network passwords and these students are more likely to experience digital dating abuse.\n"),
          Text(" • One in six (16%) college women has been sexually abused in a dating relationship.\n"),

          Text("Long-lasting effects\n", style: Theme.of(context).textTheme.headline,),
          Text(" • Violent relationships in adolescence can have serious ramifications by putting the victims at higher risk for substance abuse, eating disorders, risky sexual behavior and further domestic violence.\n"),
          Text(" • Being physically or sexually abused makes teen girls six times more likely to become pregnant and twice as likely to get an STD.\n"),
          Text(" • Half of youth who have been victims of both dating violence and rape attempt suicide, compared to 12.5% of non-abused girls and 5.4% of non-abused boys.\n"),

          Text("Lack of awareness\n", style: Theme.of(context).textTheme.headline,),
          Text(" • Only 33% of teens who were in an abusive relationship ever told anyone about the abuse.\n"),
          Text(" • Eighty-one (81) percent of parents believe teen dating violence is not an issue or admit they don’t know if it's an issue.\n"),
          Text(" • Though 82% of parents feel confident that they could recognize the signs if their child was experiencing dating abuse, a majority of parents (58%) could not correctly identify all the warning signs of abuse.\n"),
    ],)),
    drawer: Drawer(child: ListView(padding: EdgeInsets.all(0),
      children: <Widget>[DrawerHeader(
      child: Text('SecondLook', style: TextStyle(color: Colors.white)),
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
              colors: <Color>[Colors.cyan, Colors.pinkAccent])
      ),
    ),
        ListTile(
          title: Text('Home'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Home()));
          },
        ),
      Text('\n   AWARENESS', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 11.0),),
      ListTile(
        title: Text('The relationship spectrum'),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AwarenessRelationshipSpectrum()));
        },
      ),
      ListTile(
        title: Text('Dating abuse statistics'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DatingAbuseStatistics()));
        },
      ),
      ListTile(title: Text('Relationship quiz'), onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RelationshipQuizHome()));
      },),
      Text('\n   DETECTION', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 11.0),),
      ListTile(title: Text('Analyze messages'), onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetectionHome()));
      },),
      Text('\n   RESOURCES', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 11.0),),
      ListTile(title: Text('In your area'), onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResourcesHome()));
      },),
    ],
    )));
  }

}