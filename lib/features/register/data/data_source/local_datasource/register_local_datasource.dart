import 'package:hostel_sathi/core/error/failure.dart';
import 'package:hostel_sathi/core/network/hive_service.dart';
import 'package:hostel_sathi/features/register/data/data_source/resister_datasource.dart';
import 'package:hostel_sathi/features/register/data/model/register_hive_model.dart';
import 'package:hostel_sathi/features/register/domain/entity/register_entity.dart';

class RegisterLocalDataSource implements IRegisterLocalDataSource {
  final HiveService _hiveService;
  //dependency injection
  RegisterLocalDataSource({required HiveService hiveService})
    : _hiveService = hiveService;

  @override
  Future<void> addRegister(RegisterEntity register) async {
    try {
      final registerHiveModel = RegisterHiveModel.fromEntity(register);
      await _hiveService.addRegister(registerHiveModel);
    } catch (e) {
      throw LocalDatabaseFailure(message: e.toString());
    }
  }
}
