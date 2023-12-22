import 'package:edulearn/models/lesson.dart';
import 'package:flutter/material.dart';

class LessonPage extends StatelessWidget {
  final String title;
  //final String imgUrl;
  final String des;
  const LessonPage({super.key, required this.title, required this.des});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                (title),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Image.network(
                  'https://i.stack.imgur.com/c6bdI.png',
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  des,
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
