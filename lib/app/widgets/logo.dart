import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SumerLogo extends StatelessWidget {
  const SumerLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Center(
        child: Image.asset(
          'assets/logo/sumer.png',
        ),
      ),
    );
  }
}
