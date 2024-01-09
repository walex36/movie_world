import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';

class GetMoviesPopularUsecase
    implements UseCase<List<Movie>, ParamsGetMoviesPopular> {
  final IMoviesRepository _repository;

  GetMoviesPopularUsecase({
    required IMoviesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<IFailure, List<Movie>>> call(ParamsGetMoviesPopular params) {
    return _repository.getMoviesPopular(page: params.page);
  }
}

class ParamsGetMoviesPopular {
  final int page;

  ParamsGetMoviesPopular({required this.page});
}
