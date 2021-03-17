import 'package:app/screens/SignUp.dart';
import 'package:app/screens/login.dart';
import 'package:app/screens/splash.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
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