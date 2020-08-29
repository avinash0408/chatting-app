import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'registrationpage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'allbuttons.dart';

class Welcomepage extends StatefulWidget {
  static String id = 'welcome';
  @override
  _WelcomepageState createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.white, end: Colors.blueGrey)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('assets/images/logo_chat.png'),
                  height: 60.0,
                ),
              ),
              ColorizeAnimatedTextKit(
                text: ["PHOENIX"],
                //color: Colors.deepOrangeAccent,
                textStyle: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Horizon"),
                colors: [
                  Colors.white,
                  Colors.purple,
                  Colors.blue,
                  Colors.yellow,
                  Colors.red,
                ],
              ),
            ]),
            SizedBox(
              height: 48.0,
            ),
            AllButtons(
                title: 'Login',
                colour: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, Loginpage.id);
                }),
            AllButtons(
                title: 'Register',
                colour: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, Registrationpage.id);
                }),
          ],
        ),
      ),
    );
  }
}
