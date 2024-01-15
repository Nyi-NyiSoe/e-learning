import 'package:edulearn/screens/course_page.dart';
import 'package:edulearn/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:edulearn/utils/fav.dart';

class FavouriteCoursePage extends StatefulWidget {
  const FavouriteCoursePage({super.key});

  @override
  State<FavouriteCoursePage> createState() => _FavouriteCoursePageState();
}

class _FavouriteCoursePageState extends State<FavouriteCoursePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: RefreshIndicator(
            onRefresh: () async{
              setState(() {
                
              });
            },
            child: FutureBuilder(
                future: FavouriteCourse().loadCourse(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<String> languageName =
                        snapshot.data!.keys.toList() ?? [];
                  
          
                    List<int> indexLanguageList = List.from(snapshot.data!.values.map((indices) => (indices as List<dynamic>)[0] as int));
          
                     List<int> indexLessonList = List.from(snapshot.data!.values.map((indices) => (indices as List<dynamic>)[1] as int));
          
                    return GridView.builder(
                        itemCount: snapshot.data!.entries.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.85),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CoursePage(
                                    indexLesson: indexLessonList[index],
                                    indexLanguage: indexLanguageList[index],
                                    title: languageName[index]);
                              }));
                            },
                            child: CourseCard(
                              tag: languageName[index],
                              img:
                                  'lang/${languageName[index].replaceAll('.', '').replaceAll(' ', '_').toLowerCase()}.png',
                              index: index,
                              courseName: languageName[index],
                              courseCount: 5,
                              type: "Lessons",
                            ),
                          );
                        });
                  }
                })),
          )),
    );
  }
}
