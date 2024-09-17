abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
  
}

class LoginEnterEmail extends LoginEvent {
  final String email;
  

  LoginEnterEmail({required this.email});
  
}