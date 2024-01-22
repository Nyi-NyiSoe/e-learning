import 'package:edulearn/utils/fav.dart';
import 'package:edulearn/widgets/course_card.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FavouriteCourse().loadCourse(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<String> languageName = snapshot.data!.keys.toList();
            return GridView.builder(
                itemCount: languageName.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: ((context, index) {
                  return Text(languageName[index]);
                }));
          }
        }));
  }
}
