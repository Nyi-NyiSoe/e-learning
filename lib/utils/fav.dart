import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FavouriteCourse {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> addCourse(
      String courseName, int indexLanguage, int indexLesson) async {
    late String result;
    try {
      if (_auth.currentUser != null) {
        // Fetch the current user's data
        var userData = await _firestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .get();

        // Get the current fav_courses map or an empty map if it doesn't exist
        Map<dynamic, dynamic> currentFavCourses =
            Map<dynamic, dynamic>.from(userData.get('fav_course') ?? {});

        // Check if the course is already in the map
        if (!currentFavCourses.containsKey(courseName)) {
          // Update the map only if the course is not already in it
          Map<dynamic, dynamic> data = {
            courseName: [indexLanguage, indexLesson]
          };
          await _firestore
              .collection('users')
              .doc(_auth.currentUser!.uid)
              .set({'fav_course': data}, SetOptions(merge: true));

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

        // Get the current fav_courses map or an empty map if it doesn't exist
        Map<dynamic, dynamic> currentFavCourses =
            Map<dynamic, dynamic>.from(userData.get('fav_course') ?? {});

        if (currentFavCourses.containsKey(courseName)) {
          currentFavCourses.remove(courseName);

          // Update the map in Firestore
          await _firestore
              .collection('users')
              .doc(_auth.currentUser!.uid)
              .update({'fav_course': currentFavCourses});

          result = 'Deleted from fav!';
        } else {
          result = 'Course doesn\'t exist in fav!';
        }
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  Future<Map<String, dynamic>> loadCourse() async {
    try {
      if (_auth.currentUser != null) {
        var userdata = await _firestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .get();
        print(userdata.get('fav_course'));
        return Map<String, dynamic>.from(userdata.get('fav_course') ?? {});
      }
    } catch (e) {
      print(e.toString());
      return {};
    }
    return {};
  }
}
