import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: InkWell(
              onTap: () {
                context.pushNamed('login');
              },
              child: Text('SPLASH')),
        ),
      ),
    );
  }
}
