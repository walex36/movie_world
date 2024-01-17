import 'package:home/src/data/data.dart';
import 'package:home/src/domain/domain.dart';
import 'package:home/src/presentation/controller/all_midia_bloc/all_midia_bloc.dart';
import 'package:home/src/presentation/controller/home_bloc/home_bloc.dart';
import 'package:home/src/presentation/pages/all_midia_page.dart';
import 'package:home/src/presentation/pages/home_page.dart';
import 'package:lib_blur_hash/lib_blur_hash.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:movies/movies.dart';
import 'package:series/series.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    /// Bloc
    i.addSingleton(HomeBloc.new);
    i.addSingleton(MoviesDetailsBloc.new);
    i.addSingleton(DetailsSeriesBloc.new);
    i.addSingleton(AllMidiaBloc.new);

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
        titlePage: r.args.data['titlePage'],
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
