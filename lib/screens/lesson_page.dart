import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:edulearn/utils/rate_course.dart';

class LessonPage extends StatelessWidget {
  final String title;

  const LessonPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double courseRating = 0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
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
                child: Image(
                  image: AssetImage(
                      'images/lang/${title.replaceAll('.', '').toLowerCase()}.png'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 10),
                      child: Text(
                        '$title basic course',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star_outline),
                        FutureBuilder(future: RateCourse().getAverageRating(title), builder: (context,snaphot){
                         if(snaphot.connectionState == ConnectionState.waiting){
                          print(snaphot.data);
                          return Text('0.0');
                         }
                         else{
                           return Text(snaphot.data.toString());
                         }
                        }),
                        const Icon(Icons.alarm_rounded),
                        const Text('6 hours')
                      ],
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: () async {
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Rate this course'),
                              content: Container(
                                height: 100,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RatingBar.builder(
                                        allowHalfRating: true,
                                        itemBuilder: (context, _) {
                                          return Icon(
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
                                              .rateCourse(courseRating, title);
                                          print(res);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Rate'))
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Text('Rate course'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
