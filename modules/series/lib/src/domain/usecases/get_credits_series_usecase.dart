import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:series/src/domain/domain.dart';
import 'package:lib_core/lib_core.dart';

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
