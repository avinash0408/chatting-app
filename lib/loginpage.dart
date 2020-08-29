import 'package:flutter/material.dart';
import 'package:hlww_chat/chatpage.dart';
import 'allbuttons.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class Loginpage extends StatefulWidget {
  static String id = 'login';
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _auth=FirebaseAuth.instance;
  String email;
  String password;
  bool showspinner=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
              child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('assets/images/logo_chat.png'),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                 TextField(
                     textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                     onChanged:(value){email=value;},
                     decoration: decor.copyWith(hintText:'Enter your email.'),
                   ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                      textAlign: TextAlign.center,
                      obscureText: true,
                     onChanged:(value){password=value;},
                     decoration: decor.copyWith(hintText:'Enter your password.'),
                   ),
                  SizedBox(
                    height: 15.0,
                  ),
                  AllButtons(
                      title: 'Log In',
                      colour: Colors.lightBlueAccent,
                      onPressed: () async{
                        setState(() {
                          showspinner=true;
                        });
                          try{
                          final user=await _auth.signInWithEmailAndPassword(email: email, password: password);
                          if(user!=null)
                          Navigator.pushNamed(context, ChatScreen.id);

                          setState(() {
                            showspinner=false;
                          });
                          }
                          catch(e){
                          print('invalid user');
                          }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

