import 'package:edulearn/models/category.dart';
import 'package:edulearn/screens/category_detail.dart';
import 'package:edulearn/utils/load_json.dart';
import 'package:edulearn/widgets/course_card.dart';
import 'package:edulearn/widgets/text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homepage extends ConsumerWidget {
  Homepage({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Explore Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: LoadJson().readJson(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    List<CategoryModel> categories = snapshot.data!;
                    return GridView.builder(
                        padding: EdgeInsets.all(8),
                        itemCount: categories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.85, crossAxisCount: 2),
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return CourseDetail(
                                    indexL: index,
                                    result: categories,
                                  );
                                }),
                                );
                              },
                              child: CourseCard(
                                tag: categories[index].categoryName,
                                img: 'category/${categories[index].img}',
                                index: index,
                                courseName: categories[index].categoryName,
                                courseCount:
                                    (categories[index].languages.length),
                              ));
                        }));
                  }
                })),
          )
        ],
      ),
    ));
  }
}
