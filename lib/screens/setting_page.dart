import 'package:edulearn/models/user.dart';
import 'package:edulearn/utils/load_json.dart';
import 'package:edulearn/utils/user_data.dart';
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
          body: FutureBuilder(
              future: UserData().getUserData(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                print('Snapshot userdata${snapshot.data}');
                  return Column(
                    children: [
                      Center(
                        child: Container(
                          color: Colors.red,
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    snapshot.data!.pfp.toString()),
                                radius: 64,
                              ),
                              Text(
                                snapshot.data!.name!,
                                style: const TextStyle(fontSize: 30),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(snapshot.data?.favCourse?.length
                                          ?.toString() ?? ''),
                                      Text('Courses')
                                    ],
                                  ),
                                  Container(
                                    height: 50,
                                    width: 2,
                                    decoration:
                                        BoxDecoration(color: Colors.black),
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
                            ElevatedButton(
                                onPressed: () async {
                                  MyUser? user = await UserData().getUserData();
                                  print(user);
                                },
                                child: Text('data'))
                          ],
                        ),
                      )
                    ],
                  );
                }
              }))),
    );
  }
}
