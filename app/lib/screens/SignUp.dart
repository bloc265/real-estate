import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../services/api.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var url = 'http://10.0.2.2:5000/api/backend';
  final _formeky = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 10.6,
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: Colors.white,size: 30,),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Create account'),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formeky,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: _name,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock, color: Colors.white,),
                                  hintText: "Name",
                                  labelText: "Name",
                                  hintStyle: TextStyle(color: Colors.blue[600]),
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:BorderSide(color: Colors.white)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  fillColor: Colors.white
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: _email,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined, color: Colors.white,),
                                  hintText: "Email",
                                  labelText: "Email",
                                  hintStyle: TextStyle(color: Colors.blue[600]),
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:BorderSide(color: Colors.white)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  fillColor: Colors.white
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: _password,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock, color: Colors.white,),
                                  hintText: "create a password",
                                  labelText: "Password",
                                  hintStyle: TextStyle(color: Colors.blue[600]),
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:BorderSide(color: Colors.white)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  fillColor: Colors.white
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FlatButton(
                              onPressed: ()async{
                                api().register(_name.text, _email.text, _password.text).then((value) => {
                                   if(value['success'] == false){
                                     Fluttertoast.showToast(
                                       msg:value['msg'],
                                       textColor: Colors.white,
                                       backgroundColor: Colors.redAccent.withOpacity(0.8),
                                       gravity: ToastGravity.TOP,
                                       toastLength: Toast.LENGTH_SHORT
                                     )
                                   } else {
                                     Fluttertoast.showToast(
                                         msg:value['msg'],
                                         textColor: Colors.white,
                                         backgroundColor: Colors.redAccent.withOpacity(0.8),
                                         gravity: ToastGravity.TOP,
                                         toastLength: Toast.LENGTH_SHORT
                                     ),
                                     Navigator.pushReplacementNamed(context, '/login')
                                   }
                                   }
                                );

                          },child:Text('Sign up', style: TextStyle(color: Colors.redAccent.withOpacity(0.8), fontSize: 30),) )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
