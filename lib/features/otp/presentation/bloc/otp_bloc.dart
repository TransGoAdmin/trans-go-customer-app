import 'package:flutter_bloc/flutter_bloc.dart';
import 'otp_event.dart';
import 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
    on<SubmitOtp>((event, emit) {
      print(event.mobileNumber);
      print(event.otp);
      emit(OtpSuccess(user: 'Manikanta'));
    });
  }
}
