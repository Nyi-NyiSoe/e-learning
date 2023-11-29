import 'package:flutter/material.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Introduction to HTML',
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
                  'Eu magna nostrud commodo reprehenderit irure. Magna ea pariatur Lorem enim eu et nostrud nostrud ut occaecat elit consequat. Non eu sint Lorem exercitation ad culpa dolore aliqua adipisicing irure quis amet aliquip duis. Irure esse sit sit officia laborum consequat pariatur dolor do commodo magna et. Adipisicing do commodo nostrud voluptate officia deserunt pariatur et sunt. Aute consequat proident tempor exercitation minim reprehenderit magna nulla cupidatat. Ut esse amet et aliquip exercitation.',
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
