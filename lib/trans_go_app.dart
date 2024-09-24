import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:trans_go_customer_app/core/config/env.dart';
import 'package:trans_go_customer_app/core/network/dio_client.dart';
import 'package:trans_go_customer_app/core/routes/router.dart';
import 'package:trans_go_customer_app/features/login/data/datasources/login_remote_data_source.dart';
import 'package:trans_go_customer_app/features/login/data/repositories/login_repository_impl.dart';
import 'package:trans_go_customer_app/features/login/domain/usecases/login_usecase.dart';
import 'package:trans_go_customer_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:trans_go_customer_app/features/otp/presentation/bloc/otp_bloc.dart';
import 'package:trans_go_customer_app/features/splash/presentation/bloc/splash_bloc.dart';

class TransGoApp extends StatefulWidget {
  final EnvVars? env;

  const TransGoApp({super.key, this.env});

  @override
  TransGoState createState() => TransGoState();
}

class TransGoState extends State<TransGoApp> {
  @override
  void initState() {
    Env().loadVars(widget.env!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SplashBloc(),
        ),
        BlocProvider(
          create: (_) => OtpBloc(),
        ),
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
        debugShowCheckedModeBanner: false,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
