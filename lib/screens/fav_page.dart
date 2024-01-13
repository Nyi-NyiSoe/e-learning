import 'package:edulearn/screens/course_page.dart';
import 'package:edulearn/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:edulearn/utils/fav.dart';

class FavouriteCoursePage extends StatelessWidget {
  const FavouriteCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: FutureBuilder(
              future: FavouriteCourse().loadCourse(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List<String> languageName = snapshot.data!.keys.toList() ?? [];
                  
                  return GridView.builder(
                      itemCount: snapshot.data!.entries.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.85),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return CoursePage(indexLesson: index, indexLanguage: 0, title: languageName[index]);
                            }));
                          },
                          child: CourseCard(
                              tag: languageName[index],
                              img: 'lang/${languageName[index].toLowerCase()}.png',
                              index: index,
                              courseName: languageName[index],
                              courseCount: 5,
                              type: "Lessons",),
                        );
                      });
                }
              }))),
    );
  }
}
