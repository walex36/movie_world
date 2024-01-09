import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:series/src/domain/domain.dart';
import 'package:lib_core/lib_core.dart';

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
