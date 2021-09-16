import 'package:flutter/material.dart';
import 'package:quizzlerapp/screen.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  return runApp(Splach());
}
