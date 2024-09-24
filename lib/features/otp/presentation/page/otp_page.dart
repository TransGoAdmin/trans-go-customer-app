import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:trans_go_customer_app/core/routes/route_path.dart';

import 'package:trans_go_customer_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:trans_go_customer_app/features/otp/presentation/bloc/otp_bloc.dart';
import 'package:trans_go_customer_app/features/otp/presentation/bloc/otp_event.dart';
import 'package:trans_go_customer_app/features/otp/presentation/bloc/otp_state.dart';

class OtpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<OtpBloc, OtpState>(
      listener: (context, state) {
        if (state is OtpSuccess) {
          context.goNamed(Routes.DASHBOARD);
        }
      },
      child: BlocBuilder<OtpBloc, OtpState>(
        builder: (context, state) => Container(
          margin: EdgeInsets.only(top: 200.0),
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Pinput(
              // Without Validator
              // If true error state will be applied no matter what validator returns
              forceErrorState: true,
              // Text will be displayed under the Pinput
              // errorText: 'Error',

              /// ------------
              /// With Validator
              /// Auto validate after user tap on keyboard done button, or completes Pinput
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              onCompleted: (value) {
                context.read<OtpBloc>().add(SubmitOtp(
                    mobileNumber: context.read<LoginBloc>().state.mobileNumber,
                    otp: value));
              },
              validator: (pin) {
                if (pin == '2224') return null;

                /// Text will be displayed under the Pinput
                return 'Pin is incorrect';
              },
            ),
          ),
        ),
      ),
    ));
  }
}
