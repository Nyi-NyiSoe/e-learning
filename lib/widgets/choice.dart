import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Choice extends ConsumerWidget {
   Choice({
    super.key,
    required this.index,
    required this.option,
    required this.color
  });
  final int index;
  final String option;
  final Color color;

 

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$index, $option',
            style: TextStyle(color: Colors.black),
          ),
          // Container(
          //   width: 26,
          //   height: 20,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(50),
          //     border: Border.all(color: Colors.grey)
          //   ),
          // )
        ],
      ),
    );
  }
}
