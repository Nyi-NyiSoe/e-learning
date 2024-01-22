import 'package:edulearn/screens/quiz_page.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.red,
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.black,
          labelPadding: const EdgeInsets.only(left: 20, right: 20),
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          tabs: const [
            Tab(
              text: 'Quiz',
            ),
            Tab(
              text: 'Leaderboard',
            ),
          ],
        ),
        Expanded(child: 
        TabBarView(
          controller: _tabController,
          children: [
          QuizPage(),
           Container(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Leaderboard')
            ,
          )

        ],)
        )
       
      ],
    );
  }
}
