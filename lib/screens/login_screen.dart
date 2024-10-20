import 'package:chat_app/helper/show_snackBar.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static String loginScreenId = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 70,
                ),
                Image.asset(
                  'assets/images/scholar.png',
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Scholar Chat',
                      style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 32,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                const Row(
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormFieldWidget(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Ex: yourNamexx@gmail.com',
                  icon: Icon(Icons.email_outlined),
                  label: 'Email',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormFieldWidget(
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                  label: 'Password',
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButtonWidget(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await loginUser();
                          showSnackBar(context, 'Registered successfully');
                          Navigator.pushNamed(context, 'ChatScreen');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(
                                context, 'No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(context,
                                'Wrong password provided for that user.');
                          }
                        } catch (e) {
                          showSnackBar(context, 'there was an error');
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    },
                    text: 'Sign In'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t Have an account? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RegisterScreen.registerScreenId);
                      },
                      child: Text(
                        'Register ',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
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

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
