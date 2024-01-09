import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:series/src/data/data.dart';
import 'package:series/src/domain/domain.dart';

class SeriesRepository implements ISeriesRepository {
  final ISeriesRemoteDatasource _datasource;

  SeriesRepository({
    required ISeriesRemoteDatasource remoteDatasource,
  }) : _datasource = remoteDatasource;

  @override
  Future<Either<IFailure, Serie>> getSerie({required int idSerie}) async {
    try {
      final SerieModel result = await _datasource.getSerieById(
        idSerie: idSerie,
      );

      return Right(result.toEntity());
    } catch (e) {
      return const Left(SerieFailure());
    }
  }

  @override
  Future<Either<IFailure, List<Serie>>> getSeriesPopular(
      {required int page}) async {
    try {
      final List<SerieModel> result = await _datasource.getSeriesPopular(
        page: page,
      );

      return Right(List<Serie>.from(result.map((serie) => serie.toEntity())));
    } catch (e) {
      return const Left(SerieFailure());
    }
  }

  @override
  Future<Either<IFailure, List<Serie>>> getSeriesTrending(
      {required int page, required bool dayAndNotWeek}) async {
    try {
      final List<SerieModel> result = await _datasource.getSerieTrending(
        page: page,
        dayAndNotWeek: dayAndNotWeek,
      );

      return Right(List<Serie>.from(result.map((serie) => serie.toEntity())));
    } catch (e) {
      return const Left(SerieFailure());
    }
  }

  @override
  Future<Either<IFailure, List<Actor>>> getCredits(
      {required int idSerie}) async {
    try {
      final List<ActorModel> result = await _datasource.getCredits(
        idSerie: idSerie,
      );

      return Right(List<Actor>.from(result.map((actor) => actor.toEntity())));
    } catch (e) {
      return const Left(SerieFailure());
    }
  }

  @override
  Future<Either<IFailure, List<WatchCountry>>> getWatchSeries(
      {required int idSerie}) async {
    try {
      final List<WatchCountryModel> result = await _datasource.getWatchSeries(
        idSerie: idSerie,
      );

      return Right(List<WatchCountry>.from(result.map(
        (watch) => watch.toEntity(),
      )));
    } catch (e) {
      return const Left(MovieFailure());
    }
  }

  @override
  Future<Either<IFailure, Season>> getEpisodes(
      {required int idSerie, required int seasonNumber}) async {
    try {
      final SeasonModel result = await _datasource.getEpisodes(
        idSerie: idSerie,
        seasonNumber: seasonNumber,
      );

      return Right(result.toEntity());
    } catch (e) {
      return const Left(SerieFailure());
    }
  }

  @override
  Future<Either<IFailure, List<Genre>>> getGenresSeries() async {
    try {
      final List<GenreModel> result = await _datasource.getGenresSeries();

      return Right(List<Genre>.from(result.map((genre) => genre.toEntity())));
    } catch (e) {
      return const Left(SerieFailure());
    }
  }

  @override
  Future<Either<IFailure, List<Serie>>> getSeriesByGenre({
    required int idGenre,
    required int page,
  }) async {
    try {
      final List<SerieModel> result = await _datasource.getSeriesByGenre(
        idGenre: idGenre,
        page: page,
      );

      return Right(List<Serie>.from(result.map((serie) => serie.toEntity())));
    } catch (e) {
      return const Left(SerieFailure());
    }
  }
}
