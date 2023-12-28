// ignore_for_file: unused_import, unused_local_variable

// ignore_for_file: must_be_immutable

import 'package:abdo/Widgets/CustomEmailText.dart';
import 'package:abdo/Widgets/CustomPasswordConfirmationfield.dart';
import 'package:abdo/Widgets/CustomTextPassword.dart';
import 'package:abdo/Widgets/CustomUserText.dart';
import 'package:abdo/login_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
// import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email;

  TextEditingController controller = TextEditingController();
  String? password;

  String? userName;

  String? confirmPassword;

  bool isLoading = false;
  bool isPasswordMatchesRuels = false;
  final GlobalKey<FormState> _gdf56565 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.orange,
          title: const Padding(
            padding: EdgeInsets.all(80),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Container(
          child: Form(
            key: _gdf56565,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8, top: 10),
                      child: Text(
                        'User Name',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                    CustomUserTextFiled(
                      hintText: 'Enter user name',
                    ),
                    Container(
                      height: 4,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8, top: 10),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                    CustomEmailTextFiled(
                      hintText: 'Enter  email',
                      onChange: (data) {
                        email = data;
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8, top: 10),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                    CustomPasswordTextFiled(
                      myController: controller,
                      hintText: 'Enter Password',
                      onChange: (data) {
                        password = data;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: FlutterPwValidator(
                            uppercaseCharCount: 1,
                            specialCharCount: 1,
                            numericCharCount: 2,
                            normalCharCount: 2,
                            width: 400,
                            height: 180,
                            minLength: 8,
                            onSuccess: () {
                              setState(() {
                                isPasswordMatchesRuels = true;
                              });
                              // ShowSnackBar(context, 'Password is matched');
                            },
                            onFail: () {
                              setState(() {
                                isPasswordMatchesRuels = false;
                              });
                            },
                            controller: controller,),
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8, top: 20),
                      child: Text(
                        ' Confirm Password',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 4,
                    ),
                    CustomPasswordConfirmationTextFiled(
                      password: password,
                      hintText: 'Enter Password again',
                    ),
                    Container(
                      height: 20,
                    ),
                    Center(
                        child: MaterialButton(
                      color: Colors.orange,
                      child: const Text('signup'),
                      onPressed: () async {
                        if (_gdf56565.currentState!.validate()) {
                          if (!isPasswordMatchesRuels) {
                            ShowSnackBar(
                                context, 'Password should match rules',);
                            return;
                          }
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            userRegister();
                            FirebaseAuth.instance.currentUser!
                                .sendEmailVerification();
                            navMethod(context);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Login();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            '  Login',
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,),
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
      ),
    );
  }

  void navMethod(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Login();
        },
      ),
    );
  }

  void ShowSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Future<void> userRegister() async {
    final auth = FirebaseAuth.instance;
    final UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!,);
  }
}
