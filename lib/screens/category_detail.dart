import 'package:edulearn/models/category.dart';
import 'package:edulearn/screens/lesson_page.dart';
import 'package:edulearn/widgets/course_card.dart';
import 'package:flutter/material.dart';

class CourseDetail extends StatelessWidget {
  final List<CategoryModel> result;
  final int indexL;
  const CourseDetail({super.key, required this.indexL, required this.result});

  @override
  Widget build(BuildContext context) {
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
                tag: result[indexL].categoryName,
                child: Image(
                    image:
                        AssetImage('images/category/${result[indexL].img}'))),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      padding: EdgeInsets.all(8),
                      itemCount: result[indexL].languages.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.85, crossAxisCount: 2),
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LessonPage(
                                        title: result[indexL]
                                            .languages
                                            .keys
                                            .elementAt(index),
                                      ))),
                          child: CourseCard(
                              tag:
                                  result[indexL].languages.keys.elementAt(index),
                              img:
                                  'lang/${result[indexL].languages.values.elementAt(index).replaceAll('_', ' ')}',
                              index: index,
                              courseName:
                                  result[indexL].languages.keys.elementAt(index),
                              courseCount: result[indexL].languages.length),
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
