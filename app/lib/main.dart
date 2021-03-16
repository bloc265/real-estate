import 'package:app/screens/SignUp.dart';
import 'package:app/screens/login.dart';
import 'package:app/screens/splash.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      routes: {
        '/':(context) => SplashScreen(),
        '/login':(context) => LoginScreen(),
        '/signup':(context) => SignUp()
      },
    )
  );
}