import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RateCourse {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> rateCourse(double rating, String courseName) async {
    String result;
    try {
      if (_auth.currentUser != null) {
        await _firestore
            .collection('rating')
            .doc(_auth.currentUser!.uid)
            .collection(courseName)
            .doc(_auth.currentUser!.uid)
            .set({'rating': rating});
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

  Future<double> getAverageRating(String courseName) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('ratings')
        .where('courseName', isEqualTo: courseName)
        .get();

    int totalRatings = 0;
    int numberOfUsers = querySnapshot.docs.length;

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
      double ratingValue = userData['value'];
      totalRatings +=
          ratingValue.toInt(); // Assuming the rating is a numeric value
    }

    if (numberOfUsers > 0) {
      double averageRating = totalRatings / numberOfUsers;
      return averageRating;
    } else {
      return 0.0; // Default value if there are no ratings yet
    }
  }
}
