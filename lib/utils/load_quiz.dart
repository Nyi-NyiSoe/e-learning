import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riverpod/riverpod.dart';

final quizProvider = FutureProvider<Map<String,dynamic>>((ref)async{

final String response = await rootBundle.loadString('assets/quiz.json');

final data = await json.decode(response);

return data;

});