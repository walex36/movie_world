import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:movies/src/domain/domain.dart';

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
