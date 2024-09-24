import 'package:bloc/bloc.dart';
import 'package:trans_go_customer_app/features/login/domain/usecases/login_usecase.dart';
import 'package:trans_go_customer_app/features/login/presentation/bloc/login_event.dart';
import 'package:trans_go_customer_app/features/login/presentation/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      if (event.mobileNumber.isEmpty) {
        emit(LoginFailure('Mobile Number should not be empty'));
      } else if (event.mobileNumber.length < 10) {
        emit(LoginFailure('Enter valid mobile number'));
      } else {
        emit(LoginSuccess('OTP sent to', event.mobileNumber));
      }
    });

    on<LoginEnterEmail>((event, emit) async {
      print(event.email);
    });
  }
}
