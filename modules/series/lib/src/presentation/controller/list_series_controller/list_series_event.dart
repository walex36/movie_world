part of 'list_series_bloc.dart';

abstract class ListSeriesEvent extends Equatable {}

class InitListMovies extends ListSeriesEvent {
  final TypeSearchSeries typeSearchSeries;

  InitListMovies({required this.typeSearchSeries});

  @override
  List<Object?> get props => [
        typeSearchSeries,
      ];
}
