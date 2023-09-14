import 'package:flutter/material.dart';
import 'package:moviebook/common/extensions/string_extension.dart';
import 'package:moviebook/presentation/themes/app_color.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.royalBlue,
            AppColor.violet,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 35,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text.t(context),
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
