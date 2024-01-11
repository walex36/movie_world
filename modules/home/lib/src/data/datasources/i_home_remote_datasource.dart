import 'package:movies/movies.dart';
import 'package:series/series.dart';

abstract class IHomeRemoteDatasource {
  Future<(List<SerieModel>, List<MovieModel>)> getTrending({required int page});
}
