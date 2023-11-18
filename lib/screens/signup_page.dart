import 'package:edulearn/models/user.dart';
import 'package:edulearn/screens/login_page.dart';
import 'package:edulearn/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:edulearn/widgets/text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:edulearn/authenticate/auth_service.dart';

class SignUpPage extends StatefulWidget {
    final void Function() toggleView;
  const SignUpPage({super.key,required this.toggleView});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final passwordVisibleProvider = StateProvider<bool>((ref) => true);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
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
                      child: KeyboardVisibilityBuilder(
                          builder: (context, isKeyboardVisible) {
                        return SingleChildScrollView(
                          physics: isKeyboardVisible
                              ? const AlwaysScrollableScrollPhysics()
                              : const NeverScrollableScrollPhysics(),
                          child: Container(
                            height: isKeyboardVisible
                                ? MediaQuery.of(context).size.height * 1.2
                                : MediaQuery.of(context).size.height * 0.8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 35, color: Colors.blueAccent),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.blueAccent,
                                          backgroundImage: NetworkImage(
                                              'https://cdn-icons-png.flaticon.com/512/10099/10099965.png'),
                                          radius: 64,
                                        ),
                                        Positioned(
                                            left: 80,
                                            bottom: -10,
                                            child: IconButton(
                                              style: const ButtonStyle(
                                                  iconColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.white)),
                                              onPressed: () {},
                                              icon: const Icon(
                                                  Icons.add_a_photo_outlined),
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    CustomTextField(
                                        controller: nameController,
                                        obscureText: false,
                                        labelText: 'Name',
                                        keyboardType:
                                            TextInputType.visiblePassword),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    CustomTextField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        controller: emailController,
                                        obscureText: false,
                                        labelText: 'Email'),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Consumer(
                                      builder: (context, ref, child) {
                                        final passwordVisible =
                                            ref.watch(passwordVisibleProvider);

                                        return CustomTextField(
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          controller: passwordController,
                                          obscureText: passwordVisible,
                                          labelText: 'Password',
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                ref
                                                    .read(
                                                        passwordVisibleProvider
                                                            .notifier)
                                                    .state = !passwordVisible;
                                              },
                                              icon: passwordVisible
                                                  ? const Icon(
                                                      Icons.visibility_off)
                                                  : const Icon(
                                                      Icons.visibility)),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Column(
                                  children: [
                                    CustomButton(
                                      buttonName: 'SIGNUP',
                                      onPressed: () async {
                                        print(nameController.text);
                                        print(emailController.text);
                                        print(passwordController.text);
                                        await AuthService().signUp(MyUser(
                                          name: nameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ));
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Already have an account?',
                                          style: TextStyle(
                                              color: Colors.blueAccent),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                            onTap: widget.toggleView,
                                            child: const Text('Login',
                                                style: TextStyle(
                                                    color: Colors.blueAccent)))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      })),
                ),
              ),
            ),
          ],
        ));
    }));
  }
}