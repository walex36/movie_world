// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_series/lib_series.dart';

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
