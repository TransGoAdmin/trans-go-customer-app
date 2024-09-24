
abstract class OtpEvent  {
  
}

class OtpStarted extends OtpEvent {}

class SubmitOtp extends OtpEvent {
  String? otp;
  String? mobileNumber;

  SubmitOtp({this.otp,this.mobileNumber});
}
