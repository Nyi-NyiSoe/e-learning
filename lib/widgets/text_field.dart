import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String? labelText;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final TextInputType? keyboardType;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.labelText,
      this.suffixIcon,
      required this.keyboardType,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 300,
        child: TextFormField(
            keyboardType: keyboardType,
            style: TextStyle(color: Colors.black),
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
                suffixIconColor: Colors.blueAccent,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blueAccent), // Border color when focused
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          Colors.blueAccent), // Border color when not focused
                ),
                labelText: labelText,
                labelStyle:
                    const TextStyle(fontSize: 20, color: Colors.blueAccent),
                suffixIcon: suffixIcon)));
  }
}
