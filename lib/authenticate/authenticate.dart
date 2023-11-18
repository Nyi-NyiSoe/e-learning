import 'package:edulearn/screens/login_page.dart';
import 'package:edulearn/screens/signup_page.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
 bool showSignIn = true;

  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    if(showSignIn){
      return LoginPage(toggleView: toggleView,);
    }else{
      return SignUpPage(toggleView: toggleView,);
    }
  }
}