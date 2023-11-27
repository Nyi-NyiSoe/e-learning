class CategoryModel {
  final String categoryName;
  final String img;
  final Map<String, String> languages;
  CategoryModel(
      {required this.categoryName, required this.img, required this.languages});
      
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    Map<String, String> languagesMap = {};
    json['languages'].forEach((key, value) {
      languagesMap[key] = value;
    });

    return CategoryModel(
      categoryName: json['name'],
      img: json['img'],
      languages: languagesMap,
    );
  }
}
