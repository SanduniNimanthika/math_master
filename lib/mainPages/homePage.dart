import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mathmaster/mainPages/OperationPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [const Color(0xFF185a9d), const Color(0xFF43cea2)],
              tileMode: TileMode.repeated,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Math", style: Theme.of(context).textTheme.headline),
              Padding(
                padding:  EdgeInsets.only(bottom:30.0),
                child: Text("Master", style: Theme.of(context).textTheme.subhead),
              ),




              // addition numbers
              buttonContainer(context, "ADDITION", "images/add.png", "add"),

              // subtraction numbers
              buttonContainer(
                  context, "SUBTRACTION", "images/subtration.png", "sub"),

              // multipication numbers
              buttonContainer(
                  context, "MULTIPICATION", "images/multi.png", "multi"),

              //divition numbers
              buttonContainer(context, "DIVITION", "images/divi.png", "divi"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buttonContainer(
    BuildContext context, String name, String img, String function) {
  return Padding(
    padding:  EdgeInsets.only(top:15.0),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Addition(
                  score: 0,
                  count: 0,
                  skipAnswer: 0,
                  correctAnswer: 0,
                  function: function,
              maxnumber: 100,
                )));
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 9,
        width: MediaQuery.of(context).size.width * 4 / 5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 30.0, right: 15.0),
          child: Row(


            children: <Widget>[
              Image(
                image: AssetImage(img),
                height: 15,
                width: 15,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left:28.0),
                  child: Text(name, style: Theme.of(context).textTheme.display1),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
