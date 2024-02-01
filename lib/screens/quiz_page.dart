import 'package:edulearn/screens/quiz_question_page.dart';
import 'package:edulearn/utils/load_quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizPage extends ConsumerWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final questionProvider = ref.watch(quizProvider);
    return questionProvider.when(data: (data){
      return  Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: ((context, index) {
              return GestureDetector(
                            onTap: () async {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('HTML Quiz'),
                                      content:
                                          Text("Are you ready to begin the quiz?"),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Cancel')),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: ((context) {
                                                    return QuizQuestion(quizName: data.keys.elementAt(index),);
                                                  })));
                                                },
                                                child: const Text('Start!')),
                                          ],
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Card(
                                child: ListTile(
                                  leading: Text(data.keys.elementAt(index)),
                                  trailing: Text('${data[data.keys.elementAt(index)].length} Questions'),
                                ),
                              ),
                            ));
            }))
          ),
        ],
      );
    }, error: (error,stackTrace){
      print(error.toString());
      return Text('Erro loading data!');
    }, loading: (){
      return const CircularProgressIndicator();
    });
     
  }
}
