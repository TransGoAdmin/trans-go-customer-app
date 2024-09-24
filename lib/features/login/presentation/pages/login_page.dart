import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trans_go_customer_app/core/routes/route_path.dart';
import 'package:trans_go_customer_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:trans_go_customer_app/features/login/presentation/bloc/login_event.dart';
import 'package:trans_go_customer_app/features/login/presentation/bloc/login_state.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _mobileNumController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('${state.message} ${state.mobileNumber}')));
            context.pushNamed(Routes.OTP);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.mobileNumber != null) {
              _mobileNumController.text = state.mobileNumber!;
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _mobileNumController,
                    onChanged: (value) {
                      context.read<LoginBloc>().add(LoginEnterEmail(
                            email: _mobileNumController.text,
                          ));
                    },
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      labelText: 'Mobile number',
                      counterText: '',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginButtonPressed(
                            mobileNumber: _mobileNumController.text,
                          ));
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
