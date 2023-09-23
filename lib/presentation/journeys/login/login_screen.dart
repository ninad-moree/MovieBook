import 'package:flutter/material.dart';
import 'package:moviebook/presentation/journeys/login/login_form.dart';
import 'package:moviebook/presentation/widgets/logo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Logo(height: 50),
              ),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
