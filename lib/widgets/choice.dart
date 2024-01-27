import 'package:flutter/material.dart';

class Choice extends StatelessWidget {
  const Choice({
    super.key, required this.index, required this.option,
  });
final int index;
final String option;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$index, $option',
            style: TextStyle(color: Colors.grey.shade500),
          ),
          Container(
            width: 26,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.grey)
            ),
          )
        ],
      ),
    );
  }
}
