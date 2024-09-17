import 'package:dartz/dartz.dart';
import 'package:trans_go_customer_app/core/error/failure.dart';
import 'package:trans_go_customer_app/features/login/data/datasources/login_remote_data_source.dart';
import 'package:trans_go_customer_app/features/login/domain/entities/user.dart';
import 'package:trans_go_customer_app/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final user = await remoteDataSource.login(email, password);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure('Login failed'));
    }
  }
}
