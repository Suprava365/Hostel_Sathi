import 'package:hostel_sathi/features/login/domain/entity/login_enitity.dart';

abstract interface class IBatchDataSource {
  Future<void> addBatch(LoginEntity batch);
  Future<List<LoginEntity>> getBatches();
  Future<void> deleteBatch(String batchId,String? token);
}