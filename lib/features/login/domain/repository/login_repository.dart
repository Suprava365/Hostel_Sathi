import 'package:dartz/dartz.dart';
import 'package:hostel_sathi/core/error/failure.dart';
import 'package:hostel_sathi/features/login/domain/entity/login_entity.dart';

abstract interface class ILoginRepository {
  Future<Either<Failure, bool>> checkLogin(LoginEntity login);
}
