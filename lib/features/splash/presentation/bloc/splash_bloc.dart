import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trans_go_customer_app/core/secure_storage/secure_storage.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    print('initial state');

    Future.delayed(const Duration(milliseconds: 3000), () async {
      var token = await SecureStorage().readData(key: 'TOKEN');
      if (token != null && token.toString().isNotEmpty) {
        emit(SplashCheckSession(const ['Mani', 'Kanta'], false));
      } else {
        emit(SplashCheckSession(const ['Nani', 'Manu'], true));
      }
    });
  }
}
