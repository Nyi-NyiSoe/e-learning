import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RateCourse {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Map<String, double> result = {};
  int userCount = 0;

  Future<double> getAverageRatingValue(String title) async {
    await getAverageRating(title);
    double r = 0;
    print('user count $userCount');
    result.forEach((key, value) {
      if (key== title) {
        r += value / userCount;
        print(key+value.toString()+r.toString());
      }
    });
    return r;
  }

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

  Future getAverageRating(String title) async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;

        // Access the uid
        String uid = documentSnapshot.id;

        // Access the 'rating' field
        try{
          Map<String, double> ratingMap =
            Map<String, double>.from(userData['rating']);
        ratingMap.forEach(
          (key, value) {
            if (result.containsKey(key)) {
              result[key] = result[key]! + value;
            } else {
              result[key] = value;
            }
          },
        );
        if (userData.containsKey('rating') &&
            userData['rating'].containsKey(title)) {
          userCount += 1;
        }
        }catch (e){
          print(e.toString());
        }
     
       
      }
    } catch (e) {
      print('Error fetching users: $e');
    }
  }
}
