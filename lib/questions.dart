import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzlerapp/quizz_brain.dart';
import 'package:quizzlerapp/result.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

/// widgets to display answer buttons and questions.
class _QuestionsState extends State<Questions> {
  bool? correctanswer;
  int userScore = 0;
  int? height;
  List<Widget> scorekeeper = [];
  QuizzBrain quizzbrain = QuizzBrain();

  void checkAnswer(bool useranswer) {
    setState(() {
      if (quizzbrain.isFinished()) {
        showDialog<String>(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => AlertDialog(
            //var width = MediaQuery.of(context).size.width;
            insetPadding: EdgeInsets.all(30.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            title: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                  child: const Text('Finished',
                      style: TextStyle(color: Colors.white))),
            ),
            backgroundColor: Colors.black,
            content: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                const Text('You\'ve reached the end of the quizz',
                    style: TextStyle(color: Colors.white)),
                SizedBox(
                  height: 60.0,
                ),
                Text('SCORE:$userScore/13',
                    style: TextStyle(color: Colors.white))
              ],
            ),
            actions: <Widget>[
              Center(
                child: TextButton(
                    child: const Text('Cancel',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Result()))),
              ),
              SizedBox(
                height: 60.0,
              ),
            ],
          ),
        );
        scorekeeper.removeRange(0, quizzbrain.numberofQuestions());
        quizzbrain.resetQuestionNumber();
      } else {
        correctanswer = quizzbrain.getanswertext();
        print('correct answer $correctanswer');
        print('User said answer $useranswer');
        if (correctanswer == useranswer) {
          userScore = userScore + 1;
          scorekeeper.add(Icon(
            Icons.check,
            color: Colors.green,
            size: 30.0,
          ));
        } else {
          scorekeeper.add(Icon(
            Icons.close,
            color: Colors.red,
            size: 30.0,
          ));
        }
        quizzbrain.questionnumber();
      }
    });
  }

  Center answerbutton() {
    return Center(
        child: Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(350, 60),
            primary: Colors.blueAccent,
            textStyle: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          child: Text(
            'True',
            style: GoogleFonts.mcLaren(
              textStyle: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
          onPressed: () {
            checkAnswer(true);
          },
        ),
        SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
          //backgroundColor: color,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(350, 60),
            //padding: const EdgeInsets.all(16.0),
            primary: Colors.blueAccent,
            textStyle: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          child: Text(
            'False',
            style: GoogleFonts.mcLaren(
              textStyle: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
          onPressed: () {
            checkAnswer(false);
          },
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    // @override
    // void initState() {
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.red,
    //   ));
    //   super.initState();
    // }
    //
    // @override
    // void dispose() {
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.red,
    //   ));
    //   super.dispose();
    // }

    return MaterialApp(
        // var width = MediaQuery.of(context).size.width * 0.3;
        home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Padding(
          padding: const EdgeInsets.only(left: 26.0),
          child: Text(
            'QUIZZER',
            style: GoogleFonts.mcLaren(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.0,
          ),
          Container(
              child: Text(
            quizzbrain.getquestiontext(),
            textAlign: TextAlign.center,
            style: GoogleFonts.mcLaren(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0)),
          )),
          SizedBox(
            height: 100.0,
          ),
          answerbutton(),
          // SizedBox(
          //   height: 10.0,
          // ),
          Row(children: scorekeeper)
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text('Quizzer'),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Log In'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
