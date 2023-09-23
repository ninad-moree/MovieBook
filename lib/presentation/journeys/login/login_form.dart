import 'package:flutter/material.dart';
import 'package:moviebook/presentation/journeys/login/label_field_widget.dart';
import 'package:moviebook/presentation/widgets/button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _userNameController, _passwordController;
  bool enableSignIn = false;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();

    _userNameController.addListener(() {
      setState(() {
        enableSignIn = _userNameController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        enableSignIn = _userNameController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _userNameController.clear();
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                // TranslationConstants.loginToMovieApp.t(context),
                'Login to Movie App via TMDb',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 25,
                    ),
              ),
            ),
            LabelFieldWidget(
              label: 'Username',
              hintText: 'Enter your TMDB username...',
              controller: _userNameController,
            ),
            LabelFieldWidget(
              label: 'Password',
              hintText: 'Enter your password',
              controller: _passwordController,
              isPasswordField: true,
            ),
            Button(
              text: 'Sign In',
              onPressed: enableSignIn ? () {} : null,
              isEnabled: enableSignIn,
            ),
          ],
        ),
      ),
    );
  }
}
