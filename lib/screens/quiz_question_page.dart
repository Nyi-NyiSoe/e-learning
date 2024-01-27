import 'package:edulearn/utils/load_quiz.dart';
import 'package:edulearn/widgets/choice.dart';
import 'package:edulearn/widgets/progress_bar.dart';
import 'package:edulearn/widgets/question_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizQuestion extends StatelessWidget {
  const QuizQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('Quiz'),
        actions: [ElevatedButton(onPressed: () {}, child: Text('Skip'))],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final questionData = ref.watch(quizProvider);
         
          return questionData.when(data: (data){
            print(data['HTML'].length);
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
          itemCount: data['HTML'].length,
          itemBuilder: ((context, index) {
          return QuestionCard(index, data['HTML'][index]['question'],  data['HTML'][index]['choices']);
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

