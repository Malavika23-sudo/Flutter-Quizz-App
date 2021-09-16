import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzlerapp/questions.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  //minimumSize: const Size(350, 60),
                  primary: Colors.blueAccent,
                  //textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Questions()));
                },
                child: Text(
                  'Restart',
                  style: GoogleFonts.mcLaren(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 40),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
