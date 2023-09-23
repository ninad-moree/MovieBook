import 'package:flutter/material.dart';

import '../../common/extensions/string_extension.dart';
import '../themes/app_color.dart';

class Button extends StatelessWidget {
  final String text;
  final Function()? onPressed; // ? added for login_form onPressed() {}
  final bool isEnabled;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isEnabled
              ? [AppColor.royalBlue, AppColor.violet]
              : [Colors.grey, Colors.grey],
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 40,
      child: TextButton(
        onPressed: isEnabled ? onPressed : null,
        child: Text(text.t(context),
            style: Theme.of(context).textTheme.labelLarge),
      ),
    );
  }
}
