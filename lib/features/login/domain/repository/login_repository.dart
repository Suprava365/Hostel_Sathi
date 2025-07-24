import 'package:dartz/dartz.dart';
import 'package:hostel_sathi/core/error/failure.dart';

abstract interface class ILoginRepository {
  Future<Either<Failure, bool>> loginUser({
    required String email,
    required String password,
  });
}
