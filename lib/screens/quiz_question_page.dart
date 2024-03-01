import 'package:edulearn/utils/load_quiz.dart';
import 'package:edulearn/utils/score.dart';
import 'package:edulearn/widgets/question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizQuestion extends ConsumerWidget {
  QuizQuestion({super.key, required this.quizName,required this.categoryName});

  final _pageController = PageController();
  final String categoryName;
  final String quizName;
  

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionCount = ref.watch(questionCountProvider);
    final questionData = ref.watch(quizProvider(categoryName));
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
                        duration: const Duration(milliseconds: 500), curve: Curves.ease);
                  },
                  child: const Text('Skip'))
            ],
          ),
          body: questionData.when(data: (data) {
            
            var datas = data[quizName];
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
                                    text: '/${datas.length}',
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
                            if (index == datas.length - 1) {
                              return Column(
                                children: [
                                  QuestionCard(
                                    pageController: _pageController,
                                    question: datas[index]['question'],
                                    questionCount: datas.length,
                                    option: datas[index]['choices'],
                                    answer: datas[index]
                                        ['correctAnswerIndex'],
                                  ),

                                ],
                              );
                            } else {
                              return QuestionCard(
                                pageController: _pageController,
                                questionCount: datas.length,
                                question: datas[index]['question'],
                                option: datas[index]['choices'],
                                answer: datas[index]['correctAnswerIndex'],
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
