import 'package:home/src/data/data.dart';
import 'package:home/src/domain/domain.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:movies/movies.dart';
import 'package:series/series.dart';

class HomeRepository implements IHomeRepository {
  final IHomeRemoteDatasource _homeRemoteDatasource;

  HomeRepository({required IHomeRemoteDatasource homeRemoteDatasource})
      : _homeRemoteDatasource = homeRemoteDatasource;

  @override
  Future<Either<HomeFailure, (List<Serie>, List<Movie>)>> getTrending(
      {required int page}) async {
    try {
      final (List<SerieModel> series, List<MovieModel> movies) result =
          await _homeRemoteDatasource.getTrending(page: page);

      List<Serie> serieList = result.$1.map((e) => e.toEntity()).toList();
      List<Movie> movieList = result.$2.map((e) => e.toEntity()).toList();

      return Right((serieList, movieList));
    } catch (e) {
      return const Left(HomeFailure());
    }
  }
}
