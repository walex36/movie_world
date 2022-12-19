import 'package:bloc/bloc.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_series/lib_series.dart';
import 'package:meta/meta.dart';

part 'home_series_event.dart';
part 'home_series_state.dart';

class HomeSeriesBloc extends Bloc<HomeSeriesEvent, HomeSeriesState> {
  HomeSeriesBloc()
      : super(const HomeSeriesState(
          listTypeSearch: [],
          status: ControlStatus.initial,
        )) {
    on<HomeSeriesInitial>(_onHomeSeriesInit);
  }

  void _onHomeSeriesInit(
      HomeSeriesInitial event, Emitter<HomeSeriesState> emit) {
    emit(state.copyWith(
      status: ControlStatus.success,
      listTypeSearch: [
        TypeSearchSeries.popular,
        TypeSearchSeries.trending,
      ],
    ));
  }
}
