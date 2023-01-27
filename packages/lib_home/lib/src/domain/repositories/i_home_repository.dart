import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';

abstract class IHomeRepository {
  Future<Either<HomeFailure, List<Map<String, dynamic>>>> getTrending(
      {required int page});
}
