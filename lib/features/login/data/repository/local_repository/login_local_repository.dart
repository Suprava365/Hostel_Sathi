import 'package:dartz/dartz.dart';
import 'package:hostel_sathi/core/error/failure.dart';
import 'package:hostel_sathi/features/login/data/data_source/local_datasource/login_local_datasource.dart';
import 'package:hostel_sathi/features/login/domain/entity/login_enitity.dart';
import 'package:hostel_sathi/features/login/domain/repository/login_repository.dart';
import 'package:hostel_sathi/features/login/data/model/login_hive_model.dart';

class LoginLocalRepository implements ILoginRepository {
  final ILoginLocalDataSource loginLocalDataSource;

  LoginLocalRepository({required this.loginLocalDataSource});

  @override
  Future<Either<Failure, bool>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      // Convert to model
      final model = LoginHiveModel(email: email, password: password);

      // Check credentials
      final isValid = await loginLocalDataSource.checkLogin(model);

      // Return result
      return Right(isValid);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkLogin(LoginEntity login) async {
    try {
      final model = LoginHiveModel.fromEntity(login);
      final isValid = await loginLocalDataSource.checkLogin(model);
      return Right(isValid);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }
}
