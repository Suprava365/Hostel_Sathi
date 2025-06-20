import 'package:get_it/get_it.dart';
import 'package:hostel_sathi/core/network/hive_service.dart';
import 'package:hostel_sathi/features/login/data/repository/local_repository/register_local_repository.dart';
import 'package:hostel_sathi/features/register/data/data_source/local_datasource/register_local_datasource.dart';
import 'package:hostel_sathi/features/register/data/repository/local_repository/register_local_repository.dart';
import 'package:hostel_sathi/features/register/domain/use_case/add_register_usecase.dart';
import 'package:hostel_sathi/features/register/presentation/view_model/register_view_model.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();
  await _initRegisterModule();
}

Future<void> _initHiveService() async {
  serviceLocator.registerLazySingleton(() => HiveService());
}

// register module

Future<void> _initRegisterModule() async {
  serviceLocator.registerFactory(
    () => RegisterLocalDataSource(hiveService: serviceLocator<HiveService>()),
  );

  // Register the repository
  serviceLocator.registerFactory(
    () => RegisterLocalRepository(
      registerLocalDataSource: serviceLocator<RegisterLocalDataSource>(),
    ),
  );

  //usecases
  serviceLocator.registerFactory(
    () => AddRegisterUsecase(
      registerRepository: serviceLocator<RegisterLocalRepository>(),
    ),
  );

  //viw model

  serviceLocator.registerLazySingleton(
    () => RegisterViewModel(
      addRegisterUsecase: serviceLocator<AddRegisterUsecase>(),
    ),
  );

  // serviceLocator.registerLazySingleton(
  //   () => BatchViewModel(
  //     getAllBatchUsecase: serviceLocator<GetAllBatchUsecase>(),
  //     createBatchUsecase: serviceLocator<CreateBatchUsecase>(),
  //     deleteBatchUsecase: serviceLocator<DeleteBatchUsecase>(),
  //   ),
  // );
}
