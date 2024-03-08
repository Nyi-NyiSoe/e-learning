import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edulearn/authenticate/upload_pic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edulearn/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future signUp(MyUser user) async {
    String res = "some error occured";
    try {
      if (user.email!.isNotEmpty ||
          user.name!.isNotEmpty ||
          user.password!.isNotEmpty ||
          user.pfp != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: user.email!, password: user.password!);
        print(cred.user!.uid);

        try{
          String? photoUrl = await UploadPic()
            .uploadToStorage('profilePics', user.pfp as Uint8List );

        if (photoUrl != null) {
          await _firestore.collection('users').doc(cred.user!.uid).set({
            'uid': cred.user!.uid,
            'username': user.name,
            'email': user.email,
            'password': user.password,
            'pfp': photoUrl,
            'rating': [],
            'fav_course': {},
            'certi': []
          });
        } else {
          print('Error uploading pic');
        }
        }catch (e){
          print(e.toString());
        }
      }
      // await _firestore.collection('users').add({
      //   'uid': cred.user!.uid,
      //   'username': user.name,
      //   'email': user.email,
      //   'password': user.password,
      // });
      res = 'success!';
    } catch (e) {
      res = e.toString();
    }
    return null;
  }

  //sign in
  Future signIn(String email, String password) async {
    String res = "some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential cred = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      }

      res = 'success!';
    } catch (e) {
      res = e.toString();
    }
    return null;
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      // print(e.toString());
      return null;
    }
  }
}
