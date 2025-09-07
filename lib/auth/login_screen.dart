import 'package:evently/auth/register_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
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
              ),
              SizedBox(height: 16),
              TextFaildItem(
                hintText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: 'password',
                SuffixIcon: Icons.visibility,
                controller: passwordContorller,
              ),
              SizedBox(height: 16),
              TextButtonItem(onPressed: () {}, text: 'Forgot Password ?'),

              ButtonItem(
                text: 'Login',
                onPressed: () => Navigator.of(
                  context,
                ).pushReplacementNamed(HomeScreen.routeName),
              ),
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
    );
  }
}
