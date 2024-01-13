import 'package:edulearn/models/language.dart';
import 'package:edulearn/models/lesson.dart';
import 'package:edulearn/screens/fav_page.dart';
import 'package:edulearn/screens/lesson_page.dart';
import 'package:edulearn/utils/fav.dart';
import 'package:edulearn/utils/load_json.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:edulearn/utils/rate_course.dart';

class CoursePage extends StatelessWidget {
  final int indexLanguage;
  final int indexLesson;
  final String title;
  const CoursePage({super.key, required this.indexLesson,required this.indexLanguage ,required this.title});

  void showSnackBar(BuildContext context, String message) {}

  @override
  Widget build(BuildContext context) {
    double courseRating = 0;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            actions: [
              PopupMenuButton<String>(onSelected: (value) {
                if (value == 'add') {
                  print('adding to list');
                } else {
                  print('removing from list');
                }
              }, itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      value: 'add',
                      child: GestureDetector(
                          onTap: () async {
                            try {
                              String result =
                                  await FavouriteCourse().addCourse(title,indexLanguage,indexLesson);
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(result),
                                    duration: const Duration(
                                        seconds:
                                            2), // Adjust the duration as needed
                                  ),
                                );
                              }
                            } catch (e) {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Already added!'),
                                    duration: Duration(
                                        seconds:
                                            2), // Adjust the duration as needed
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text('Add to Fav'))),
                  PopupMenuItem(
                      value: 'remove',
                      child: GestureDetector(
                          onTap: () async {
                            String result =
                                await FavouriteCourse().deleteCourse(title);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(result),
                                  duration: const Duration(
                                      seconds:
                                          2), // Adjust the duration as needed
                                ),
                              );
                            }
                          },
                          child: const Text('Remove from Fav'))),
                ];
              })
            ],
          ),
          body: FutureBuilder(
              future: LoadJson().readJson(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        margin: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Card(
                            shadowColor: Colors.black,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 30),
                                    child: Text(
                                      '$title Course',
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Hero(
                                    tag: title,
                                    child: Image(
                                      image: AssetImage(
                                          'images/lang/${snapshot.data![indexLanguage].languages[indexLesson].img}'),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'About Course',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () async {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title:
                                                const Text('Rate this course'),
                                            content: SizedBox(
                                              height: 100,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  RatingBar.builder(
                                                      allowHalfRating: true,
                                                      itemBuilder:
                                                          (context, _) {
                                                        return const Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        );
                                                      },
                                                      onRatingUpdate: (rating) {
                                                        courseRating = rating;
                                                        print(courseRating);
                                                      }),
                                                  ElevatedButton(
                                                      onPressed: () async {
                                                        var res =
                                                            await RateCourse()
                                                                .rateCourse(
                                                                    courseRating,
                                                                    title);
                                                        print(res);
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text('Rate'))
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: Icon(Icons.star_outline)),
                              FutureBuilder(
                                  future:
                                      RateCourse().getAverageRatingValue(title),
                                  builder: ((context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      const CircularProgressIndicator();
                                    } else {
                                      return Text(
                                          snapshot.data!.toStringAsFixed(1));
                                    }
                                    return Text('0.0');
                                  }))
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 30, top: 10, right: 30, bottom: 10),
                        child: const Text(
                          'Sit ex non dolor fugiat. Duis culpa ad non eiusmod proident adipisicing eiusmod dolore aute velit fugiat cupidatat. Laboris ex cupidatat veniam velit fugiat consequat Lorem. Exercitation aliqua quis excepteur nulla proident ullamco.',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Expanded(
                          child: FutureBuilder(
                        future:
                            LoadJson().readJson(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else {
                            print('indexLanguage $indexLanguage');
                            print('index lessons $indexLesson');
                            List<LanguageModel> languages = snapshot.data![indexLanguage].languages.toList();
                            return ListView.builder(
                                itemCount: languages[indexLesson].lessons.length,
                                itemBuilder: ((context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return LessonPage(
                                            title: languages[indexLesson].lessons[index].title,
                                            des: languages[indexLesson].lessons[index].description);
                                      }));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 10),
                                      child: Card(
                                        child: ListTile(
                                          leading:const Icon(Icons.book),
                                          title: Text(languages[indexLesson].lessons[index].title),
                                        ),
                                      ),
                                    ),
                                  );
                                }));
                          }
                        },
                      ))
                    ],
                  );
                }
              })),
    );
  }
}
