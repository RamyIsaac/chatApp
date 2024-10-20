import 'package:chat_app/helper/show_snackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});
  static String registerScreenId = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

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
                Image.asset('assets/images/scholar.png', height: 100),
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
                  height: 70,
                ),
                const Row(
                  children: [
                    Text(
                      'Register',
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
                        await registerUser();
                        showSnackBar(context, 'Registered successfully');
                        Navigator.pushNamed(context, 'ChatScreen');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(context, 'weak Password');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context, 'email already exist');
                        }
                      } catch (e) {
                        showSnackBar(context, 'there was an error');
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                  text: ' Register',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        ' Sign In ',
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

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
