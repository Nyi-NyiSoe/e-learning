import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Choice extends ConsumerWidget {
  Choice(
      {super.key,
      required this.index,
      required this.option,
      required this.color,
      required this.onTap,
      required this.selectColor
      });
  final int index;
  final String option;
  final Color color;
  final Function()? onTap;
  final Color selectColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                '$index, $option',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(50),
                color: selectColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
