import 'package:flutter/material.dart';

class CourseDetail extends StatelessWidget {
  final AsyncSnapshot<Map<String, dynamic>> result;
  final int index;
  const CourseDetail({super.key, required this.index, required this.result});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> languagesMap = result.data!['categories'][index]['languages'];
    return SafeArea(
        child: Scaffold(
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
                      itemCount:
                          languagesMap.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: ((context, index) {
                        return Text(languagesMap.keys.elementAt(index).toString());
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
