import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hostel_sathi/app/use_case/usecase.dart';
import 'package:hostel_sathi/core/error/failure.dart';
import 'package:hostel_sathi/features/login/domain/repository/login_repository.dart';

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  const LoginParams.initial() : email = '', password = '';

  @override
  List<Object?> get props => [email, password];
}

class LoginUsecase implements UsecaseWithParams<bool, LoginParams> {
  final ILoginRepository _loginRepository;

  LoginUsecase({required ILoginRepository loginRepository})
      : _loginRepository = loginRepository;

  @override
  Future<Either<Failure, bool>> call(LoginParams params) {
    return _loginRepository.loginUser(
      email: params.email,
      password: params.password,
    );
  }
}
