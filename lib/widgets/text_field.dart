import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String? labelText;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.obscureText,
      this.labelText,
      this.suffixIcon,
      required this.keyboardType,
      this.onTap,
      this.prefixIcon,
      this.onChanged
      });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 300,
        child: TextFormField(
          onChanged: onChanged,
          
            keyboardType: keyboardType,
            style: TextStyle(color: Colors.black),
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              prefixIconColor: Colors.blueAccent,
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
