import 'package:flutter/material.dart';
import 'dart:collection';

class RelationshipQuizHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: EdgeInsets.all(36.0),
        child: Center(child: Column(
            children: <Widget>[
          RichText(
              text: TextSpan(
                  text: "\"   ",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent,
                  ),
                  // TODO: Add a custom font to make the quotes prettier.
                  children: <TextSpan>[
                TextSpan(
                    text: "Am I in an abusive relationship?",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                TextSpan(text: "   \"")
              ])),
          Text("\nThis quiz can help you find out.\n",
              style: TextStyle(fontSize: 18)),
          RaisedButton(
            onPressed: () {
              print("ASS");
              Navigator.push(context, MaterialPageRoute(builder: (context) => RelationshipQuiz()));
            },
            textColor: Colors.white,
            color: Colors.pinkAccent,
            child: const Text("START QUIZ"),
          )
        ])));
  }
}

class RelationshipQuiz extends StatefulWidget {
  @override
  RelationshipQuizState createState() => RelationshipQuizState();

}

class RelationshipQuizState extends State<RelationshipQuiz> {
  ListQueue<Question> questions = initQuestions();
  Question currentQuestion = initQuestions().first;
  Answer answer = Answer.True;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(text: TextSpan(
              text: "QUESTION ${currentQuestion.index} / 26  •  ",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
              children: <TextSpan>[
                TextSpan(
                  text: "The person I'm with...\n",
                  style: TextStyle(color: Colors.black),
                ),
              ]
        )),
            Text("\t${currentQuestion.body}",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 32,
                  fontWeight: FontWeight.bold)),
            RadioListTile<Answer>(
              title: const Text("True"),
              value: Answer.True,
              groupValue: answer,
              onChanged: (Answer value) { setState(() { answer = value; }); },
            ),
            RadioListTile<Answer>(
              title: const Text("False"),
              value: Answer.False,
              groupValue: answer,
              onChanged: (Answer value) { setState(() { answer = value; }); },
            ),
            Spacer(),
            Center(child: RaisedButton(
              onPressed: () {
                print("score: $score");
                if (answer == Answer.True && currentQuestion.pointsForYesAnswer) {
                  score += currentQuestion.pointValue;
                } else if (answer == Answer.False && !currentQuestion.pointsForYesAnswer) {
                  score += currentQuestion.pointValue;
                }
                questions.removeFirst();
                if (questions.isNotEmpty) {
                  setState(() {
                    currentQuestion = questions.first;
                  });
                } else {
                  // push results page
                }
              },
              child: const Text("NEXT"),
              textColor: Colors.white,
              color: Colors.pinkAccent,
            ),),
            Spacer(),
//          ],)),
          LinearProgressIndicator(
            value: (currentQuestion.index - 1) / 26,
          )
      ]));
  }

  static ListQueue<Question> initQuestions() {
    // Oh my fucking god, Dart is ridiculous
    ListQueue<Question> q = new ListQueue<Question>(26);
    q.add(new Question(1, "is very supportive of things that I do.", false, 1));
    q.add(new Question(2, "encourages me to try new things.", false, 1));
    q.add(new Question(3, "likes to listen when I have something on my mind.", false, 1));
    q.add(new Question(4, "understands that I have my own life too.", false, 1));
    q.add(new Question(5, "is disliked by my friends.", true, 1));
    q.add(new Question(6, "says I’m too involved in different activities.", true, 1));
    q.add(new Question(7, "texts or calls me all the time.", true, 1));
    q.add(new Question(8, "thinks I spend too much time trying to look nice.", true, 1));
    q.add(new Question(9, "gets extremely jealous or possessive.", true, 5));
    q.add(new Question(10, "accuses me of flirting or cheating.", true, 5));
    q.add(new Question(11, "constantly checks up on me or makes me check in.", true, 5));
    q.add(new Question(12, "controls what I wear or how I look.", true, 5));
    q.add(new Question(13, "tries to control what I do and who I see.", true, 5));
    q.add(new Question(14, "tries to keep me from seeing or talking to my family and friends.", true, 5));
    q.add(new Question(15, "has big mood swings, angrily yelling at me one minute but being sweet the next.", true, 5));
    q.add(new Question(16, "makes me feel nervous or like I’m “walking on eggshells.”", true, 5));
    q.add(new Question(17, "puts me down, calls me names or criticizes me.", true, 5));
    q.add(new Question(18, "makes me feel like I can’t do anything right or blames me for problems.", true, 5));
    q.add(new Question(19, "makes me feel like no one else would want me.", true, 5));
    q.add(new Question(20, "threatens to hurt me, my friends or family.", true, 5));
    q.add(new Question(21, "threatens to hurt themselves because of me.", true, 5));
    q.add(new Question(22, "threatens to destroy my things (phone, clothes, laptop, car, etc.).", true, 5));
    q.add(new Question(23, "grabs, shoves, chokes, slaps, throws things or hurts me in some way.", true, 5));
    q.add(new Question(24, "breaks or throws things to intimidate me.", true, 5));
    q.add(new Question(25, "yells, screams or humiliates me in front of other people.", true, 5));
    q.add(new Question(26, "pressures or forces me into having sex or going farther than I want to.", true, 5));
    return q;
  }

}

class Question {
  int index;
  String body;
//  Question next;
  bool pointsForYesAnswer;
  int pointValue;

  Question(int index, String body, bool pointsForYes, int ptValue) {
    this.index = index;
    this.body = body;
    pointsForYesAnswer = pointsForYes;
    pointValue = ptValue;
//    this.next = next;
  }
}

// Question radio buttons
enum Answer { True, False }