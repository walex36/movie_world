import 'package:lib_core/lib_core.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:lib_dependencies/lib_dependencies.dart';

class GetCreditsUsecase extends UseCase<List<Actor>, ParamsGetCredits> {
  final IMoviesRepository repository;

  GetCreditsUsecase({required this.repository});

  @override
  Future<Either<IFailure, List<Actor>>> call(ParamsGetCredits params) {
    return repository.getCredits(idMovie: params.idMovie);
  }
}

class ParamsGetCredits {
  final int idMovie;

  ParamsGetCredits({required this.idMovie});
}
