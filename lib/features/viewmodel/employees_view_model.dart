import 'package:betalent/data/models/employers.dart';
import 'package:betalent/data/repositories/employes_repository.dart';

class EmployeesViewModel {
  final EmployesRepository repository = EmployesRepository();
  List<EmployersModel> employees = [];
  Future<void> loadUsers() async {
    employees = await repository.fetchEmployees();
  }
}
