import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RateCourse {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> rateCourse(double rating, String courseName) async {
    String result;
    try {
      if (_auth.currentUser != null) {
        await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
          'rating': {courseName: rating},
        }, SetOptions(merge: true));
        result = 'success';
        return result;
      }
    } catch (e) {
      print(e.toString());
      result = e.toString();
      return result;
    }
    return 'Error';
  }

  Future getAverageRating() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('users').doc(_auth.currentUser!.uid).get();
        if (snapshot.exists) {
  // Access the data as a map
  Map<String, dynamic>? userData = snapshot.data();

  // Check if the 'rating' field exists in the data
  if (userData != null && userData.containsKey('rating')) {
    // Access the 'rating' map
    Map<String, dynamic> ratingData = userData['rating'];

    // Now you can loop through the courses and their ratings
    ratingData.forEach((courseName, rating) {
      print('Course: $courseName, Rating: $rating');
    });
  } else {
    print('No rating data found for the user.');
  }
} else {
  print('Document does not exist.');
}
  }
}
