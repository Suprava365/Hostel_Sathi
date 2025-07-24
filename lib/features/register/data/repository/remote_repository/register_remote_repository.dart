import 'package:dartz/dartz.dart';
import 'package:hostel_sathi/core/error/failure.dart';
import 'package:hostel_sathi/features/register/data/data_source/remote_datasource/resister_remote_datasource.dart';
import 'package:hostel_sathi/features/register/domain/entity/register_entity.dart';
import 'package:hostel_sathi/features/register/domain/repository/register_repository.dart';

class RegisterRemoteRepository implements IRegisterRepository {
  final IRegisterDataSource remoteDataSource;

  RegisterRemoteRepository({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> addRegister(RegisterEntity register) async {
    try {
      await remoteDataSource.registerUser(register);
      return const Right(null);
    } catch (e) {
     return Left(GenericFailure(message: e.toString())); // ✅ Concrete class

    }
  }
}
