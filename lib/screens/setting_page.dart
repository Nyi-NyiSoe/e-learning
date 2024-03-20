import 'dart:convert';

import 'package:edulearn/authenticate/auth_service.dart';
import 'package:edulearn/utils/user_data.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    String convertIntListToString(List<int> intList) {
      return String.fromCharCodes(intList);
    }

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: UserData().getUserData(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              right: 10,
                              child: ElevatedButton(
                                  onPressed: () {
                                    AuthService().signOut();
                                  },
                                  child: const Icon(Icons.logout)),
                            ),
                            const Positioned(
                                top: 10,
                                left: 10,
                                child: Text('My Profile',
                                    style: TextStyle(fontSize: 25))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 120,
                    left: 37,
                    right: 37,
                    child: Stack(
                      children: [
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 150,
                            width: 320,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    snapshot.data!.name!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                  ListTile(
                                    leading: Text('Currently learning:'),
                                    trailing: Text('10 Courses'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 55,
                    left: 37,
                    right: 37,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: CachedNetworkImageProvider(
                          String.fromCharCodes(snapshot.data!.pfp!.toList()),
                          maxHeight: 25,
                          maxWidth: 25,
                          scale: 0.1),
                    ),
                  ),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
