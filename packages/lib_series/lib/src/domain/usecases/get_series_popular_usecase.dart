// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_series/lib_series.dart';

class GetSeriesPopularUsecase
    implements UseCase<List<Serie>, ParamsGetSeriesPopular> {
  final ISeriesRepository _repository;

  GetSeriesPopularUsecase({
    required ISeriesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<IFailure, List<Serie>>> call(ParamsGetSeriesPopular params) {
    return _repository.getSeriesPopular(page: params.page);
  }
}

class ParamsGetSeriesPopular {
  final int page;

  ParamsGetSeriesPopular({required this.page});
}
