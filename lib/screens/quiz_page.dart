import 'package:edulearn/screens/quiz_question_page.dart';
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
                  return GestureDetector(
                      onTap: () async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('HTML Quiz'),
                                content:
                                    Text("Are you ready to begin the quiz?"),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Cancel')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: ((context) {
                                              return QuizQuestion();
                                            })));
                                          },
                                          child: const Text('Start!')),
                                    ],
                                  )
                                ],
                              );
                            });
                      },
                      child: Text(languageName[index]));
                }));
          }
        }));
  }
}
