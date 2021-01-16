import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathmaster/mainPages/homePage.dart';

import 'dart:math';


class Addition extends StatefulWidget {
  final int score;
  final int count;
  final int correctAnswer;
  final int skipAnswer;
  final String function;
  final int maxnumber;

  Addition(
      {Key key,
      @required this.score,
      @required this.count,
      @required this.correctAnswer,
      @required this.skipAnswer,
      @required this.function,@required this.maxnumber})
      : super(key: key);

  @override
  _AdditionState createState() => _AdditionState(
      count: count,
      score: score,
      correctAnswer: correctAnswer,
      skipAnswer: skipAnswer,
      function: function,
  maxnumber: maxnumber);
}

class _AdditionState extends State<Addition> {
  int score;
  final int count;
  final int correctAnswer;
  final int skipAnswer;
  final String function;
  final int maxnumber;

  _AdditionState(
      {Key key,
      @required this.score,
      @required this.count,
      @required this.correctAnswer,
      @required this.skipAnswer,
      @required this.function,
      @required this.maxnumber});

  @override
  Widget build(BuildContext context) {
    Random seed = Random();
    int maxValue = maxnumber;

    // assign random  values for operation

    int val1 = seed.nextInt(maxValue);
    int val2 = seed.nextInt(maxValue);
    int val3 = seed.nextInt(maxValue);
    int val4 = seed.nextInt(maxValue);
    int val5 = seed.nextInt(maxValue);
    int position = seed.nextInt(4);

     // check what operation should be performs

    int finalNumber() {
      int finalValue = 0;
      if (function == "add") {
        finalValue = val1 + val2;
      } else if (function == "sub") {
        finalValue = val1 - val2;
      } else if (function == "multi") {
        finalValue = val1 * val2;
      } else {
        finalValue = val1 ~/ val2;
      }
      return finalValue;
    }

     // assign random value to the array
    var arr = [finalNumber(), val3, val4, val5];

     // change the index of array randomly
    if (position == 0) {
      arr[0] = val5;
      arr[1] = val4;
      arr[2] = val3;
      arr[3] = finalNumber();
    } else if (position == 1) {
      arr[0] = val4;
      arr[1] = val3;
      arr[2] = finalNumber();
      arr[3] = val5;
    } else if (position == 2) {
      arr[0] = val3;
      arr[1] = finalNumber();
      arr[2] = val5;
      arr[3] = val4;
    }
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [const Color(0xFF185a9d), const Color(0xFF43cea2)],
              tileMode: TileMode.repeated,
            ),
          ),
          child: (count == 10)
              ? dialogScoreboard(context, score, correctAnswer, skipAnswer,function,maxnumber)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      child: Column(
                        children: <Widget>[

                           // topic

                          Padding(
                            padding:  EdgeInsets.only(top:28.0),
                            child: Text("Math", style: Theme.of(context).textTheme.headline),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(bottom:30.0),
                            child: Text("Master", style: Theme.of(context).textTheme.subhead),
                          ),


                           // display score
                          Padding(
                            padding:  EdgeInsets.only(bottom:20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Score :  ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subhead
                                        .copyWith(fontSize: 23)),
                                Text(score.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subhead
                                        .copyWith(fontSize: 23)),
                              ],
                            ),
                          ),



                           // count down time
                          Padding(
                            padding:  EdgeInsets.only(bottom:20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Running Time :  ",
                                    style: Theme.of(context).textTheme.subhead),
                                TweenAnimationBuilder<Duration>(
                                    duration: Duration(minutes: 2),
                                    tween: Tween(
                                        begin: Duration(minutes: 2),
                                        end: Duration.zero),
                                    onEnd: () {
                                      setState(() {

                                         // when time over score become decrement
                                        score = score - 5;
                                      });
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return dialog(
                                                context,
                                                score,
                                                count,
                                                correctAnswer,
                                                skipAnswer,
                                                function,
                                            maxnumber);
                                          });
                                    },
                                    builder: (BuildContext context,
                                        Duration value, Widget child) {
                                      final minutes = value.inMinutes;
                                      final seconds = value.inSeconds % 60;
                                      return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Text(' $minutes : $seconds ',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subhead));
                                    }),
                              ],
                            ),
                          ),


                          // formula for arithmatic operation
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(val1.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline),
                              (function == "add")
                                  ? Text("  +  ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline)
                                  : (function == "sub")
                                      ? Text("  -  ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline)
                                      : (function == "multi")
                                          ? Text("  *  ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline)
                                          : Text("  /  ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline),
                              Text(val2.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline),
                              Text("  =  ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline),
                              Text("  ?  ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline),
                            ],
                          ),
                        ],
                      ),
                    ),


                     // answers for the question
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(

                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,

                                    childAspectRatio: 3 / 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemCount: arr.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return InkWell(
                                  onTap: () {

                                     // if answer correct
                                    if (arr[index] == finalNumber()) {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => Addition(
                                                    score: score + 10,
                                                    count: count + 1,
                                                    correctAnswer:
                                                        correctAnswer + 1,
                                                    skipAnswer: skipAnswer,
                                                    function: function,
                                                maxnumber: maxnumber,
                                                  )));
                                    } else {

                                       // answer incorrect
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return dialog(
                                                context,
                                                score,
                                                count,
                                                correctAnswer,
                                                skipAnswer,
                                                function,maxnumber);
                                          });
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                        child: Text(arr[index].toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .display1)),
                                  ));
                            }),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}


        // use for timeout and incorrect answers
