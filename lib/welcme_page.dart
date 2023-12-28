//import 'dart:js';

// ignore_for_file: prefer_const_constructors

import 'package:abdo/login_Page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void showtext() {}

  @override
  // to delay the welcome page
  void initState() {
    Future.delayed(const Duration(seconds: 5, milliseconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),);
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('cho',
                          textStyle: TextStyle(
                              fontSize: 30,
                              color: Colors.orange,
                            ),),
                      RotateAnimatedText('OPTIMISTIC',
                          textStyle: TextStyle(
                              letterSpacing: 3,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,),),
                      RotateAnimatedText(
                        'DIFFERENT',
                        textStyle: TextStyle(
                          fontSize: 30,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                    pause: Duration(milliseconds: 500),
                  ),
                ),
                // image
                Image.asset("assets/test2.jpg"),
                DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                    // buttoun
                    child: MaterialButton(
                      onPressed: () {},
                    ),),
                TextButton(
                  style: TextButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.blue,
                    side: const BorderSide(color: Colors.orange),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Login();
                    },),);
                  },
                  child: const Text(
                    'lets go',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
