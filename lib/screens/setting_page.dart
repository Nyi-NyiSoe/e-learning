import 'package:edulearn/utils/load_json.dart';
import 'package:edulearn/utils/rate_course.dart';
import 'package:flutter/material.dart';
import 'package:edulearn/authenticate/auth_service.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(actions: [
              IconButton(
                  onPressed: () async {
                    await AuthService().signOut();
                  },
                  icon: const Icon(Icons.logout))
            ]),
            body:  Column(
              children: [
                Center(
                  child: Container(
                    color: Colors.red,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 64,
                        ),
                        Text(
                          'Name',
                          style: TextStyle(fontSize: 30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         
                          children: [
                            Column(
                              children: [Text('5'), Text('Courses')],
                            ),
                            Container(
                              height: 50,
                              width: 2,
                              decoration: BoxDecoration(color: Colors.black),
                            ),
                            Column(
                              children: [
                                Text(
                                  '199',
                                ),
                                Text('Ranking')
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      ElevatedButton(onPressed: ()async{
                        var data = await LoadJson().readJson();
                        print(data[0].languages[0].langName);
                      }, child: Text('data'))
                    ],
                  ),
                )
              ],
            )));
  }
}
