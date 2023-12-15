import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavouriteCourse {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> addCourse(String courseName) async {
    String result;
    try {
      if (_auth.currentUser != null) {
        await _firestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .update({
          'fav_course': FieldValue.arrayUnion([courseName])
        });
      }
      result = 'success';
      return result;
    } catch (e) {
      result = e.toString();
      return result;
    }
  }

  Future<String> deleteCourse(String courseName) async {
    String result;
    try {
      if (_auth.currentUser != null) {
        await _firestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .update({
          'fav_course': FieldValue.arrayRemove([courseName])
        });
      }
      result = 'success';
      return result;
    } catch (e) {
      result = e.toString();
      return result;
    }
  }
}
