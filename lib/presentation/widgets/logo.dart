import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({
    super.key,
    required this.height,
  }) : assert(height > 0, 'height is >0');

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/png/logo.png',
      color: Colors.white,
      height: height,
    );
  }
}
