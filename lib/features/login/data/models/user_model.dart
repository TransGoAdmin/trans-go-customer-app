
import 'package:trans_go_customer_app/features/login/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.id, required super.name, required super.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'token': token,
    };
  }
}