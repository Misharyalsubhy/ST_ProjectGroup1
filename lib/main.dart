import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:st1_project/splash.dart';
import 'package:st1_project/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app',      
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}




