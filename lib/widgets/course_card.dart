import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final Object tag;
  final String img;
  final int? index;
  final String? courseName;
  final int? courseCount;
  const CourseCard(
      {super.key,
      required this.tag,
      required this.img,
      required this.index,
      required this.courseName,
      required this.courseCount
    
      });
     

  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 3,
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Hero(
              tag: tag,
              child: Image(
                image: AssetImage(
                    'images/$img'),
                height: 140,
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                   courseName!,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        '$courseCount Courses'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
