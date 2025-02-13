import 'package:betalent/core/utils/formatter.dart';

class EmployersModel {
  String? id;
  String? name;
  String? role;
  String? addmissionDate;
  String? phone;
  String? profileImageUrl;

  EmployersModel({
    this.id,
    this.name,
    this.role,
    this.addmissionDate,
    this.phone,
    this.profileImageUrl,
  });

  factory EmployersModel.fromJson(Map<String, dynamic> json) {
    return EmployersModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      role: json['job'] as String?,
      addmissionDate: Formatters.formatDate(json['admission_date']),
      phone: json['phone'] as String?,
      profileImageUrl: json['image'] as String?,
    );
  }
}
