class LessonModel {
  String title;
  String imgUrl;
  String description;

  LessonModel(
      {required this.title, required this.imgUrl, required this.description});

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
        title: json['title'],
        imgUrl: json['imgUrl'],
        description: json['description']);
  }
}
