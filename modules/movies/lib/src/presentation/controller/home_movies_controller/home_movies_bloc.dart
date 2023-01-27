import 'package:lib_movies/lib_movies.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';

part 'home_movies_event.dart';
part 'home_movies_state.dart';

class HomeMoviesBloc extends Bloc<HomeMoviesEvent, HomeMoviesState> {
  HomeMoviesBloc()
      : super(const HomeMoviesState(
          status: ControlStatus.initial,
          listTypeSearch: [],
        )) {
    on<HomeMoviesInital>(_onHomeMoviesInitial);
  }

  void _onHomeMoviesInitial(
    HomeMoviesInital event,
    Emitter<HomeMoviesState> emit,
  ) {
    emit(state.copyWith(
      status: ControlStatus.success,
      listTypeSearch: [
        TypeSearchMovies.popular,
        TypeSearchMovies.trending,
      ],
    ));
  }
}
