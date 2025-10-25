import 'package:evently/auth/register_screen.dart';
import 'package:evently/firebase_service.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/widget/button_item.dart';
import 'package:evently/widget/text_button_item.dart';
import 'package:evently/widget/text_faild_item.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordContorller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: size.height * 0.2,
                    width: double.infinity,
                    fit: BoxFit.contain,
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
                  TextButtonItem(onPressed: () {}, text: 'Forgot Password ?'),

                  ButtonItem(text: 'Login', onPressed: login),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t Have Account ? ",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextButtonItem(
                        onPressed: () => Navigator.of(
                          context,
                        ).pushReplacementNamed(RegisterScreen.routeName),
                        text: 'Create Account',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      FirebaseService.login(
        email: emailController.text,
        password: passwordContorller.text,
      ).then((user) {
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      });
    }
  }
}
