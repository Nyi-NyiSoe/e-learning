import 'package:edulearn/utils/load_quiz.dart';

import 'package:edulearn/widgets/progress_bar.dart';
import 'package:edulearn/widgets/question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizQuestion extends StatelessWidget {
   QuizQuestion({super.key});

  PageController _pageController = PageController();
  PageController get pageController => _pageController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('Quiz'),
        actions: [ElevatedButton(onPressed: () {
          _pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
        }, child: Text('Skip'))],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final questionData = ref.watch(quizProvider);
         
          return questionData.when(data: (data){
            print(data['HTML'][2]['correctAnswerIndex'] );
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 const ProgressBar(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text.rich(
              TextSpan(
                  text: 'Questions 1',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.grey),
                  children: [
                    TextSpan(
                        text: '{/10}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.grey)),
                  ]),
            ),
          ),
          Divider(
            thickness: 1.5,
          ),
        Expanded(child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          itemCount: data['HTML'].length,
          itemBuilder: ((context, index) {
          return QuestionCard(question: data['HTML'][index]['question'],option: data['HTML'][index]['choices'],answer: data['HTML'][index]['correctAnswerIndex'],);
        })))
              ],
            );
          }, error: (error,stackStrace){
            print(error.toString());
            return Text(error.toString());
          }, loading: (){
            return const CircularProgressIndicator();
          });
        },
        
        ),
      ),
    );
  }
}

