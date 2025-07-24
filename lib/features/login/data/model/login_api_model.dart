import 'package:equatable/equatable.dart';
import 'package:hostel_sathi/features/login/domain/entity/login_enitity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_api_model.g.dart';

@JsonSerializable()
class LoginApiModel extends Equatable {
  final String email;
  final String password;

  const LoginApiModel({required this.email, required this.password});

  factory LoginApiModel.fromJson(Map<String, dynamic> json) {
    return LoginApiModel(email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  LoginEntity toEntity() {
    return LoginEntity(email: email, password: password);
  }

  factory LoginApiModel.fromEntity(LoginEntity entity) {
    return LoginApiModel(email: entity.email, password: entity.password);
  }

  @override
  List<Object?> get props => [email, password];
}
