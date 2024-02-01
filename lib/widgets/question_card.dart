import 'package:edulearn/screens/quiz_question_page.dart';

import 'package:edulearn/widgets/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionCard extends ConsumerWidget {
  QuestionCard(
      {required this.question,
      required this.option,
      required this.answer,
      required this.pageController});

  final String question;
  final List<dynamic> option;
  final String answer;
  final PageController pageController;

  final colorProvider = StateProvider<bool>((ref) => false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorValue = ref.watch(colorProvider);
    final colorController = ref.read(colorProvider.notifier);
   

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
              ...List.generate(option.length, (index) {
                return Choice(
                    index: index + 1,
                    option: option[index],
                    onTap: () async {
                    
                      colorController.state = true;
                       await Future.delayed(const Duration(seconds: 1));
                      pageController.nextPage(
                          duration: const Duration(seconds: 2),
                          curve: Curves.ease);
                          
                    },
                    color: colorValue
                        ? ((index+1).toString() == answer)
                            ? Colors.greenAccent
                            : Colors.redAccent
                        : Colors.white);
              })
            ],
          )),
    );
  }
}
