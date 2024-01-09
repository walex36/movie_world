import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:series/src/domain/domain.dart';
import 'package:lib_core/lib_core.dart';

class GetEpisodesUsecase implements UseCase<Season, ParamsGetEpisodes> {
  final ISeriesRepository _repository;

  GetEpisodesUsecase({
    required ISeriesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<IFailure, Season>> call(ParamsGetEpisodes params) {
    return _repository.getEpisodes(
      idSerie: params.idSerie,
      seasonNumber: params.seasonNumber,
    );
  }
}

class ParamsGetEpisodes {
  final int idSerie;
  final int seasonNumber;

  ParamsGetEpisodes({required this.idSerie, required this.seasonNumber});
}
