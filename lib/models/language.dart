import 'package:edulearn/models/lesson.dart';

class LanguageModel {
  final String langName;
  final String img;
  final List<LessonModel> lessons;
  LanguageModel(
      {required this.langName, required this.img, required this.lessons});

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> lessonList = json['lessons'] ?? [];
    return LanguageModel(
        langName: json['name'],
        img: json['img'],
        lessons: lessonList.map((e) => LessonModel.fromJson(e)).toList());
  }
}
