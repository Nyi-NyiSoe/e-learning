import 'package:edulearn/screens/lesson_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:edulearn/utils/rate_course.dart';

class CoursePage extends StatelessWidget {

  final int index;
  final Map<String,String> languages;
  const CoursePage({super.key,required this.languages,required this.index});

  @override
  Widget build(BuildContext context) {
    double courseRating = 0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(languages.keys.elementAt(index)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
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
                          padding: const EdgeInsets.only(left: 10,top: 30),
                          child: Text(
                            '${languages.keys.elementAt(index)} Course',
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Hero(
                          tag: languages.keys.elementAt(index),
                          child: Image(
                            image: AssetImage(
                                'images/lang/${languages.values.elementAt(index)}'),
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
                                  title: const Text('Rate this course'),
                                  content: SizedBox(
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        RatingBar.builder(
                                            allowHalfRating: true,
                                            itemBuilder: (context, _) {
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
                                              var res = await RateCourse()
                                                  .rateCourse(
                                                      courseRating, languages.keys.elementAt(index));
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
                        future: RateCourse().getAverageRatingValue(languages.keys.elementAt(index)),
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            const CircularProgressIndicator();
                          } else {
                            return Text(snapshot.data!.toStringAsFixed(1));
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
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LessonPage();
                        })),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            elevation: 3,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1)),
                                      child: Icon(Icons.play_arrow)),
                                  title: Text('Introduction'),
                                  trailing: Text('10 mins'),
                                ),
                                LinearProgressIndicator(
                                  value: 0.75,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
