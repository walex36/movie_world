import 'package:dartz/dartz.dart';
import 'package:lib_blur_hash/src/domain/repositories/i_blur_hash_repository.dart';
import 'package:lib_core/lib_core.dart';

class GetHashImageUsecase extends UseCase<String, ParamsGetHashImage> {
  final IBlurHashRepository _repository;

  GetHashImageUsecase({
    required IBlurHashRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<IFailure, String>> call(ParamsGetHashImage params) {
    return _repository.getHashImage(urlImage: params.urlImage);
  }
}

class ParamsGetHashImage {
  final String urlImage;

  ParamsGetHashImage({required this.urlImage});
}
