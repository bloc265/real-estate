import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void fetchData()async{
    await Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: MediaQuery.of(context).size.height,
        child:Center(
          child: Text('Rest A House', style:TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold
          )),
        )
    )
    );
  }
}
