import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:series/src/domain/domain.dart';

part 'list_series_event.dart';
part 'list_series_state.dart';

class ListSeriesBloc extends Bloc<ListSeriesEvent, ListSeriesState> {
  final GetSeriesPopularUsecase _getSeriesPopularUsecase;
  final GetSeriesTrendingUsecase _getSeriesTrendingUsecase;

  ListSeriesBloc({
    required GetSeriesPopularUsecase getSeriesPopularUsecase,
    required GetSeriesTrendingUsecase getSeriesTrendingUsecase,
  })  : _getSeriesPopularUsecase = getSeriesPopularUsecase,
        _getSeriesTrendingUsecase = getSeriesTrendingUsecase,
        super(const ListSeriesState(
          status: ControlStatus.initial,
          titleList: '',
          listSeries: [],
          typeSearchSeries: TypeSearchSeries.popular,
        )) {
    on<InitListMovies>(_onListSeriesInitial);
  }

  void _onListSeriesInitial(
      InitListMovies event, Emitter<ListSeriesState> emit) async {
    emit(state.copyWith(
      status: ControlStatus.loading,
      typeSearchSeries: event.typeSearchSeries,
    ));

    late Either<IFailure, List<Serie>> failureOrSerieList;

    switch (state.typeSearchSeries) {
      case TypeSearchSeries.popular:
        emit(state.copyWith(titleList: 'Populares'));
        failureOrSerieList =
            await _getSeriesPopularUsecase(ParamsGetSeriesPopular(page: 1));
        break;
      case TypeSearchSeries.trending:
        emit(state.copyWith(titleList: 'Trendings'));
        failureOrSerieList =
            await _getSeriesTrendingUsecase(ParamsGetSeriesTrending(
          page: 1,
          dayAndNotWeek: true,
        ));
        break;
      default:
        failureOrSerieList =
            await _getSeriesPopularUsecase(ParamsGetSeriesPopular(page: 1));
    }

    failureOrSerieList.fold(
      (failure) => emit(state.copyWith(status: ControlStatus.failure)),
      (listSeries) => emit(state.copyWith(
        status: ControlStatus.success,
        listSeries: listSeries,
      )),
    );
  }
}
