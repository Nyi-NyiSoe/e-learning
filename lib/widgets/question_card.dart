import 'package:edulearn/utils/score.dart';
import 'package:edulearn/widgets/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionCard extends ConsumerWidget {
  QuestionCard(
      {required this.question,
      required this.questionCount,
      required this.option,
      required this.answer,
      required this.pageController});

  final String question;
  final List<dynamic> option;
  final String answer;
  final PageController pageController;
  final int questionCount;

  final colorProvider = StateProvider<bool>((ref) => false);
  final isAlreadySelected = StateProvider<bool>((ref) => false);
  final selectedIndex = StateProvider((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorController = ref.read(colorProvider.notifier);
    final colorValue = ref.watch(colorProvider);
    //final scoreController = ref.read(scoreProvider.notifier);
    final select = ref.read(selectedIndex.notifier);
    final selectValue = ref.watch(selectedIndex);

    final score = ref.watch(scoreProvider);

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
                  onTap: () {
                    if ((index + 1).toString() == answer) {
                      // Update score if the answer is correct
                      ref.read(scoreProvider.notifier).state++;

                    }

                    if (colorValue == true) {
                      return;
                    } else {
                      colorController.state = true;
                      select.state = index; // Update color first

                      //await Future.delayed(const Duration(seconds: 1));

                      if (pageController.page! == questionCount - 1) {
//await Future.delayed(const Duration(seconds: 1));
                        // if ((index + 1).toString() == answer) {
                        //   // Update score if the answer is correct
                        //   ref.read(scoreProvider.notifier).state++;
                        // }

                        showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              title: Text('End of quiz!'),
                              content: Consumer(
                                builder: (context, ref, child) {
                                  final score = ref.watch(scoreProvider);
                                  return Text(
                                      'You got $score out of $questionCount questions right!');
                                },
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Done'))
                              ],
                            );
                          }),
                        );
                        //print("correct $score");
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    }
                  },
                  color: colorValue
                      ? ((index + 1).toString() == answer)
                          ? Colors.greenAccent
                          : Colors.redAccent
                      : Colors.white,
                  selectColor: colorValue
                      ? (index == selectValue)
                          ? Colors.blue
                          : Colors.white
                      : Colors.white,
                );
              })
            ],
          )),
    );
  }
}
