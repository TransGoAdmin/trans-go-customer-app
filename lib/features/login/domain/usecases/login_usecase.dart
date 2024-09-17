import 'package:dartz/dartz.dart';
import 'package:trans_go_customer_app/core/error/failure.dart';
import 'package:trans_go_customer_app/features/login/domain/entities/user.dart';
import 'package:trans_go_customer_app/features/login/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, User>> execute(String email, String password) async {
    var result = await repository.login(email, password);
    return result.fold((exception) {
      return Left(exception);
    }, (user) {
      return Right(user);
    });
  }
}
