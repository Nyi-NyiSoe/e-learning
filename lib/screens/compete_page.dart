import 'package:edulearn/widgets/tab_bar.dart';
import 'package:flutter/material.dart';

class CompetePage extends StatefulWidget {
  const CompetePage({super.key});

  @override
  State<CompetePage> createState() => _CompetePageState();
}

class _CompetePageState extends State<CompetePage> with TickerProviderStateMixin{
  late final TabController _tabController =
      TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Test your knowledge!'),
      ),
      body: TabBarWidget(tabController: _tabController,),
    ));
  }
}
