import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hostel_sathi/app/use_case/usecase.dart';
import 'package:hostel_sathi/core/error/failure.dart';
import 'package:hostel_sathi/features/register/domain/entity/register_entity.dart';
import 'package:hostel_sathi/features/register/domain/repository/register_repository.dart';

class RegisterUserParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String country;
  final String province;

  const RegisterUserParams({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.country,
    required this.province,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        phone,
        country,
        province,
      ];
}

class RegisterUsecase implements UsecaseWithParams<void, RegisterUserParams> {
  final IRegisterRepository _registerRepository;

  RegisterUsecase({required IRegisterRepository registerRepository})
      : _registerRepository = registerRepository;

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final registerEntity = RegisterEntity(
      id: '', // backend generates it
      name: params.name,
      email: params.email,
      password: params.password,
      phone: params.phone,
      country: params.country,
      province: params.province,
    );

    return _registerRepository.addRegister(registerEntity);
  }
}
