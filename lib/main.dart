import 'package:flutter/material.dart';
import 'package:hlww_chat/chatpage.dart';
import 'package:hlww_chat/registrationpage.dart';
import 'loginpage.dart';
import 'Welcomepage.dart';

void main()=>runApp(HlwChat());

class HlwChat extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Welcomepage.id,
      routes: {
        Welcomepage.id : (context)=>Welcomepage(),
        Loginpage.id : (context)=>Loginpage(),
        Registrationpage.id :(context)=>Registrationpage(),
        ChatScreen.id :(context)=>ChatScreen(),
      }
      
    );
  }
}