import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({
    super.key,
  });

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 35,
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 172, 169, 169),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(50)),
        child: Stack(children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                  width: constraints.maxWidth * _controller.value,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFBBDEFB), // Light Blue
                          Color(0xFF1565C0), // Dark Blue
                        ],
                      ),
                      borderRadius: BorderRadius.circular(50)));
            },
          ),
          Positioned.fill(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${(_controller.value * 60).ceil()} second"),
              const Icon(Icons.alarm)
            ],
          ))
        ]),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the AnimationController when the widget is disposed
    _controller.dispose();
    super.dispose();
  }
}
