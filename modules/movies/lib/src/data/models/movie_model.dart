import 'dart:convert';

import 'package:lib_core/lib_core.dart';
import 'package:movies/src/data/data.dart';
import 'package:movies/src/domain/domain.dart';

class MovieModel extends Movie {
  MovieModel({
    required bool adult,
    required String backdropPath,
    required CollectionModel belongsToCollection,
    required int budget,
    required List<GenreModel> genres,
    required String homepage,
    required int id,
    required String imdbId,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String posterPath,
    required List<CompanyModel> productionCompanies,
    required List<CountryModel> productionCountries,
    required DateTime releaseDate,
    required int revenue,
    required int runtime,
    required List<LanguagesModel> spokenLanguages,
    required String status,
    required String tagline,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          belongsToCollection: belongsToCollection,
          budget: budget,
          genres: List<Genre>.from(genres.map((genre) => genre.toEntity())),
          homepage: homepage,
          id: id,
          imdbId: imdbId,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          productionCompanies: List<Company>.from(
              productionCompanies.map((company) => company.toEntity())),
          productionCountries: List<Country>.from(
              productionCountries.map((country) => country.toEntity())),
          releaseDate: releaseDate,
          revenue: revenue,
          runtime: runtime,
          spokenLanguages: List<Languages>.from(
              spokenLanguages.map((language) => language.toEntity())),
          status: status,
          tagline: tagline,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdropPath': backdropPath,
      'belongsToCollection': belongsToCollection.toString(),
      'budget': budget,
      'genres': genres.asMap(),
      'homepage': homepage,
      'id': id,
      'imdbId': imdbId,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'productionCompanies': productionCompanies.asMap(),
      'productionCountries': productionCountries.asMap(),
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'revenue': revenue,
      'runtime': runtime,
      'spokenLanguages': spokenLanguages.asMap(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'] ?? '',
      belongsToCollection: map['belongs_to_collection'] != null
          ? CollectionModel.fromMap(map['belongs_to_collection'])
          : const CollectionModel(
              id: 0,
              name: '',
              posterPath: '',
              backdropPath: '',
            ),
      budget: map['budget'] ?? 0,
      genres: map['genres'] != null
          ? List<GenreModel>.from(
              map['genres'].map<GenreModel>(
                (x) => GenreModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      homepage: map['homepage'] ?? '',
      id: map['id'] as int,
      imdbId: map['imdbId'] ?? '',
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['vote_average'] != null
          ? double.parse(map['popularity'].toString())
          : 0.0,
      posterPath: map['poster_path'] != null
          ? 'https://image.tmdb.org/t/p/w500${map['poster_path']}'
          : '',
      productionCompanies: map['production_companies'] != null
          ? List<CompanyModel>.from(
              map['production_companies'].map<CompanyModel>(
                (x) => CompanyModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      productionCountries: map['production_countries'] != null
          ? List<CountryModel>.from(
              map['production_countries'].map<CountryModel>(
                (x) => CountryModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      releaseDate: map['release_date'] != null
          ? DateTime.parse(map['release_date'])
          : DateTime(0, 0, 0),
      spokenLanguages: map['spoken_languages'] != null
          ? List<LanguagesModel>.from(
              map['spoken_languages'].map<LanguagesModel>(
                (x) => LanguagesModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      status: map['status'] ?? '',
      tagline: map['tagline'] ?? '',
      revenue: map['revenue'] ?? 0,
      runtime: map['runtime'] ?? 0,
      title: map['title'] ?? '',
      video: map['video'] ?? false,
      voteAverage: map['vote_average'] != null
          ? double.parse(map['vote_average'].toString())
          : 0.0,
      voteCount: map['vote_count'] ?? 0,
    );
  }

  Movie toEntity() {
    return Movie(
      adult: adult,
      backdropPath: backdropPath,
      belongsToCollection: belongsToCollection,
      budget: budget,
      genres: genres,
      homepage: homepage,
      id: id,
      imdbId: imdbId,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      productionCompanies: productionCompanies,
      productionCountries: productionCountries,
      releaseDate: releaseDate,
      spokenLanguages: spokenLanguages,
      status: status,
      tagline: tagline,
      revenue: revenue,
      runtime: runtime,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  factory MovieModel.fromEntity(Movie movie) {
    return MovieModel(
      adult: movie.adult,
      backdropPath: movie.backdropPath,
      belongsToCollection:
          CollectionModel.fromEntity(movie.belongsToCollection),
      budget: movie.budget,
      genres: List<GenreModel>.from(movie.genres.map(
        (service) => GenreModel.fromEntity(service),
      )),
      homepage: movie.homepage,
      id: movie.id,
      imdbId: movie.imdbId,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath,
      productionCompanies:
          List<CompanyModel>.from(movie.productionCompanies.map(
        (company) => CompanyModel.fromEntity(company),
      )),
      productionCountries:
          List<CountryModel>.from(movie.productionCountries.map(
        (countrie) => CountryModel.fromEntity(countrie),
      )),
      releaseDate: movie.releaseDate,
      spokenLanguages: List<LanguagesModel>.from(movie.spokenLanguages.map(
        (language) => LanguagesModel.fromEntity(language),
      )),
      status: movie.status,
      tagline: movie.tagline,
      revenue: movie.revenue,
      runtime: movie.runtime,
      title: movie.title,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MovieModel(adult: $adult, backdropPath: $backdropPath, belongsToCollection: $belongsToCollection, genres: $genres, homepage: $homepage, id: $id, imdbId: $imdbId, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, productionCompanies: $productionCompanies, productionCountries: $productionCountries, releaseDate: $releaseDate, spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }
}
