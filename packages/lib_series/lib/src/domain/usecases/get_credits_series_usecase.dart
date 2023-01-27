// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_series/lib_series.dart';

class GetCreditsSeriesUsecase
    implements UseCase<List<Actor>, ParamsGetCreditsSerie> {
  final ISeriesRepository _repository;

  GetCreditsSeriesUsecase({
    required ISeriesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<IFailure, List<Actor>>> call(ParamsGetCreditsSerie params) {
    return _repository.getCredits(idSerie: params.idSerie);
  }
}

class ParamsGetCreditsSerie {
  final int idSerie;

  ParamsGetCreditsSerie({required this.idSerie});
}
