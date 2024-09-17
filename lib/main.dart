import 'package:dio/src/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:trans_go_customer_app/core/network/dio_client.dart';
import 'package:trans_go_customer_app/features/login/data/datasources/login_remote_data_source.dart';
import 'package:trans_go_customer_app/features/login/data/repositories/login_repository_impl.dart';
import 'package:trans_go_customer_app/features/login/domain/usecases/login_usecase.dart';
import 'package:trans_go_customer_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:trans_go_customer_app/features/login/presentation/pages/login_page.dart';
import 'package:trans_go_customer_app/features/splash/presentation/pages/splash_page.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginBloc(
            loginUseCase: LoginUseCase(
              LoginRepositoryImpl(
                remoteDataSource: LoginRemoteDataSourceImpl(
                  GetIt.I<DioClient>().dio,
                ),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
      ),
    );
  }
}
