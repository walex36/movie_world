// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_series/lib_series.dart';

class GetWatchSeriesUsecase
    implements UseCase<List<WatchCountry>, ParamsGetWatchSeries> {
  final ISeriesRepository _repository;

  GetWatchSeriesUsecase({
    required ISeriesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<IFailure, List<WatchCountry>>> call(
      ParamsGetWatchSeries params) {
    return _repository.getWatchSeries(idSerie: params.idSerie);
  }
}

class ParamsGetWatchSeries {
  final int idSerie;

  ParamsGetWatchSeries({required this.idSerie});
}
