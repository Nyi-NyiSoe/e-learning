import 'package:edulearn/screens/leaderboard_page.dart';
import 'package:edulearn/screens/quiz_page.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  TabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Column(
        children: [
          TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.purple,
            isScrollable: true,
            labelColor: Colors.black,
            labelPadding: const EdgeInsets.only(left: 20, right: 20),
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            tabs: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Tab(
                  text: 'Web Development',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Tab(
                  text: 'Mobile Development',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Tab(
                  text: 'Database Development',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Tab(
                  text: 'Game Development',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Tab(
                  text: 'Devops',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Tab(
                  text: 'AI Development',
                ),
              ),
            ],
          ),
          Expanded(
              child: TabBarView(
            children: [
              QuizPage(quizName: 'Web Development'),
              QuizPage(quizName: 'Mobile Development'),
              QuizPage(quizName: 'Database Development'),
              QuizPage(quizName: 'Game Development'),
              QuizPage(quizName: 'Devops'),
              QuizPage(quizName: 'AI Development')
            ],
          ))
        ],
      ),
    );
  }
}
