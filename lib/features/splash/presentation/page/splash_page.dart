import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trans_go_customer_app/core/routes/route_path.dart';
import 'package:trans_go_customer_app/core/routes/router.dart';
import 'package:trans_go_customer_app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:trans_go_customer_app/features/splash/presentation/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Splash Page'),
        ),
        body: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is SplashCheckSession) {
              if (state.isSessionExpired) {
                context.goNamed(Routes.LOGIN);
              }
            }
          },
          child: BlocBuilder<SplashBloc, SplashState>(
            builder: (context, state) {
              return Center(
                child: Text('Welcome to Splash Page'),
              );
            },
          ),
        ));
  }
}
