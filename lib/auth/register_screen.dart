import 'package:evently/auth/login_screen.dart';
import 'package:evently/widget/button_item.dart';
import 'package:evently/widget/text_button_item.dart';
import 'package:evently/widget/text_faild_item.dart';
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
                hintText: 'name',
                keyboardType: TextInputType.name,
                prefixIcon: 'name',
                controller: nameController,
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

              ButtonItem(text: 'Create Account', onPressed: () {}),
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
    );
  }
}
