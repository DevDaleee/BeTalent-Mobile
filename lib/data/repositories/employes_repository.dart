import 'package:betalent/core/constants/api_constants.dart';
import 'package:betalent/data/models/employers.dart';
import 'package:dio/dio.dart';

class EmployesRepository {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.basePath,
    ),
  );

  Future<List<EmployersModel>> fetchEmployees() async {
    try {
      final response = await dio.get('employees');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => EmployersModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to fetch employees list: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
            'Request failed: ${e.response?.statusCode} - ${e.response?.statusMessage}');
      } else {
        throw Exception('Connection error: ${e.message}');
      }
    }
  }
}
