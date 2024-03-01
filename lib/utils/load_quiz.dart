import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riverpod/riverpod.dart';

final quizProvider = FutureProvider.family<Map<String,dynamic>,String>((ref,quizName)async{
    
      final String response = await rootBundle.loadString('assets/quiz.json');
      
      final data = await json.decode(response);
      
      return data[quizName];

});

