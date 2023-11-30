import 'dart:convert';
import 'package:edulearn/models/lesson.dart';
import 'package:flutter/services.dart';

class LoadLessons {
  final List<LessonModel> lessonList = [];
  Future<List<LessonModel>> loadLessons(String title) async {
    try {
      final String response = await rootBundle.loadString('assets/lesson.json');

       return parseLessons(title, response);
      
      
    } catch (e) {
      print(e.toString());
    }
    return [];
  }

  List<LessonModel> parseLessons(String category, String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    if (jsonMap.containsKey(category)) {
      List<dynamic> lessonsJson = jsonMap[category];
      return lessonsJson
          .map((lessonJson) => LessonModel.fromJson(lessonJson))
          .toList();
    } else {
      return [];
    }
  }
}
