import 'package:edulearn/screens/category_detail.dart';
import 'package:edulearn/utils/load_json.dart';
import 'package:edulearn/widgets/course_card.dart';
import 'package:edulearn/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homepage extends ConsumerWidget {
  Homepage({super.key});

  final TextEditingController searchController = TextEditingController();
  Future<Map<String, dynamic>> getCategory() async {
    var result = await LoadJson().readJson();
    return result;
  }

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
            child: FutureBuilder<Map<String, dynamic>>(
                future: getCategory(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return GridView.builder(
                      padding: EdgeInsets.all(8),
                        itemCount: snapshot.data!['categories'].length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.85, crossAxisCount: 2),
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CourseDetail(
                                  index: index,
                                  result: snapshot,
                                );
                              }));
                            },
                            child: CourseCard(
                                tag: snapshot.data!['categories'][index]
                                    ['name'],
                                img: 'category/${snapshot.data!['categories'][index]['img']}',
                                index: index,
                                courseName: snapshot.data!['categories'][index]['name'],
                                courseCount: (snapshot.data!['categories']).length),
                          );
                        }));
                  }
                })),
          )
        ],
      ),
    ));
  }
}
