import 'package:edulearn/screens/compete_page.dart';
import 'package:edulearn/screens/fav_page.dart';
import 'package:edulearn/screens/home_page.dart';
import 'package:edulearn/screens/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Wrapper extends ConsumerWidget {
  Wrapper({super.key});
  final List<Widget> pageList = [Homepage(),const FavouriteCoursePage(),const CompetePage() ,const SettingPage(),];
  final pageProvider = StateProvider((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 36,
            width: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      ref.read(pageProvider.notifier).state = 0;
                    },
                    child: const Icon(Icons.home_outlined)),
                     GestureDetector(
                    onTap: () {
                      ref.read(pageProvider.notifier).state = 1;
                      
                    },
                    child: const Icon(Icons.favorite_outline)),
                    GestureDetector(
                    onTap: () {
                      ref.read(pageProvider.notifier).state = 2;
                      
                    },
                    child: const Icon(Icons.quiz_outlined)),
                GestureDetector(
                    onTap: () {
                      ref.read(pageProvider.notifier).state = 3;
                      
                    },
                    child: const Icon(Icons.settings_outlined))
              ],
            ),
          ),
        ),
      ),
      body: pageList[ref.watch(pageProvider)],
    );
  }
}
