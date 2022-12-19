import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_series/lib_series.dart';

class SeriesDioDatasource implements ISeriesRemoteDatasource {
  final Dio _client;

  SeriesDioDatasource({
    required Dio client,
  }) : _client = client;

  @override
  Future<SerieModel> getSerieById({required int idSerie}) async {
    try {
      final response = await _client.get(
        TmdbConst.serieById(idMovie: idSerie),
      );

      if (response.statusCode == 200) {
        return SerieModel.fromMap(response.data);
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<SerieModel>> getSeriesPopular({required int page}) async {
    try {
      final response = await _client.get(
        TmdbConst.seriePopular(page: page),
      );

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> responseBody =
            List<Map<String, dynamic>>.from(response.data['results']);

        return List<SerieModel>.from(responseBody.map(SerieModel.fromMap));
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<SerieModel>> getSerieTrending(
      {required int page, required bool dayAndNotWeek}) async {
    try {
      final response = await _client.get(
        TmdbConst.serieTrending(
          page: page,
          time: dayAndNotWeek ? 'day' : 'week',
        ),
      );

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> responseBody =
            List<Map<String, dynamic>>.from(response.data['results']);

        return List<SerieModel>.from(responseBody.map(SerieModel.fromMap));
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<ActorModel>> getCredits({required int idSerie}) async {
    try {
      final response = await _client.get(
        TmdbConst.creditsTvById(idSerie: idSerie),
      );

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> map = [];

        map.addAll(List<Map<String, dynamic>>.from(response.data['cast']));
        map.addAll(List<Map<String, dynamic>>.from(response.data['crew']));

        return List<ActorModel>.from(map.map(ActorModel.fromMap));
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<WatchCountryModel>> getWatchSeries({required int idSerie}) async {
    try {
      final response = await _client.get(
        TmdbConst.watchSerie(idSerie: idSerie),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody =
            Map<String, dynamic>.from(response.data['results']);

        List<WatchCountryModel> listWatch = [];

        responseBody.forEach((key, value) {
          listWatch.add(WatchCountryModel.fromMap(key, value));
        });

        return listWatch;
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<SeasonModel> getEpisodes(
      {required int idSerie, required int seasonNumber}) async {
    try {
      final response = await _client.get(TmdbConst.episodes(
        idSerie: idSerie,
        seasonNumber: seasonNumber,
      ));

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody =
            Map<String, dynamic>.from(response.data);

        return SeasonModel.fromMap(responseBody);
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }
}
