abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String mobileNumber;
  

  LoginButtonPressed({required this.mobileNumber});
  
}

class LoginEnterEmail extends LoginEvent {
  final String email;
  

  LoginEnterEmail({required this.email});
  
}