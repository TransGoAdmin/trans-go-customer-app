

abstract class OtpState {
  
}

class OtpInitial extends OtpState {
  
}

class OtpSuccess extends OtpState {
  String? user;

  OtpSuccess({this.user});
}
