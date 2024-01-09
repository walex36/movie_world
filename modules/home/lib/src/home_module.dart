import 'package:home/src/controller/all_midia_bloc/all_midia_bloc.dart';
import 'package:home/src/controller/home_bloc/home_bloc.dart';
import 'package:home/src/pages/all_midia_page.dart';
import 'package:home/src/pages/home_page.dart';
import 'package:lib_blur_hash/lib_blur_hash.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_home/lib_home.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:lib_series/lib_series.dart';
import 'package:movies/movies.dart';
import 'package:series/series.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    /// Bloc
    i.add(HomeBloc.new);
    i.add(MoviesDetailsBloc.new);
    i.add(DetailsSeriesBloc.new);
    i.add(AllMidiaBloc.new);

    /// Usecases
    ///  Home
    i.add(GetTrendingUsecase.new);

    ///  Movies
    i.add(GetMoviesPopularUsecase.new);
    i.add(GetMovieUsecase.new);
    i.add(GetMovieTrendingUsecase.new);
    i.add(GetHashImageUsecase.new);
    i.add(GetCreditsUsecase.new);
    i.add(GetWatchUsecase.new);
    i.add(GetGenresMoviesUsecase.new);
    i.add(GetMoviesByGenreUsecase.new);

    ///  Series
    i.add(GetSeriesPopularUsecase.new);
    i.add(GetSeriesTrendingUsecase.new);
    i.add(GetSeriesUsecase.new);
    i.add(GetCreditsSeriesUsecase.new);
    i.add(GetWatchSeriesUsecase.new);
    i.add(GetEpisodesUsecase.new);
    i.add(GetGenresSeriesUsecase.new);
    i.add(GetSeriesByGenreUsecase.new);

    /// Repositories
    i.add<IHomeRepository>(HomeRepository.new);
    i.add<IMoviesRepository>(MoviesRepository.new);
    i.add<ISeriesRepository>(SeriesRepository.new);
    i.add<IBlurHashRepository>(BlurHashRepository.new);

    /// Datasource
    i.add<IHomeRemoteDatasource>(HomeDioDatasource.new);
    i.add<IMoviesRemoteDatasource>(MoviesDioDatasource.new);
    i.add<ISeriesRemoteDatasource>(SeriesDioDatasource.new);

    /// Dio

    i.addSingleton<Dio>(() => ClientHttp().client);
  }

  @override
  void exportedBinds(Injector i) {
    i.addSingleton<Dio>(() => ClientHttp().client);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (_) => const HomePage());
    r.child(
      '/allMedia',
      child: (_) => AllMediaPage(
        listMedia: r.args.data['listMedia'],
        midiaType: r.args.data['midiaType'],
      ),
    );

    r.child(
      '/moviesDetails',
      child: (_) => MoviesDetailsPage(
        movie: r.args.data['movie'],
        typeSearchMovies: r.args.data['typeSearchMovies'],
      ),
    );
    r.child(
      '/seriesDetails',
      child: (_) => DetailsSeriePage(
        serie: r.args.data['serie'],
        typeSearchSerie: r.args.data['typeSearchSerie'],
      ),
    );
  }
}
