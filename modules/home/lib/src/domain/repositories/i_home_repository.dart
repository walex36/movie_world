import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:movies/movies.dart';
import 'package:series/series.dart';

abstract class IHomeRepository {
  Future<Either<HomeFailure, (List<Serie>, List<Movie>)>> getTrending(
      {required int page});
}
