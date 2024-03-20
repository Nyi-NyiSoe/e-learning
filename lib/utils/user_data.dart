import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edulearn/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MyUser?> getUserData() async {
    if (_auth.currentUser != null) {
      var userData = await _firestore
          .collection('users').doc(_auth.currentUser!.uid).get();

      print('UserData.data,${userData.data()}');
      MyUser? user_data;

      if (userData.exists) {
        user_data = MyUser(
            name: userData.get('username') ?? '',
            email: userData.get('email') ?? '',
            pfp:  Uint8List.fromList(utf8.encode(userData.get('pfp'))),
            favCourse: userData.get('fav_course')?? '');
      }

      return user_data;
    }

    return null; // Return null if _auth.currentUser is null
  }
}
