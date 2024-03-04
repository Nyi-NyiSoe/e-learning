import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Ranking {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> getRanking()async{
    late String result = '';
    if(_auth.currentUser!=null){
      var userData = await _firestore.collection('users').doc().get();
      Map<dynamic, dynamic> currentFavCourses =
            Map<dynamic, dynamic>.from(userData.get('fav_course') ?? {});
    }
    return result;
  }
  Future<String> setRanking(String categoryName,int score, String quizName) async {
    String result;
    try {
      if (_auth.currentUser != null) {
        await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
          'ranking': {
            categoryName:[quizName,score]
          },
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

  
  }