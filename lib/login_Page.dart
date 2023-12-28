// ignore_for_file: duplicate_import, use_build_context_synchronously

import 'package:abdo/Widgets/CustomEmailText.dart';
import 'package:abdo/Widgets/CustomTextPassword.dart';
import 'package:abdo/helper/ShowSnackBar.dart';
import 'package:abdo/helper/ShowSnackBar.dart';
import 'package:abdo/home_page.dart';
import 'package:abdo/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  Future signInWithGoogle() async {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return  HomePage();
        },
      ),
    );
  }

  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(250),
                    ),
                    child: Image.asset(
                      'assets/test.jpg',
                      width: 500.0,
                      fit: BoxFit.fitWidth,
                      height: 300,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign In',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20.0),
                  CustomEmailTextFiled(
                    hintText: 'Enter email',
                    onChange: (data) {
                      email = data;
                    },
                  ),
                  Container(
                    height: 20,
                  ),
                  CustomPasswordTextFiled(
                    myController: TextEditingController(),
                    hintText: 'Enter password',
                    onChange: (data) {
                      password = data;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      print('Forgot Password');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              try {
                                await FirebaseAuth.instance
                                    .sendPasswordResetEmail(email: email!);
                                ShowSnackBar(context,
                                    'Password reset is sent to your email',);
                              } catch (e) {
                                ShowSnackBar(context,
                                    'Please check that email enter is valid then try again!',);
                              }
                            },
                            child: const Text(
                              'Forget Password?',
                              // textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 4,
                  ),
                  Center(
                      child: MaterialButton(
                    color: Colors.orange,
                    child: const Text(
                      'Sign in',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          final auth = FirebaseAuth.instance;
                          final UserCredential user =
                              await auth.signInWithEmailAndPassword(
                                  email: email!, password: password!,);
                          if (user.user!.emailVerified) {
                            navMethod(context);
                          } else {
                            ShowSnackBar(context, 'Please verify your email');
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            ShowSnackBar(
                                context, 'No user found for that email.',);
                          } else if (e.code == 'wrong-password') {
                            ShowSnackBar(
                                context, 'No user found for that email.',);
                          }
                        }
                        setState(() {
                          isLoading = false;
                        });
                        // ShowSnackBar(context, 'Email already created');
                      }
                    },
                  ),),
                  Container(
                    height: 5,
                  ),
                  const Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      signInWithGoogle();
                    },
                    child: Image.asset(
                      'assets/google.jpg',
                      width: 40,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account yet?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const SignUpPage();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void navMethod(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return HomePage();
      },
    ),
  );
}
