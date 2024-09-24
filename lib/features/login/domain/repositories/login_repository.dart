
import 'package:dartz/dartz.dart';
import 'package:trans_go_customer_app/core/error/failure.dart';
import 'package:trans_go_customer_app/features/login/domain/entities/user.dart';

abstract class LoginRepository {
  Future<Either<Failure,User>> login(String mobileNumber);
}