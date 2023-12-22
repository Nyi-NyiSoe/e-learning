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
                  return GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.85),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return CircularProgressIndicator();
                            }));
                          },
                          child: CourseCard(
                              tag: snapshot.data![index],
                              img: 'lang/${snapshot.data![index].toLowerCase()}.png',
                              index: index,
                              courseName: snapshot.data![index],
                              courseCount: 5),
                        );
                      });
                }
              }))),
    );
  }
}
