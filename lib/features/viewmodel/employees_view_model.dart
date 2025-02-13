import 'dart:io';

import 'package:betalent/data/models/employers.dart';
import 'package:betalent/data/repositories/employes_repository.dart';

class EmployeesViewModel {
  final EmployesRepository repository = EmployesRepository();
  List<EmployersModel> employees = [];

  String getPlatform() {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    }
    return '';
  }

  Future<void> loadUsers() async {
    employees = await repository.fetchEmployees(getPlatform());
  }
}
