import 'dart:ui';

import 'package:edulearn/screens/login_page.dart';
import 'package:edulearn/screens/signup_page.dart';
import 'package:edulearn/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:edulearn/widgets/text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final passwordVisibleProvider = StateProvider<bool>((ref) => true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                height: MediaQuery.of(context).size.height / 3,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Container(
                      child: const Text(
                    'Edu Learn',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )),
                )),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 6 - 25,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Material(
                  elevation: 3,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 35, color: Colors.blueAccent),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomTextField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  obscureText: false,
                                  labelText: 'Email'),
                             const  SizedBox(
                                height: 50,
                              ),
                              Consumer(
                                builder: (context, ref, child) {
                                  final passwordVisible =
                                      ref.watch(passwordVisibleProvider);

                                  return CustomTextField(
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: passwordController,
                                    obscureText: passwordVisible,
                                    labelText: 'Password',
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          ref
                                              .read(passwordVisibleProvider
                                                  .notifier)
                                              .state = !passwordVisible;
                                        },
                                        icon: passwordVisible
                                            ? const Icon(Icons.visibility_off)
                                            : const Icon(Icons.visibility)),
                                  );
                                },
                              ),
                            
                            ],
                          ),
                          Column(
                            children: [
                              CustomButton(
                                buttonName: 'SIGNUP',
                                onPressed: () {
                                   print(emailController.text);
                                   print(passwordController.text);
                                },
                              ),
                               const SizedBox(
                                    height: 15,
                                  ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Already have an account?',
                                    style: TextStyle(color: Colors.blueAccent),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return  LoginPage(); 
                                        }));
                                      },
                                      child: const Text('Login',
                                          style: TextStyle(
                                              color: Colors.blueAccent)))
                                ],
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ),
            ),
          ],
        ));
  }
}
