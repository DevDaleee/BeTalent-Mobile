import 'package:betalent/core/constants/api_constants.dart';
import 'package:betalent/data/models/employers.dart';
import 'package:dio/dio.dart';

class EmployesRepository {
  Future<List<EmployersModel>> fetchEmployees(String platform) async {
    try {
      final response = await Dio(
        BaseOptions(
          baseUrl: platform == 'iOS'
              ? ApiConstants.basePathIos
              : ApiConstants.basePathAndroid,
        ),
      ).get('employees');
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
