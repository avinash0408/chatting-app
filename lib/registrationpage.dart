import 'package:flutter/material.dart';
import 'allbuttons.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chatpage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class Registrationpage extends StatefulWidget {
  static String id = 'registration';
  @override
  _RegistrationpageState createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner=false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
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
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: decor.copyWith(hintText: 'Enter your email.'),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: decor.copyWith(hintText: 'Enter your password.'),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  AllButtons(
                      title: 'Register',
                      colour: Colors.blueAccent,
                      onPressed: () async {
                        setState(() {
                          showSpinner=true;
                        });
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                              if(newUser!=null)
                              Navigator.pushNamed(context, ChatScreen.id);
                              setState(() {
                                showSpinner=false;
                              });

                        } 
                        catch (e) {
                          print(e);
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
