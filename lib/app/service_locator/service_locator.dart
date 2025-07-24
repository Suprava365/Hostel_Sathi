import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hostel_sathi/core/network/api_service.dart';
import 'package:hostel_sathi/core/network/hive_service.dart';
import 'package:hostel_sathi/features/login/data/data_source/local_datasource/login_local_datasource.dart';
import 'package:hostel_sathi/features/login/data/repository/local_repository/login_local_repository.dart';
import 'package:hostel_sathi/features/login/domain/use_case/check_login_usecase.dart';
import 'package:hostel_sathi/features/login/presentation/view_model/login_view_model.dart';
import 'package:hostel_sathi/features/register/data/data_source/local_datasource/register_local_datasource.dart';
import 'package:hostel_sathi/features/register/data/data_source/remote_datasource/resister_remote_datasource.dart';
import 'package:hostel_sathi/features/register/data/repository/local_repository/register_local_repository.dart';
import 'package:hostel_sathi/features/register/data/repository/remote_repository/register_remote_repository.dart';
import 'package:hostel_sathi/features/register/domain/repository/register_repository.dart';
import 'package:hostel_sathi/features/register/domain/use_case/add_register_usecase.dart';
import 'package:hostel_sathi/features/register/presentation/view_model/register_view_model.dart';

final serviceLocator = GetIt.instance;


Future<void> initDependencies() async {
  await _initHiveService();

  // ✅ Step 1: Register Dio
  serviceLocator.registerLazySingleton<Dio>(() => Dio());

  // ✅ Step 2: Register ApiService with Dio
  serviceLocator.registerLazySingleton<ApiService>(
    () => ApiService(serviceLocator<Dio>()),
  );

  await _initRegisterModule();
  await _initLoginModule();
}

Future<void> _initHiveService() async {
  // ✅ Register HiveService here
  serviceLocator.registerLazySingleton<HiveService>(() => HiveService());
}


// register module
Future<void> _initRegisterModule() async {
  serviceLocator.registerFactory(
    () => RegisterLocalDataSource(hiveService: serviceLocator<HiveService>()),
  );

  serviceLocator.registerFactory(
    () => RegisterRemoteDataSource(apiService: serviceLocator<ApiService>()),
  );

  // Switch between Local or Remote Repository here
  serviceLocator.registerFactory<IRegisterRepository>(
    () => RegisterRemoteRepository(
      remoteDataSource: serviceLocator<RegisterRemoteDataSource>(),
    ),
  );

  serviceLocator.registerFactory(
    () => AddRegisterUsecase(registerRepository: serviceLocator<IRegisterRepository>()),
  );

  serviceLocator.registerLazySingleton(
    () => RegisterViewModel(addRegisterUsecase: serviceLocator<AddRegisterUsecase>()),
  );
}

Future<void> _initLoginModule() async {
  serviceLocator.registerFactory(
    () => LoginLocalDataSource(hiveService: serviceLocator<HiveService>()),
  );

  serviceLocator.registerFactory(
    () => LoginLocalRepository(
      loginLocalDataSource: serviceLocator<LoginLocalDataSource>(),
    ),
  );

  serviceLocator.registerFactory(
    () => CheckLoginUsecase(
      loginRepository: serviceLocator<LoginLocalRepository>(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () =>
        LoginViewModel(checkLoginUsecase: serviceLocator<CheckLoginUsecase>()),
  );
}
