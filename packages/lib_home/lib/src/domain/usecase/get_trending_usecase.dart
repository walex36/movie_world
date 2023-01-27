// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_home/src/domain/repositories/i_home_repository.dart';

class GetTrendingUsecase
    implements UseCase<List<Map<String, dynamic>>, ParamsGetTrending> {
  final IHomeRepository _repository;

  GetTrendingUsecase({required IHomeRepository repository})
      : _repository = repository;

  @override
  Future<Either<IFailure, List<Map<String, dynamic>>>> call(
      ParamsGetTrending params) {
    return _repository.getTrending(page: params.page);
  }
}

class ParamsGetTrending {
  final int page;

  ParamsGetTrending({required this.page});
}
