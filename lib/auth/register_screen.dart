import 'package:evently/auth/login_screen.dart';
import 'package:evently/firebase_service.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/ui_utils.dart';
import 'package:evently/widget/button_item.dart';
import 'package:evently/widget/text_button_item.dart';
import 'package:evently/widget/text_faild_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordContorller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: size.height * 0.2,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 16),
                TextFaildItem(
                  hintText: 'name',
                  keyboardType: TextInputType.name,
                  prefixIcon: 'name',
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.length < 3) {
                      return 'Invalid name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFaildItem(
                  hintText: 'email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: 'email',
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Invalid Email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFaildItem(
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: 'password',
                  controller: passwordContorller,
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return 'Invalid password';
                    }
                    return null;
                  },
                  isPassword: true,
                ),
                SizedBox(height: 16),

                ButtonItem(text: 'Create Account', onPressed: register),
                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have Account ?",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextButtonItem(
                      onPressed: () => Navigator.of(
                        context,
                      ).pushReplacementNamed(LoginScreen.routeName),
                      text: 'Login',
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

  void register() {
    if (formKey.currentState!.validate()) {
      FirebaseService.register(
            name: nameController.text,
            email: emailController.text,
            password: passwordContorller.text,
          )
          .then((user) {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          })
          .catchError((error) {
            String? errorMessage;
            if (error is FirebaseAuthException) {
              errorMessage = error.message;
            }
            UiUtils.showErrorMessage(errorMessage);
          });
    }
  }
}
