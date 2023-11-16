import 'package:edulearn/firebase_options.dart';
import 'package:edulearn/screens/home_page.dart';
import 'package:edulearn/screens/login_page.dart';
import 'package:edulearn/screens/setting_page.dart';
import 'package:edulearn/screens/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Edu Learn',
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData ||
                  FirebaseAuth.instance.currentUser != null) {
                return Wrapper();
              }
            } else {
              return const CircularProgressIndicator();
            }
            return LoginPage();
          },
        ));
  }
}
