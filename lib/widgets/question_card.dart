import 'package:edulearn/widgets/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionCard extends ConsumerWidget {
  const QuestionCard({
    required this.question,
    required this.option,
    required this.answer
  });

  final String question;
  final List<dynamic> option;
  final String answer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: Column(
            children: [
              Text(
                question,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              ...List.generate(
                  option.length,
                  (index){
                    return Choice(
                        index: index + 1,
                        option: option[index],
                        // ans: answer,
                        color: Colors.white
                    );
                  })
            ],
          )),
    );
  }
}
