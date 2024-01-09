import 'dart:convert';

import 'package:lib_core/lib_core.dart';
import 'package:series/src/data/data.dart';
import 'package:series/src/domain/domain.dart';

class SerieModel extends Serie {
  const SerieModel({
    required String backdropPath,
    required List<CreateByModel> createdBy,
    required List<int> episodeRunTime,
    required DateTime firstAirDate,
    required List<GenreModel> genres,
    required String homepage,
    required int id,
    required bool inProduction,
    required List<String> languages,
    required DateTime lastAirDate,
    required EpisodeModel lastEpisodeToAir,
    required String name,
    required EpisodeModel? nextEpisodeToAir,
    required List<CompanyModel> networks,
    required int numberOfEpisodes,
    required int numberOfSeasons,
    required List<String> originCountry,
    required String originalLanguage,
    required String originalName,
    required String overview,
    required double popularity,
    required String posterPath,
    required List<CompanyModel> productionCompanies,
    required List<CountryModel> productionCountries,
    required List<SeasonModel> seasons,
    required List<LanguagesModel> spokenLanguages,
    required String status,
    required String tagline,
    required String type,
    required double voteAverage,
    required int voteCount,
  }) : super(
            backdropPath: backdropPath,
            createdBy: createdBy,
            episodeRunTime: episodeRunTime,
            firstAirDate: firstAirDate,
            genres: genres,
            homepage: homepage,
            id: id,
            inProduction: inProduction,
            languages: languages,
            lastAirDate: lastAirDate,
            lastEpisodeToAir: lastEpisodeToAir,
            name: name,
            nextEpisodeToAir: nextEpisodeToAir,
            networks: networks,
            numberOfEpisodes: numberOfEpisodes,
            numberOfSeasons: numberOfSeasons,
            originCountry: originCountry,
            originalLanguage: originalLanguage,
            originalName: originalName,
            overview: overview,
            popularity: popularity,
            posterPath: posterPath,
            productionCompanies: productionCompanies,
            productionCountries: productionCountries,
            seasons: seasons,
            spokenLanguages: spokenLanguages,
            status: status,
            tagline: tagline,
            type: type,
            voteAverage: voteAverage,
            voteCount: voteCount);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'backdropPath': backdropPath,
      'createdBy': createdBy.asMap(),
      'episodeRunTime': episodeRunTime,
      'firstAirDate': firstAirDate.millisecondsSinceEpoch,
      'genres': genres.asMap(),
      'homepage': homepage,
      'id': id,
      'inProduction': inProduction,
      'languages': languages,
      'lastAirDate': lastAirDate.millisecondsSinceEpoch,
      'lastEpisodeToAir': lastEpisodeToAir.toString(),
      'name': name,
      'nextEpisodeToAir': nextEpisodeToAir?.toString(),
      'networks': networks.asMap(),
      'numberOfEpisodes': numberOfEpisodes,
      'numberOfSeasons': numberOfSeasons,
      'originCountry': originCountry,
      'originalLanguage': originalLanguage,
      'originalName': originalName,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'productionCompanies': productionCompanies.asMap(),
      'productionCountries': productionCountries.asMap(),
      'seasons': seasons.asMap(),
      'spokenLanguages': spokenLanguages.asMap(),
      'status': status,
      'tagline': tagline,
      'type': type,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory SerieModel.fromMap(Map<String, dynamic> map) {
    return SerieModel(
      backdropPath: map['backdrop_path'] == null
          ? ''
          : 'https://image.tmdb.org/t/p/w500${map['backdrop_path']}',
      createdBy: map['created_by'] == null
          ? []
          : List<CreateByModel>.from(map['created_by'].map(
              (by) => CreateByModel.fromMap(by),
            )),
      episodeRunTime: List<int>.from(map['episode_run_time'] ?? []),
      firstAirDate: map['first_air_date'] == null || map['first_air_date'] == ''
          ? DateTime(0)
          : DateTime.parse(map['first_air_date']),
      genres: map['genres'] == null
          ? []
          : List<GenreModel>.from(map['genres'].map(
              (genre) => GenreModel.fromMap(genre),
            )),
      homepage: map['homepage'] ?? '',
      id: map['id'] as int,
      inProduction: map['in_production'] ?? false,
      languages: List<String>.from(map['languages'] ?? []),
      lastAirDate: map['last_air_date'] == null
          ? DateTime(0)
          : DateTime.parse(map['last_air_date']),
      lastEpisodeToAir: EpisodeModel.fromMap(map['last_episode_to_air'] ?? {}),
      name: map['name'] as String,
      nextEpisodeToAir: EpisodeModel.fromMap(map['next_episode_to_air'] ?? {}),
      networks: map['networks'] == null
          ? []
          : List<CompanyModel>.from(map['networks'].map(
              (network) => CompanyModel.fromMap(network),
            )),
      numberOfEpisodes: map['number_of_episodes'] ?? 0,
      numberOfSeasons: map['number_of_seasons'] ?? 0,
      originCountry: List<String>.from(map['origin_country'] ?? []),
      originalLanguage: map['original_language'] ?? '',
      originalName: map['original_name'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity'] == null
          ? 0.0
          : double.parse(map['popularity'].toString()),
      posterPath: map['poster_path'] == null
          ? ''
          : 'https://image.tmdb.org/t/p/w500${map['poster_path']}',
      productionCompanies: map['production_companies'] == null
          ? []
          : List<CompanyModel>.from(map['production_companies'].map(
              (companie) => CompanyModel.fromMap(companie),
            )),
      productionCountries: map['production_countries'] == null
          ? []
          : List<CountryModel>.from(map['production_countries'].map(
              (countrie) => CountryModel.fromMap(countrie),
            )),
      seasons: map['seasons'] == null
          ? []
          : List<SeasonModel>.from(map['seasons'].map(
              (season) => SeasonModel.fromMap(season),
            )),
      spokenLanguages: map['spoken_languages'] == null
          ? []
          : List<LanguagesModel>.from(map['spoken_languages'].map(
              (language) => LanguagesModel.fromMap(language),
            )),
      status: map['status'] ?? '',
      tagline: map['tagline'] ?? '',
      type: map['type'] ?? '',
      voteAverage: map['vote_average'] == null
          ? 0.0
          : double.parse(map['vote_average'].toString()),
      voteCount: map['vote_count'] ?? 0,
    );
  }

  Serie toEntity() {
    return Serie(
      backdropPath: backdropPath,
      createdBy: createdBy,
      episodeRunTime: episodeRunTime,
      firstAirDate: firstAirDate,
      genres: genres,
      homepage: homepage,
      id: id,
      inProduction: inProduction,
      languages: languages,
      lastAirDate: lastAirDate,
      lastEpisodeToAir: lastEpisodeToAir,
      name: name,
      nextEpisodeToAir: nextEpisodeToAir,
      networks: networks,
      numberOfEpisodes: numberOfEpisodes,
      numberOfSeasons: numberOfSeasons,
      originCountry: originCountry,
      originalLanguage: originalLanguage,
      originalName: originalName,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      productionCompanies: productionCompanies,
      productionCountries: productionCountries,
      seasons: seasons,
      spokenLanguages: spokenLanguages,
      status: status,
      tagline: tagline,
      type: type,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  factory SerieModel.fromEntity(Serie serie) {
    return SerieModel(
      backdropPath: serie.backdropPath,
      createdBy: List<CreateByModel>.from(serie.createdBy.map(
        (createdBy) => CreateByModel.fromEntity(createdBy),
      )),
      episodeRunTime: serie.episodeRunTime,
      firstAirDate: serie.firstAirDate,
      genres: List<GenreModel>.from(serie.genres.map(
        (genre) => GenreModel.fromEntity(genre),
      )),
      homepage: serie.homepage,
      id: serie.id,
      inProduction: serie.inProduction,
      languages: serie.languages,
      lastAirDate: serie.lastAirDate,
      lastEpisodeToAir: EpisodeModel.fromEntity(serie.lastEpisodeToAir),
      name: serie.name,
      nextEpisodeToAir: serie.nextEpisodeToAir == null
          ? null
          : EpisodeModel.fromEntity(serie.nextEpisodeToAir!),
      networks: List<CompanyModel>.from(serie.networks.map(
        (network) => CompanyModel.fromEntity(network),
      )),
      numberOfEpisodes: serie.numberOfEpisodes,
      numberOfSeasons: serie.numberOfSeasons,
      originCountry: serie.originCountry,
      originalLanguage: serie.originalLanguage,
      originalName: serie.originalName,
      overview: serie.overview,
      popularity: serie.popularity,
      posterPath: serie.posterPath,
      productionCompanies:
          List<CompanyModel>.from(serie.productionCompanies.map(
        (companie) => CompanyModel.fromEntity(companie),
      )),
      productionCountries:
          List<CountryModel>.from(serie.productionCountries.map(
        (countrie) => CountryModel.fromEntity(countrie),
      )),
      seasons: List<SeasonModel>.from(serie.seasons.map(
        (season) => SeasonModel.fromEntity(season),
      )),
      spokenLanguages: List<LanguagesModel>.from(serie.spokenLanguages.map(
        (language) => LanguagesModel.fromEntity(language),
      )),
      status: serie.status,
      tagline: serie.tagline,
      type: serie.type,
      voteAverage: serie.voteAverage,
      voteCount: serie.voteCount,
    );
  }

  String toJson() => json.encode(toMap());

  factory SerieModel.fromJson(String source) =>
      SerieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SerieModel(backdropPath: $backdropPath, createdBy: $createdBy, episodeRunTime: $episodeRunTime, firstAirDate: $firstAirDate, genres: $genres, homepage: $homepage, id: $id, inProduction: $inProduction, languages: $languages, lastAirDate: $lastAirDate, lastEpisodeToAir: $lastEpisodeToAir, name: $name, nextEpisodeToAir: $nextEpisodeToAir, networks: $networks, numberOfEpisodes: $numberOfEpisodes, numberOfSeasons: $numberOfSeasons, originCountry: $originCountry, originalLanguage: $originalLanguage, originalName: $originalName, overview: $overview, popularity: $popularity, posterPath: $posterPath, productionCompanies: $productionCompanies, productionCountries: $productionCountries, seasons: $seasons, spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, type: $type, voteAverage: $voteAverage, voteCount: $voteCount)';
  }
}
