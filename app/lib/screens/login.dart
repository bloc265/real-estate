import 'package:flutter/material.dart';

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

                Text('Welcome back', style: TextStyle(color: Colors.white.withOpacity(0.6), fontWeight: FontWeight.bold, fontSize: 30),),
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
                       child: TextFormField(

                         controller: _email,
                         decoration: InputDecoration(
                           hintText: "Email",
                           prefixIcon:Icon(Icons.person, color: Colors.white,) ,
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
                           )
                         ),
                       ),
                     ),
                     SizedBox(height: 30,),
                     Padding(
                       padding: const EdgeInsets.only(left: 20, right: 20),
                       child: TextFormField(
                         controller: _password,
                         decoration: InputDecoration(
                           prefixIcon: Icon(Icons.lock, color: Colors.white,),
                             hintText: "Password",
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
                       height: 20,
                     ),
                     FlatButton(
                       child: Text('Sign in', style: TextStyle(color: Colors.redAccent.withOpacity(0.8), fontSize: 30),),
                       onPressed: (){

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
