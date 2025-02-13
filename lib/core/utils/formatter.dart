import 'package:intl/intl.dart';

class Formatters {
  static String fromatPhoneNumber(String phone) {
    return '+${phone.substring(0, 2)} (${phone.substring(2, 4)}) ${phone.substring(4, 9)}-${phone.substring(9)}';
  }

  static String formatDate(String date) {
    final parseDate = DateTime.parse(date);
    return DateFormat('dd/MM/yyyy').format(parseDate);
  }
}
