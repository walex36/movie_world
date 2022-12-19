import 'package:dartz/dartz.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_series/lib_series.dart';
import 'package:lib_series/src/domain/repositories/i_series_repository.dart';

class GetSeriesUsecase implements UseCase<Serie, ParamsGetSeries> {
  final ISeriesRepository _repository;

  GetSeriesUsecase({
    required ISeriesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<IFailure, Serie>> call(ParamsGetSeries params) {
    return _repository.getSerie(idSerie: params.idSerie);
  }
}

class ParamsGetSeries {
  final int idSerie;

  ParamsGetSeries({required this.idSerie});
}
