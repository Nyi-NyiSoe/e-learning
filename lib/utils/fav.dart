import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavouriteCourse {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> addCourse(String courseName) async {
    late String result;
    try {
      if (_auth.currentUser != null) {
        // Fetch the current user's data
        var userData = await _firestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .get();

        // Get the current fav_courses array or an empty list if it doesn't exist
        List<String> currentFavCourses =
            List<String>.from(userData.get('fav_course') ?? []);

        // Check if the course is already in the array
        if (!currentFavCourses.contains(courseName)) {
          // Update the array only if the course is not already in it
          await _firestore
              .collection('users')
              .doc(_auth.currentUser!.uid)
              .update({
            'fav_course': FieldValue.arrayUnion([courseName])
          });

          result = 'Added to fav!';
        } else {
          result = 'Course already in fav!';
        }
      }
    } catch (e) {
      result = 'Error: $e';
    }
    return result;
  }

  Future<String> deleteCourse(String courseName) async {
    late String result;
    try {
      if (_auth.currentUser != null) {
        var userData = await _firestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .get();

        // Get the current fav_courses array or an empty list if it doesn't exist
        List<String> currentFavCourses =
            List<String>.from(userData.get('fav_course') ?? []);
        if (currentFavCourses.contains(courseName)) {
          await _firestore
              .collection('users')
              .doc(_auth.currentUser!.uid)
              .update({
            'fav_course': FieldValue.arrayRemove([courseName])
          });
          result = 'Deleted form fav!';
        } else {
          result = 'Course doesn\'t exist in fav!';
        }
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  Future<List> loadCourse() async {
    try {
      if (_auth.currentUser != null) {
        var userdata = await _firestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .get();

        return userdata.get('fav_course');
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
    return [];
  }
}
