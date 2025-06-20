import 'package:dartz/dartz.dart';
import 'package:hostel_sathi/core/error/failure.dart';
import 'package:hostel_sathi/features/login/domain/entity/login_enitity.dart';
import 'package:hostel_sathi/features/login/domain/repository/login_repository.dart';
import 'package:hostel_sathi/app/use_case/usecase.dart';

class CheckLoginParams {
  final String email;
  final String password;

  CheckLoginParams({required this.email, required this.password});
}

class CheckLoginUsecase implements UsecaseWithParams<bool, CheckLoginParams> {
  final ILoginRepository loginRepository;

  CheckLoginUsecase({required this.loginRepository});

  @override
  Future<Either<Failure, bool>> call(CheckLoginParams params) async {
    final login = LoginEntity(
      id: '',
      email: params.email,
      password: params.password,
    );
    return await loginRepository.checkLogin(login);
  }
}
