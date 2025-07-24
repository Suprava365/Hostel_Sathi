import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hostel_sathi/app/constant/api_endpoints.dart';
import 'package:hostel_sathi/core/network/api_service.dart';
import 'package:hostel_sathi/features/register/data/model/register_api_model.dart';
import 'package:hostel_sathi/features/register/domain/entity/register_entity.dart';

abstract class IRegisterDataSource {
  Future<void> registerUser(RegisterEntity data);
  Future<String> uploadProfilePicture(File file);
}

class RegisterRemoteDataSource implements IRegisterDataSource {
  final ApiService _apiService;

  RegisterRemoteDataSource({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<void> registerUser(RegisterEntity data) async {
    try {
      final model = RegisterApiModel.fromEntity(data);
      final response = await _apiService.dio.post(
        ApiEndpoints.register,
        data: model.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
      } else {
        throw Exception('Registration failed: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Registration failed: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected registration error: $e');
    }
  }

  @override
  Future<String> uploadProfilePicture(File file) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        'profilePicture': await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });

      final response = await _apiService.dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );

      if (response.statusCode == 200) {
        return response.data['data'];
      } else {
        throw Exception('Image upload failed: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Image upload failed: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected image upload error: $e');
    }
  }
}
