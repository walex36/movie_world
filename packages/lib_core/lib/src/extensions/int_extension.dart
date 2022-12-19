import 'package:lib_dependencies/lib_dependencies.dart';

extension IntExtension on int {
  String moneyFormat() {
    final oCcy = NumberFormat("#,##0.00", "en_US");
    return oCcy.format(this);
  }
}
