import 'package:lib_blur_hash/lib_blur_hash.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:movies/src/presentation/controller/list_movies_controller/list_movies_bloc.dart';
import 'package:movies/src/presentation/controller/movies_details_controller/movies_details_bloc.dart';
import 'package:movies/src/presentation/pages/list_movies_page.dart';
import 'package:movies/src/presentation/pages/movies_details_page.dart';

class MoviesModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        /// Bloc
        Bind(
          (i) => ListMoviesBloc(
            getMoviesPopularUsecase: i(),
            dioConfig: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) =>
              MoviesDetailsBloc(getMovieUsecase: i(), getHashImageUsecase: i()),
        ),

        /// UseCase
        Bind((i) => GetMovieUsecase(repository: i())),
        Bind((i) => GetMoviesPopularUsecase(repository: i())),
        Bind((i) => GetHashImageUsecase(repository: i())),

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
          child: (_, args) => const ListMoviesPage(),
        ),
        ChildRoute(
          '/moviesDetails',
          child: (_, args) => MoviesDetailsPage(
            movie: args.data['movie'],
          ),
        )
      ];
}
