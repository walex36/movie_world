part of 'details_series_bloc.dart';

class DetailsSeriesState extends Equatable {
  final ControlStatus status;
  final Serie serie;
  final List<Actor> credits;
  final String typeSearchSeries;
  final String blurImage;
  final List<WatchCountry> watchCountry;
  final WatchCountry? watchCountrySelect;
  final Season? seasonSelect;
  final List<Episode> episodeSeasonSelect;

  const DetailsSeriesState({
    required this.status,
    required this.serie,
    required this.credits,
    required this.typeSearchSeries,
    required this.blurImage,
    required this.watchCountry,
    required this.watchCountrySelect,
    required this.seasonSelect,
    required this.episodeSeasonSelect,
  });

  @override
  List<Object?> get props => [
        status,
        serie,
        credits,
        typeSearchSeries,
        blurImage,
        watchCountry,
        watchCountrySelect,
        seasonSelect,
        episodeSeasonSelect,
      ];

  DetailsSeriesState copyWith({
    ControlStatus? status,
    Serie? serie,
    List<Actor>? credits,
    String? typeSearchSeries,
    String? blurImage,
    List<WatchCountry>? watchCountry,
    WatchCountry? watchCountrySelect,
    Season? seasonSelect,
    List<Episode>? episodeSeasonSelect,
  }) {
    return DetailsSeriesState(
      status: status ?? this.status,
      serie: serie ?? this.serie,
      credits: credits ?? this.credits,
      typeSearchSeries: typeSearchSeries ?? this.typeSearchSeries,
      blurImage: blurImage ?? this.blurImage,
      watchCountry: watchCountry ?? this.watchCountry,
      watchCountrySelect: watchCountrySelect ?? this.watchCountrySelect,
      seasonSelect: seasonSelect ?? this.seasonSelect,
      episodeSeasonSelect: episodeSeasonSelect ?? this.episodeSeasonSelect,
    );
  }
}
