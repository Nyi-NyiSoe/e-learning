import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/podium.png'),
            ),
          ),
        ),
        Expanded(child: ListView.builder(itemBuilder: ((context, index) {
          return Text('data');
        })))
      ],
    );
  }
}
