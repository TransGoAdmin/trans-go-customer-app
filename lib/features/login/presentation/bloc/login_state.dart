import 'package:equatable/equatable.dart';

abstract class LoginState {
  String? mobileNumber;
  LoginState({this.mobileNumber});
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;
  String? mobileNumber;
  LoginSuccess(this.message, this.mobileNumber);
}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
}
