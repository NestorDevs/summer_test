import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_sumer/app/widgets/logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _Logo());
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 30,
      duration: const Duration(milliseconds: 1000),
      controller: animate,
      child: const SumerLogo(),
    );
  }

  void animate(AnimationController controller) {
    controller.addListener(() async {
      if (controller.isCompleted) {
        controller.repeat(reverse: true);
        await Future.delayed(const Duration(milliseconds: 1000));
        Modular.to.pushNamed('/dashboard/');
      }
    });
  }
}
