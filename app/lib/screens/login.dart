import 'package:app/services/api.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body:Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                Text('Welcome', style: TextStyle(color: Colors.white.withOpacity(0.6), fontWeight: FontWeight.bold, fontSize: 50),),
               SizedBox(
                 height: 20,
               ),
               Text('Login with your email or password', style: TextStyle(color: Colors.white, fontSize: 20),),
               SizedBox(height: 50,),
               Form(
                 key: _formkey,
                 child: Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 20, right: 20),
                       child: Container(
// padding: EdgeInsets.only(top:10, bottom: 0),
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(30.1),

                         ),
                         child: TextFormField(
                           style: TextStyle(color: Colors.white),
                           controller: _password,
                           decoration: InputDecoration(

                               prefixIcon: Padding(
                                 padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                                 child: Icon(Icons.email_rounded,size: 20,),
                               ),
                               hintText: "Email",

                               focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(30),
                                   borderSide: BorderSide(color: Colors.white)
                               )
                             // hintStyle: TextStyle(color: Colors.blue[600]),
                             // labelStyle: TextStyle(color: Colors.white),


                           ),
                         ),
                       ),
                     ),
                     SizedBox(height: 30,),
                     Padding(
                       padding: const EdgeInsets.only(left: 20, right: 20),
                       child: Container(
// padding: EdgeInsets.only(top:10, bottom: 0),
                         decoration: BoxDecoration(
                             color: Colors.white,
                           borderRadius: BorderRadius.circular(30.1),

                         ),
                         child: TextFormField(
                           style: TextStyle(color: Colors.white),
                           controller: _password,
                           decoration: InputDecoration(

                             prefixIcon: Padding(
                               padding: const EdgeInsets.only(left: 20, right: 20),
                               child: Icon(Icons.lock,size: 20,),
                             ),
                               hintText: "Password",

                               focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(30),
                                   borderSide: BorderSide(color: Colors.white)
                               )
                               // hintStyle: TextStyle(color: Colors.blue[600]),
                               // labelStyle: TextStyle(color: Colors.white),


                           ),
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     FlatButton(
                       child: Text('Sign in', style: TextStyle(color: Colors.redAccent.withOpacity(0.8), fontSize: 30),),
                       onPressed: (){
                        api().login(_email.text, _password.text).then((value){
                          // print(value);
                          var jsonData = convert.jsonDecode(value.body);
                          var token = value.headers['authtoken'];

                          if(jsonData["success"] == true){
                            Constants.prefs.setBool("Loggedin", true);
                            Constants.prefs.setString("token",token);
                            Fluttertoast.showToast(
                              msg:jsonData['msg'],
                                textColor: Colors.white,
                                backgroundColor: Colors.redAccent.withOpacity(0.8),
                                gravity: ToastGravity.TOP,
                                toastLength: Toast.LENGTH_SHORT
                            );
                          } else {
                            Fluttertoast.showToast(
                                msg:jsonData['msg'],
                                textColor: Colors.white,
                                backgroundColor: Colors.redAccent.withOpacity(0.8),
                                gravity: ToastGravity.TOP,
                                toastLength: Toast.LENGTH_SHORT
                            );
                          }


                          // if(value)
                        });
                       },
                     ),
                     SizedBox(
                       height: 30,
                     ),
                     Text('Don\'t have an account yet?', style: TextStyle(color: Colors.redAccent.withOpacity(0.8), fontSize: 18),),
                     FlatButton(onPressed: (){
                       Navigator.pushNamed(context, '/signup');
                     },
                         child: Text('Create one', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600, fontSize: 18),)
                     )

                   ],
                 ),
               )
              ],
            ),
          )
        ),
      ),
    );
  }
}
