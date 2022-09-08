import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:movies/src/presentation/controller/list_movies_controller/list_movies_bloc.dart';
import 'package:movies/src/presentation/pages/list_movies_page.dart';

class MoviesModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => ListMoviesBloc(
              getMovieUsecase: i(),
              getMoviesPopularUsecase: i(),
              dioConfig: i(),
            )),
        Bind((i) => GetMovieUsecase(repository: i())),
        Bind((i) => GetMoviesPopularUsecase(repository: i())),
        Bind<IMoviesRepository>((i) => MoviesRepository(
              moviesRemoteDatasource: i(),
            )),
        Bind((i) => MoviesDioDatasource(client: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const ListMoviesPage(),
        ),
      ];
}
