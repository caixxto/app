import 'package:app/signin_screen.dart';
import 'package:app/signup_screen.dart';
import 'package:flutter/material.dart';
import 'authorization_screen.dart';
import 'home_screen.dart';
import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

