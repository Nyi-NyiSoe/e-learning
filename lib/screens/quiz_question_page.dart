import 'package:edulearn/utils/load_quiz.dart';
import 'package:edulearn/utils/score.dart';
import 'package:edulearn/widgets/question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizQuestion extends ConsumerWidget {
  QuizQuestion({super.key, required this.quizName});

  final _pageController = PageController();

  final String quizName;

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionCount = ref.watch(questionCountProvider);
     final questionData = ref.watch(quizProvider);
     //final score = ref.watch(scoreProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: const Text('Quiz'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 250), curve: Curves.ease);
                },
                child: const Text('Skip'))
          ],
        ),
        body: questionData.when(data: (data) {
              print(data[quizName][2]['correctAnswerIndex']);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text.rich(
                      TextSpan(
                          text: 'Question $questionCount',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: Colors.grey),
                          children: [
                            TextSpan(
                                text: '/${data[quizName].length}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(color: Colors.grey)),
                          ]),
                    ),
                  ),
                  const Divider(
                    thickness: 1.5,
                  ),
                  Expanded(
                    child: PageView.builder(
                      onPageChanged: (vale) {
                        print(questionCount);
                        
                        ref.read(questionCountProvider.notifier).state++;
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      itemCount: data[quizName].length,
                      itemBuilder: ((context, index) {
                        if (index == data[quizName].length - 1) {
                          return Column(
                            children: [
                              QuestionCard(
                                pageController: _pageController,
                                question: data[quizName][index]['question'],
                                questionCount: data[quizName].length,
                                option: data[quizName][index]['choices'],
                                answer: data[quizName][index]
                                    ['correctAnswerIndex'],
                              ),
                             
                            ],
                          );
                        } else {
                          return QuestionCard(
                            pageController: _pageController,
                            questionCount: data[quizName].length,
                            question: data[quizName][index]['question'],
                            option: data[quizName][index]['choices'],
                            answer: data[quizName][index]['correctAnswerIndex'],
                          );
                        }
                      }),
                    ),
                  )
                ],
              );
            }, error: (error, stackStrace) {
              print(error.toString());
              return Text(error.toString());
            }, loading: () {
              return const CircularProgressIndicator();
            })
      ),
    );
  }
}
