import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/route_constants.dart';
import '../../../common/constants/translation_constants.dart';
import '../../../common/extensions/string_extension.dart';
import '../../blocs/login/login_bloc.dart';
import '../../themes/text_theme.dart';
import '../../widgets/button.dart';
import 'label_field_widget.dart';

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
    _userNameController.dispose();
    _passwordController.dispose();
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
                TranslationConstants.loginToMovieApp.t(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 25,
                    ),
              ),
            ),
            LabelFieldWidget(
              label: TranslationConstants.username.t(context),
              hintText: TranslationConstants.enterTMDbUsername.t(context),
              controller: _userNameController,
            ),
            LabelFieldWidget(
              // label: 'Password',
              label: TranslationConstants.password.t(context),
              hintText: TranslationConstants.enterPassword.t(context),
              controller: _passwordController,
              isPasswordField: true,
            ),
            BlocConsumer<LoginBloc, LoginState>(
              buildWhen: (previous, current) => current is LoginError,
              builder: (context, state) {
                if (state is LoginError) {
                  return Text(
                    state.message.t(context),
                    style: Theme.of(context).textTheme.orangeSubtitle1,
                  );
                }
                return const SizedBox.shrink();
              },
              listenWhen: (previous, current) => current is LoginSuccess,
              listener: (context, state) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteList.home,
                  (route) => false,
                );
              },
            ),
            Button(
              text: TranslationConstants.signIn.t(context),
              onPressed: enableSignIn
                  ? () {
                      // print('button pressed');
                      BlocProvider.of<LoginBloc>(context).add(
                        LoginInitiateEvent(
                          _passwordController.text,
                          _userNameController.text,
                        ),
                      );
                    }
                  : null,
              isEnabled: enableSignIn,
            ),
            Button(
              text: TranslationConstants.guestSignIn.t(context),
              onPressed: () {
                BlocProvider.of<LoginBloc>(context).add(LoginGuestEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
