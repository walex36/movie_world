import 'package:home/src/controller/home_bloc.dart';
import 'package:home/src/pages/home_page.dart';
import 'package:lib_blur_hash/lib_blur_hash.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_home/lib_home.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:lib_series/lib_series.dart';
import 'package:movies/movies.dart';
import 'package:series/series.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        /// Bloc
        Bind((i) => HomeBloc(
              getMoviesPopularUsecase: i(),
              getSeriesPopularUsecase: i(),
              getTrendingUsecase: i(),
              getGenresMoviesUsecase: i(),
              getMoviesByGenreUsecase: i(),
              getGenresSeriesUsecase: i(),
              getSeriesByGenreUsecase: i(),
              dioConfig: i(),
            )),

        Bind.singleton(
          (i) => MoviesDetailsBloc(
            getMovieUsecase: i(),
            getHashImageUsecase: i(),
            getCreditsUsecase: i(),
            getWatchUsecase: i(),
          ),
        ),

        Bind.singleton(
          (i) => DetailsSeriesBloc(
            getSeriesUsecase: i(),
            getHashImageUsecase: i(),
            getCreditsSeriesUsecase: i(),
            getWatchSeriesUsecase: i(),
            getEpisodesUsecase: i(),
          ),
        ),

        /// Usecases
        ///  Home
        Bind((i) => GetTrendingUsecase(repository: i())),

        ///  Movies
        Bind((i) => GetMoviesPopularUsecase(repository: i())),
        Bind((i) => GetMovieUsecase(repository: i())),
        Bind((i) => GetMovieTrendingUsecase(repository: i())),
        Bind((i) => GetHashImageUsecase(repository: i())),
        Bind((i) => GetCreditsUsecase(repository: i())),
        Bind((i) => GetWatchUsecase(repository: i())),
        Bind((i) => GetGenresMoviesUsecase(repository: i())),
        Bind((i) => GetMoviesByGenreUsecase(repository: i())),

        ///  Series
        Bind((i) => GetSeriesPopularUsecase(repository: i())),
        Bind((i) => GetSeriesTrendingUsecase(repository: i())),
        Bind((i) => GetSeriesUsecase(repository: i())),
        Bind((i) => GetCreditsSeriesUsecase(repository: i())),
        Bind((i) => GetWatchSeriesUsecase(repository: i())),
        Bind((i) => GetEpisodesUsecase(repository: i())),
        Bind((i) => GetGenresSeriesUsecase(repository: i())),
        Bind((i) => GetSeriesByGenreUsecase(repository: i())),

        /// Repositories
        Bind<IHomeRepository>((i) => HomeRepository(homeRemoteDatasource: i())),
        Bind<IMoviesRepository>(
            (i) => MoviesRepository(moviesRemoteDatasource: i())),
        Bind<ISeriesRepository>((i) => SeriesRepository(remoteDatasource: i())),
        Bind<IBlurHashRepository>((i) => BlurHashRepository()),

        /// Datasource
        Bind<IHomeRemoteDatasource>((i) => HomeDioDatasource(client: i())),
        Bind<IMoviesRemoteDatasource>((i) => MoviesDioDatasource(client: i())),
        Bind<ISeriesRemoteDatasource>((i) => SeriesDioDatasource(client: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          '/moviesDetails',
          child: (context, args) => MoviesDetailsPage(
            movie: args.data['movie'],
            typeSearchMovies: args.data['typeSearchMovies'],
          ),
        ),
        ChildRoute(
          '/seriesDetails',
          child: (context, args) => DetailsSeriePage(
            serie: args.data['serie'],
            typeSearchSerie: args.data['typeSearchSerie'],
          ),
        ),
      ];
}
