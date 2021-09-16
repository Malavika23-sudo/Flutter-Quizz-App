import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzlerapp/questions.dart';
import 'package:flutter/services.dart';

/// This is the stateless widget that the main application instantiates.
class Splach extends StatefulWidget {
  @override
  _SplachState createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  // @override
  // void initState() {
  //   SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  //   // SystemUiOverlayStyle(
  //   //   statusBarColor: Colors.red,
  //   // );
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.red,
  //   );
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //AnnotatedRegion(
      // value: SystemUiOverlayStyle(
      //   // statusBarBrightness: Brightness.light,
      //   statusBarColor: Colors.red,
      //systemNavigationBarDividerColor: Colors.blue,
      // ),
      home: Scaffold(
        body: SafeArea(
          child: AnimatedSplashScreen(
              duration: 3000,
              splash: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        'QUIZZER',
                        style: GoogleFonts.mcLaren(
                          textStyle: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Image.asset(
                        'assets/giphy.gif',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
              nextScreen: Questions(),
              splashTransition: SplashTransition.fadeTransition,
              //pageTransitionType: PageTransitionType.scale,
              backgroundColor: Colors.lightBlueAccent),
        ),
      ),
    );
    //);
  }
}

// class MainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blueGrey,
//       child: Questions(),
//     );
//   }
// }
// Future.delayed(Duration(seconds: 3), () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => Questions()),
//   );
// });