Widget dialog(BuildContext context, int score, int count, int correctAnswer,
    int skipAnswer, String function, int maxnumber) {
  return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0.0,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: Color(0xFFE3F2FD),
            height: MediaQuery.of(context).size.height/3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 18.0, bottom: 22),
                  child: Text("Oops",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontSize: 23, color: Colors.red)),
                ),
                Text("Your answer is not corrected",
                    style: Theme.of(context).textTheme.display1),
                Padding(
                  padding: EdgeInsets.only(top:30.0 , left: 17,right: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      // if user want try again function
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text("<<< Try again ",
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(color: Colors.blueGrey)),
                      ),


                       // if user want skip the function
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Addition(
                                    score: score,
                                    count: count + 1,
                                    correctAnswer: correctAnswer,
                                    skipAnswer: skipAnswer + 1,
                                    function: function,
                                maxnumber: maxnumber,
                                  )));
                        },
                        child: Text("Skip >>>",
                            style: Theme.of(context).textTheme.display1),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )));
}


    // final result of the questions
Widget dialogScoreboard(
    BuildContext context, int score, int correctAnswer, int skipAnswer ,String function , int maxnumber) {
  return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0.0,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: Color(0xFFE3F2FD),
            height: MediaQuery.of(context).size.height * 5 / 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 18),
                  child: Text("Your score is",
                      style: Theme.of(context).textTheme.display1.copyWith(
                            fontSize: 23,
                          )),
                ),
                Text("$score/100",
                    style: Theme.of(context)
                        .textTheme.title
                        ),
                Padding(
                  padding:  EdgeInsets.only(top:20.0 , bottom: 18),
                  child: Text("Correct Answer : $correctAnswer",
                      style: Theme.of(context).textTheme.display1),
                ),
                Text("Wrong Answer : ${10 - correctAnswer}",
                    style: Theme.of(context).textTheme.display1),
                Padding(
                  padding: EdgeInsets.only(top:18.0 , bottom: 18),
                  child: Text("No Answer :$skipAnswer",
                      style: Theme.of(context).textTheme.display1),
                ),
                (score > 75)
                    ? Text("Excellent",
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(fontSize: 23))
                    : (score >=50 && score <= 75)
                        ? Text("Good",
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(fontSize: 23))
                        : Text("Try Again",
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(fontSize: 23)),


                 // button for playAgain
                Padding(
                  padding:  EdgeInsets.only(top:18.0 , bottom: 18),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      child: buttonContainer(context, "Play Again")),
                ),


                // button for go to next level with increment the max value of random value
                (score>=50) ?InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Addition(
                          score: 0,
                          count: 0,
                          skipAnswer: 0,
                          correctAnswer: 0,
                          function: function,
                          maxnumber: maxnumber+100,
                        )));
                  },
                    child: buttonContainer(context, "Next Level")):Container(),


                // button for Exit
                Padding(
                  padding:  EdgeInsets.only(top:18.0 , bottom: 18),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      child: buttonContainer(context, "Exit")),
                ),
              ],
            ),
          )));
}

Widget buttonContainer(
  BuildContext context,
  String name,
) {
  return Container(
    height: MediaQuery.of(context).size.height / 12,
    width: MediaQuery.of(context).size.height / 4,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [const Color(0xFF185a9d), const Color(0xFF43cea2)],
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: Text(name, style: Theme.of(context).textTheme.subhead),
    ),
  );
}
