import 'package:edulearn/utils/user_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

late dynamic data;

@override
void initState() async {
  data = await UserData().getUserData();
  print(data);
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.transparent,
          actions: [Icon(Icons.logout)],
        ),
        body: Column(
          children: [
            Stack(children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                  ),
                ],
              ),
              Positioned(
                top: 100,
                left: 50,
                right: 50,
                child: Center(
                  child: Card(
                    child: Container(
                      width: 300,
                      height: 150,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 50,
                right: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text('data'),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            leading: Text('Currently learning:'),
                            trailing: Text('6 courses'),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ]),
              TextButton(onPressed: () {}, child: Text('Get data'))
          ],
        ),
      ),
    );
  }
}
