part of 'details_series_bloc.dart';

abstract class DetailsSeriesEvent extends Equatable {}

class DetailsSeriesInitial extends DetailsSeriesEvent {
  final Serie serieCache;
  final String typeSearchSeries;

  DetailsSeriesInitial({
    required this.serieCache,
    required this.typeSearchSeries,
  });

  @override
  List<Object?> get props => [
        serieCache,
        typeSearchSeries,
      ];
}

class SelectSeason extends DetailsSeriesEvent {
  final Season season;

  SelectSeason({required this.season});

  @override
  List<Object?> get props => [
        season,
      ];
}
