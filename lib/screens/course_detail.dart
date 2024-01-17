import 'package:edulearn/models/category.dart';
import 'package:edulearn/screens/course_page.dart';
import 'package:edulearn/utils/load_json.dart';
import 'package:edulearn/widgets/course_card.dart';
import 'package:flutter/material.dart';

class CourseDetail extends StatelessWidget {
  final int indexL;
  const CourseDetail({super.key, required this.indexL});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Categories!'),
            ),
            body: FutureBuilder(
                future: LoadJson().readJson(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.blue,
                          child: Hero(
                              tag: snapshot.data![indexL].categoryName,
                              child: Image(
                                  image: AssetImage(
                                      'images/category/${snapshot.data![indexL].img}'))),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: GridView.builder(
                                    padding: EdgeInsets.all(8),
                                    itemCount:
                                        snapshot.data![indexL].languages.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: 0.85,
                                            crossAxisCount: 2),
                                    itemBuilder: ((context, index) {
                                      return GestureDetector(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CoursePage(
                                                        indexLesson: index,
                                                        indexLanguage: indexL,
                                                        title: snapshot
                                                            .data![indexL]
                                                            .languages
                                                            .elementAt(index)
                                                            .langName,
                                                      ))),
                                          child: CourseCard(
                                              tag: snapshot
                                                  .data![indexL].languages
                                                  .elementAt(index)
                                                  .langName,
                                              img:
                                                  'lang/${snapshot.data![indexL].languages.elementAt(index).img}',
                                              index: index,
                                              courseName: snapshot
                                                  .data![indexL].languages
                                                  .elementAt(index)
                                                  .langName,
                                              courseCount: snapshot
                                                  .data![indexL].languages
                                                  .elementAt(index)
                                                  .lessons
                                                  .length,
                                                  type: "Lessons",),
                                                  );
                                    })),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  }
                }))));
  }
}
