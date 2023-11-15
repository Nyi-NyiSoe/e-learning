import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edulearn/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUp(MyUser user) async {
    String res = "some error occured";
    try {
      if (user.email!.isNotEmpty ||
          user.name!.isNotEmpty ||
          user.password!.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: user.email!, password: user.password!);
        print(cred.user!.uid);
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'uid': cred.user!.uid,
          'username': user.name,
          'email': user.email,
          'password': user.password,
        });
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
    return res;
  }
}
