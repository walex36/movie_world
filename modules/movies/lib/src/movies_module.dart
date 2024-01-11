import 'package:home/home.dart';
import 'package:lib_blur_hash/lib_blur_hash.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:movies/src/domain/domain.dart';
import 'package:movies/src/presentation/controller/home_movies_controller/home_movies_bloc.dart';
import 'package:movies/src/presentation/controller/list_movies_controller/list_movies_bloc.dart';
import 'package:movies/src/presentation/controller/movies_details_controller/movies_details_bloc.dart';
import 'package:movies/src/presentation/pages/home_movies_page.dart';
import 'package:movies/src/presentation/pages/movies_details_page.dart';

class MoviesModule extends Module {
  @override
  void binds(Injector i) {
    /// Bloc
    i.add(HomeMoviesBloc.new);
    i.add(ListMoviesBloc.new);
    i.add(MoviesDetailsBloc.new);

    /// UseCase
    i.add(GetMoviesPopularUsecase.new);
    i.add(GetMovieTrendingUsecase.new);
    i.add(GetMovieUsecase.new);
    i.add(GetHashImageUsecase.new);
    i.add(GetCreditsUsecase.new);
    i.add(GetWatchUsecase.new);
    // Repositories
    /// Datasource
  }

  @override
  List<Module> get imports => [
        HomeModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const HomeMoviesPage(),
    );

    r.child(
      '/moviesDetails',
      child: (_) => MoviesDetailsPage(
        movie: r.args.data['movie'],
        typeSearchMovies: r.args.data['typeSearchMovies'],
      ),
    );
  }
}
