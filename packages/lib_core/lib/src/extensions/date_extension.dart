import 'package:lib_dependencies/lib_dependencies.dart';

extension DateExtension on DateTime {
  String dateAndHour() {
    final format = DateFormat('dd/MM/yyyy HH:mm');
    return format.format(this);
  }

  String hourMinutes() {
    final format = DateFormat('HH:mm');
    return format.format(this);
  }

  String dayMonthYear() {
    final format = DateFormat('dd/MM/yyyy');
    return format.format(this);
  }

  bool isNovelty() {
    return isAfter(DateTime.now().subtract(const Duration(days: 30))) &&
        isBefore(DateTime.now());
  }

  bool isSoon() {
    return isAfter(DateTime.now());
  }
}
