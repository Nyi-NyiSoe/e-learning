import 'package:edulearn/models/language.dart';

class CategoryModel {
  final String categoryName;
  final String img;
  final List<LanguageModel> languages;

  CategoryModel(
      {required this.categoryName, required this.img, required this.languages});

  CategoryModel.fromJson(Map<String, dynamic> json)
      : categoryName = json['name'],
        img = json['img'],
        languages = (json['languages'] as List<dynamic>)
            .map((e) => LanguageModel.fromJson(e))
            .toList();
}
