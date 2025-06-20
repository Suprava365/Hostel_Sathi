import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:hostel_sathi/features/login/domain/entity/login_enitity.dart';
import 'package:uuid/uuid.dart';
import 'package:hostel_sathi/app/constant/hive/hive_table_constant.dart';

part 'login_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.loginTableId)
class LoginHiveModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String password;

  LoginHiveModel({String? id, required this.email, required this.password})
    : id = id ?? const Uuid().v4();

  factory LoginHiveModel.fromEntity(LoginEntity entity) {
    return LoginHiveModel(
      id: entity.id,
      email: entity.email,
      password: entity.password,
    );
  }

  @override
  List<Object?> get props => [id, email, password];
}
