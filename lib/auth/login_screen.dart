import 'dart:math';

import 'package:evently/widget/button_item.dart';
import 'package:evently/widget/text_button_item.dart';
import 'package:evently/widget/text_faild_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

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
              ),
              SizedBox(height: 16),
              TextFaildItem(
                hintText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: 'password',
                SuffixIcon: Icons.visibility,
              ),
              SizedBox(height: 16),
              TextButtonItem(onPressed: () {}, text: 'Forgot Password ?'),

              ButtonItem(text: 'Login', onPressed: () {}),
              SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t Have Account ? ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextButtonItem(onPressed: () {}, text: 'Create Account'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
