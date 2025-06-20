import 'package:dartz/dartz.dart';
import 'package:hostel_sathi/core/error/failure.dart';
import 'package:hostel_sathi/features/register/domain/entity/register_entity.dart';

abstract interface class IRegisterRepository {
  Future<Either<Failure, void>> addRegister(RegisterEntity register);
}
