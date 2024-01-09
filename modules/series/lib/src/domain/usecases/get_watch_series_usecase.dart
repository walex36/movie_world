import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:series/src/domain/domain.dart';
import 'package:lib_core/lib_core.dart';

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
