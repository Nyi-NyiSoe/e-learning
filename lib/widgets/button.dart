import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? buttonName;
  const CustomButton({super.key, required this.onPressed,required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
          onPressed: onPressed,
          child: Text(buttonName!)),
    );
  }
}
