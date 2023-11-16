import 'package:flutter/material.dart';
import 'package:edulearn/authenticate/auth_service.dart';
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          actions: [IconButton(onPressed: () async{
            await AuthService().signOut();

          }, icon: Icon(Icons.logout))]),
    ));
  }
}
