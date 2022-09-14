import 'package:dartz/dartz.dart';
import 'package:lib_core/lib_core.dart';

abstract class IBlurHashRepository {
  Future<Either<IFailure, String>> getHashImage({required String urlImage});
}
