import 'package:lib_core/lib_core.dart';
import 'package:series/src/data/data.dart';

abstract class ISeriesRemoteDatasource {
  Future<List<SerieModel>> getSeriesPopular({
    required int page,
  });

  Future<SerieModel> getSerieById({required int idSerie});

  Future<List<SerieModel>> getSerieTrending({
    required int page,
    required bool dayAndNotWeek,
  });

  Future<List<ActorModel>> getCredits({required int idSerie});

  Future<List<WatchCountryModel>> getWatchSeries({required int idSerie});

  Future<SeasonModel> getEpisodes({
    required int idSerie,
    required int seasonNumber,
  });

  Future<List<GenreModel>> getGenresSeries();

  Future<List<SerieModel>> getSeriesByGenre({
    required int idGenre,
    required int page,
  });
}
