import 'package:equatable/equatable.dart';
import 'package:hostel_sathi/features/register/domain/entity/register_entity.dart';

class RegisterApiModel extends Equatable {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String country;
  final String province;

  const RegisterApiModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.country,
    required this.province,
  });

  factory RegisterApiModel.fromJson(Map<String, dynamic> json) {
    return RegisterApiModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      country: json['country'],
      province: json['province'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'country': country,
      'province': province,
    };
  }

  factory RegisterApiModel.fromEntity(RegisterEntity entity) {
    return RegisterApiModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      password: entity.password,
      phone: entity.phone,
      country: entity.country,
      province: entity.province,
    );
  }

  RegisterEntity toEntity() {
    return RegisterEntity(
      id: id ?? '',
      name: name,
      email: email,
      password: password,
      phone: phone,
      country: country,
      province: province,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    password,
    phone,
    country,
    province,
  ];
}
