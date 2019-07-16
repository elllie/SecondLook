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
          Text("Are you in a healthy relationship?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0), textAlign: TextAlign.center,),
          Text("\n    Everyone deserves to be in a safe and healthy relationship. Do you know if your relationship is healthy? Answer yes or no to the following questions to find out. \n",
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
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 16.0),
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
            Spacer(), Spacer(),
            Row(children: <Widget>[ RaisedButton(
              onPressed: () {
                if (currentQuestion.pointsForYesAnswer)
                  score += currentQuestion.pointValue;
                print("score: $score");
                questions.removeFirst();
                if (questions.isNotEmpty) {
                  setState(() {
                    currentQuestion = questions.first;
                  });
                } else {
                  // push results page
                  RelationshipQuizResults results = new RelationshipQuizResults();
                  if (score == 0) {
                    results.result = new Result(score, "Healthy", "You got a score of zero? Don’t worry -- it’s a good thing! It sounds like your relationship is on a pretty healthy track. Maintaining healthy relationships takes some work -- keep it up! Remember that while you may have a healthy relationship, it’s possible that a friend of yours does not.", Colors.green);
                  } else if (score < 3) {
                    results.result = new Result(score, "Possibly unhealthy", "You might be noticing a couple of things in your relationship that are unhealthy, but it doesn’t necessarily mean they are warning signs. It’s still a good idea to keep an eye out and make sure there isn’t an unhealthy pattern developing.\n\nThe best thing to do is to talk to your partner and let them know what you like and don’t like. Encourage them to do the same. Communication is always important when building a healthy relationship. It’s also good to be informed so you can recognize the different types of abuse.", Colors.amber);
                  } else if (score < 5) {
                    results.result = new Result(score, "Potentially abusive", "Scores in this range indicate you may be seeing some warning signs of an abusive relationship. Don’tignore these red flags. Something that starts small can grow much worse over time.\n\nNo relationship is perfect -- it takes work! But in a healthy relationship you won’t find abusive behaviors.", Colors.deepOrangeAccent);
                  } else {
                    results.result = new Result(score, "Likely abusive", "Scores in this range indicate you may be in an abusive relationship.\n\nRemember the most important thing is your safety -- consider making a safety plan.\n\nYou don’t have to deal with this alone. We can help.", Colors.redAccent);
                  }
                  Navigator.push(context, MaterialPageRoute(builder: (context) => results));
                }
              },
              child: const Text("YES"),
              textColor: Colors.white,
              color: Colors.pinkAccent,
            ), Spacer(),
              RaisedButton(
                onPressed: () {
                  if (!currentQuestion.pointsForYesAnswer)
                    score += currentQuestion.pointValue;
                  print("score: $score");
                  questions.removeFirst();
                  if (questions.isNotEmpty) {
                    setState(() {
                      currentQuestion = questions.first;
                    });
                  } else {
                    // push results page
                    RelationshipQuizResults results = new RelationshipQuizResults();
                    if (score == 0) {
                      results.result = new Result(score, "Healthy", "You got a score of zero? Don’t worry -- it’s a good thing! It sounds like your relationship is on a pretty healthy track. Maintaining healthy relationships takes some work -- keep it up! Remember that while you may have a healthy relationship, it’s possible that a friend of yours does not.", Colors.green);
                    } else if (score < 3) {
                      results.result = new Result(score, "Possibly unhealthy", "You might be noticing a couple of things in your relationship that are unhealthy, but it doesn’t necessarily mean they are warning signs. It’s still a good idea to keep an eye out and make sure there isn’t an unhealthy pattern developing.\n\nThe best thing to do is to talk to your partner and let them know what you like and don’t like. Encourage them to do the same. Communication is always important when building a healthy relationship. It’s also good to be informed so you can recognize the different types of abuse.", Colors.amber);
                    } else if (score < 5) {
                      results.result = new Result(score, "Potentially abusive", "Scores in this range indicate you may be seeing some warning signs of an abusive relationship. Don’tignore these red flags. Something that starts small can grow much worse over time.\n\nNo relationship is perfect -- it takes work! But in a healthy relationship you won’t find abusive behaviors.", Colors.deepOrangeAccent);
                    } else {
                      results.result = new Result(score, "Likely abusive", "Scores in this range indicate you may be in an abusive relationship.\n\nRemember the most important thing is your safety -- consider making a safety plan.\n\nYou don’t have to deal with this alone. We can help.", Colors.redAccent);
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (context) => results));
                  }
                },
                child: const Text("NO"),
                textColor: Colors.white,
                color: Colors.pinkAccent,
              ),]),
        Text("\n"),
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

class Result {
  int score;
  String headline;
  String body;
  Color color;

  Result(int scor, String headline, String body, Color color) {
    this.score = scor;
    this.headline = headline;
    this.body = body;
    this.color = color;
  }
}

class RelationshipQuizResults extends StatelessWidget {
  Result result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(36.0),
      child: Center(
        child: Column(
          children: <Widget> [
            Text("Your score: ${result.score} / 100\n",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),

            Text("${result.headline}\n",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: result.color)),
            Text("${result.body}\n"),
            Text("\nVisit the Resources tab to learn more.",
                style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black54))
          ]
        )
      )
    );
  }

}
