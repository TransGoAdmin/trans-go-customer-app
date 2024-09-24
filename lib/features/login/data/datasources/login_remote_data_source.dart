import 'package:dio/dio.dart';
import 'package:trans_go_customer_app/features/login/data/models/user_model.dart';

abstract class LoginRemoteDataSource {
  Future<UserModel> login(String mobileNumber);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Dio dio;

  LoginRemoteDataSourceImpl(this.dio);

  @override
  Future<UserModel> login(String mobileNumber) async {
    final response = await dio.post(
      'https://api.example.com/login',
      data: {
        'email': mobileNumber,
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception('Failed to login');
    }
  }
}
