import 'package:edulearn/screens/lesson_page.dart';
import 'package:edulearn/widgets/course_card.dart';
import 'package:flutter/material.dart';

class CourseDetail extends StatelessWidget {
  final AsyncSnapshot<Map<String, dynamic>> result;
  final int index;
  const CourseDetail({super.key, required this.index, required this.result});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> languagesMap =
        result.data!['categories'][index]['languages'];
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Hero(
                tag: result.data!['categories'][index]['name'],
                child: Image(
                    image: AssetImage(
                        'images/category/${result.data!['categories'][index]['img']}'))),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      padding: EdgeInsets.all(8),
                      itemCount: languagesMap.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.85, crossAxisCount: 2),
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LessonPage(title: languagesMap.keys.elementAt(index),))),
                          child: CourseCard(
                              tag: languagesMap.keys.elementAt(index),
                              img:
                                  'lang/${languagesMap.values.elementAt(index)}',
                              index: index,
                              courseName: languagesMap.keys.elementAt(index),
                              courseCount: languagesMap.length),
                        );
                      })),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
