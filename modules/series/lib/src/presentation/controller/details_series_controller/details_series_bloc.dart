import 'package:lib_blur_hash/lib_blur_hash.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_series/lib_series.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'details_series_event.dart';
part 'details_series_state.dart';

class DetailsSeriesBloc extends Bloc<DetailsSeriesEvent, DetailsSeriesState> {
  final GetSeriesUsecase _getSeriesUsecase;
  final GetHashImageUsecase _getHashImageUsecase;
  final GetCreditsSeriesUsecase _getCreditsSeriesUsecase;
  final GetWatchSeriesUsecase _getWatchSeriesUsecase;
  final GetEpisodesUsecase _getEpisodesUsecase;

  DetailsSeriesBloc({
    required GetSeriesUsecase getSeriesUsecase,
    required GetHashImageUsecase getHashImageUsecase,
    required GetCreditsSeriesUsecase getCreditsSeriesUsecase,
    required GetWatchSeriesUsecase getWatchSeriesUsecase,
    required GetEpisodesUsecase getEpisodesUsecase,
  })  : _getCreditsSeriesUsecase = getCreditsSeriesUsecase,
        _getSeriesUsecase = getSeriesUsecase,
        _getHashImageUsecase = getHashImageUsecase,
        _getWatchSeriesUsecase = getWatchSeriesUsecase,
        _getEpisodesUsecase = getEpisodesUsecase,
        super(DetailsSeriesState(
          status: ControlStatus.initial,
          blurImage: 'L02Fc7j[fQj[j[fQfQfQfQfQfQfQ',
          typeSearchSeries: TypeSearchSeries.popular.toShortString(),
          credits: const [],
          serie: Serie(
            backdropPath: '',
            createdBy: const [],
            episodeRunTime: const [],
            firstAirDate: DateTime(0),
            genres: const [],
            homepage: '',
            id: 0,
            inProduction: false,
            languages: const [],
            lastAirDate: DateTime(0),
            lastEpisodeToAir: Episode(
              airDate: DateTime(0),
              episodeNumber: 0,
              id: 0,
              name: '',
              overview: '',
              productionCode: '',
              seasonNumber: 0,
              stillPath: '',
              voteAverage: 0,
              voteCount: 0,
            ),
            name: '',
            nextEpisodeToAir: null,
            networks: const [],
            numberOfEpisodes: 0,
            numberOfSeasons: 0,
            originCountry: const [],
            originalLanguage: '',
            originalName: '',
            overview: '',
            popularity: 0,
            posterPath: '',
            productionCompanies: const [],
            productionCountries: const [],
            seasons: const [],
            spokenLanguages: const [],
            status: '',
            tagline: '',
            type: '',
            voteAverage: 0,
            voteCount: 0,
          ),
          watchCountry: const [],
          watchCountrySelect: null,
          seasonSelect: null,
          episodeSeasonSelect: const [],
        )) {
    on<DetailsSeriesInitial>(_onDetailsSeriesInitial);
    on<SelectSeason>(_onSelectSeason);
  }

  void _onDetailsSeriesInitial(
      DetailsSeriesInitial event, Emitter<DetailsSeriesState> emit) async {
    emit(state.copyWith(
      status: ControlStatus.loading,
      serie: event.serieCache,
      typeSearchSeries: event.typeSearchSeries,
      blurImage: 'L02Fc7j[fQj[j[fQfQfQfQfQfQfQ',
      credits: [],
      episodeSeasonSelect: [],
      watchCountry: [],
      seasonSelect: null,
      watchCountrySelect: null,
    ));

    final failureOrMovie = await _getSeriesUsecase(
      ParamsGetSeries(idSerie: event.serieCache.id),
    );

    failureOrMovie.fold(
      (failure) => emit(state.copyWith(status: ControlStatus.failure)),
      (serie) => emit(state.copyWith(
        status: ControlStatus.success,
        serie: serie,
        seasonSelect: serie.seasons.first,
      )),
    );

    final failureOrCredits =
        await _getCreditsSeriesUsecase(ParamsGetCreditsSerie(
      idSerie: event.serieCache.id,
    ));

    failureOrCredits.fold(
      (failure) => null,
      (credits) => emit(state.copyWith(
        credits: credits,
      )),
    );

    final failureOrWatch = await _getWatchSeriesUsecase(ParamsGetWatchSeries(
      idSerie: event.serieCache.id,
    ));

    failureOrWatch.fold(
      (failure) => null,
      (watch) {
        WatchCountry? watchSelect;
        for (var element in watch) {
          if (element.country.name == 'BR') {
            watchSelect = element;
            break;
          }
        }

        emit(state.copyWith(
          watchCountry: watch.isEmpty ? [] : watch,
          watchCountrySelect: watch.isEmpty ? null : watchSelect ?? watch.first,
        ));
      },
    );

    final failureOrSeason = await _getEpisodesUsecase(ParamsGetEpisodes(
      idSerie: state.serie.id,
      seasonNumber: state.serie.seasons.first.seasonNumber,
    ));

    failureOrSeason.fold(
      (failure) => null,
      (season) => emit(state.copyWith(
        episodeSeasonSelect: season.episodes,
      )),
    );

    final failureOrHash = await _getHashImageUsecase(ParamsGetHashImage(
      urlImage: state.serie.posterPath,
    ));

    failureOrHash.fold(
      (failrue) => null,
      (hash) => emit(state.copyWith(
        blurImage: hash,
      )),
    );
  }

  void _onSelectSeason(
      SelectSeason event, Emitter<DetailsSeriesState> emit) async {
    emit(state.copyWith(
      status: ControlStatus.loading,
      seasonSelect: event.season,
    ));
    final failureOrSeason = await _getEpisodesUsecase(ParamsGetEpisodes(
      idSerie: state.serie.id,
      seasonNumber: event.season.seasonNumber,
    ));

    failureOrSeason.fold(
      (failure) => null,
      (season) => emit(state.copyWith(
        episodeSeasonSelect: season.episodes,
      )),
    );
    await Future.delayed(const Duration(seconds: 5));

    emit(state.copyWith(
      status: ControlStatus.success,
    ));
  }
}
