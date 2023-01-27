import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_series/lib_series.dart';

abstract class ISeriesRepository {
  Future<Either<IFailure, Serie>> getSerie({
    required int idSerie,
  });

  Future<Either<IFailure, List<Serie>>> getSeriesPopular({
    required int page,
  });

  Future<Either<IFailure, List<Serie>>> getSeriesTrending({
    required int page,
    required bool dayAndNotWeek,
  });

  Future<Either<IFailure, List<Actor>>> getCredits({
    required int idSerie,
  });

  Future<Either<IFailure, List<WatchCountry>>> getWatchSeries({
    required int idSerie,
  });

  Future<Either<IFailure, Season>> getEpisodes({
    required int idSerie,
    required int seasonNumber,
  });

  Future<Either<IFailure, List<Genre>>> getGenresSeries();

  Future<Either<IFailure, List<Serie>>> getSeriesByGenre({
    required int idGenre,
    required int page,
  });
}
