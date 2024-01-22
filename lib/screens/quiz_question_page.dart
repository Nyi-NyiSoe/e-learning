import 'package:edulearn/widgets/progress_bar.dart';
import 'package:flutter/material.dart';

class QuizQuestion extends StatelessWidget {
  const QuizQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizz'),
        actions: [ElevatedButton(onPressed: () {}, child: const Text('Skip'))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProgressBar(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text.rich(TextSpan(
                text: "Question 1",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.grey),
                children: [TextSpan(text: "/10",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.grey)
                ),
                
                ]),
                ),
          ),
          const Divider(thickness: 1.5,)
        ],
      ),
    );
  }
}
