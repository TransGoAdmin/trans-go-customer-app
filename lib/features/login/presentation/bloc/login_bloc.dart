import 'package:bloc/bloc.dart';
import 'package:trans_go_customer_app/features/login/domain/usecases/login_usecase.dart';
import 'package:trans_go_customer_app/features/login/presentation/bloc/login_event.dart';
import 'package:trans_go_customer_app/features/login/presentation/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      if (event.email.isEmpty) {
        emit(LoginFailure('Email should not be empty'));
      } else if (event.password.isEmpty) {
        emit(LoginFailure('Password should not be empty'));
      } else {
        emit(LoginLoading());
        var result = await loginUseCase.execute(event.email, event.password);

        result.fold(
          (failure) => emit(LoginFailure('Login Failed')),
          (user) => emit(LoginSuccess('Welcome, ${user.name}')),
        );
      }
    });

    on<LoginEnterEmail>((event, emit) async {
      print(event.email);
    });
  }
}
