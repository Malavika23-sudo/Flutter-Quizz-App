import 'package:flutter/material.dart';

class Quizover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.black12,
            body: Container(
              child: Center(
                child: Text(
                  'QUIZ OVER',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )));
  }
}
