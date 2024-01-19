import 'package:edulearn/utils/tab_bar.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Test your knowledge!'),
      ),
      body: TabBarWidget(),
    ));
  }
}
