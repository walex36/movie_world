import 'package:lib_blur_hash/lib_blur_hash.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:movies/src/presentation/controller/home_movies_controller/home_movies_bloc.dart';
import 'package:movies/src/presentation/controller/list_movies_controller/list_movies_bloc.dart';
import 'package:movies/src/presentation/controller/movies_details_controller/movies_details_bloc.dart';
import 'package:movies/src/presentation/pages/home_movies_page.dart';
import 'package:movies/src/presentation/pages/movies_details_page.dart';

class MoviesModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        /// Bloc
        Bind((i) => HomeMoviesBloc()),
        Bind.factory(
          (i) => ListMoviesBloc(
            getMoviesPopularUsecase: i(),
            getMovieTrendingUsecase: i(),
            dioConfig: i(),
          ),
        ),
        Bind.singleton(
          (i) => MoviesDetailsBloc(
            getMovieUsecase: i(),
            getHashImageUsecase: i(),
            getCreditsUsecase: i(),
            getWatchUsecase: i(),
          ),
        ),

        /// UseCase
        Bind((i) => GetMovieUsecase(repository: i())),
        Bind((i) => GetMoviesPopularUsecase(repository: i())),
        Bind((i) => GetMovieTrendingUsecase(repository: i())),
        Bind((i) => GetHashImageUsecase(repository: i())),
        Bind((i) => GetCreditsUsecase(repository: i())),
        Bind((i) => GetWatchUsecase(repository: i())),

        // Repositories
        Bind<IMoviesRepository>((i) => MoviesRepository(
              moviesRemoteDatasource: i(),
            )),
        Bind<IBlurHashRepository>((i) => BlurHashRepository()),

        /// Datasource
        Bind((i) => MoviesDioDatasource(client: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const HomeMoviesPage(),
        ),
        ChildRoute(
          '/moviesDetails',
          child: (_, args) => MoviesDetailsPage(
            movie: args.data['movie'],
            typeSearchMovies: args.data['typeSearchMovies'],
          ),
        )
      ];
}
