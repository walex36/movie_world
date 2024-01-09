import 'dart:convert';
import 'package:series/src/data/data.dart';
import 'package:series/src/domain/domain.dart';

class SeasonModel extends Season {
  @override
  const SeasonModel({
    required DateTime airDate,
    required int episodeCount,
    required int id,
    required String name,
    required String overview,
    required String posterPath,
    required int seasonNumber,
    required List<EpisodeModel> episodes,
  }) : super(
          airDate: airDate,
          episodeCount: episodeCount,
          id: id,
          name: name,
          overview: overview,
          posterPath: posterPath,
          seasonNumber: seasonNumber,
          episodes: episodes,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'airDate': airDate.millisecondsSinceEpoch,
      'episodeCount': episodeCount,
      'id': id,
      'name': name,
      'overview': overview,
      'posterPath': posterPath,
      'seasonNumber': seasonNumber,
      'episodes': episodes,
    };
  }

  factory SeasonModel.fromMap(Map<String, dynamic> map) {
    return SeasonModel(
      airDate: map['air_date'] == null
          ? DateTime(0)
          : DateTime.parse(map['air_date']),
      episodeCount: map['episode_count'] ?? 0,
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      overview: map['overview'] ?? '',
      posterPath: map['poster_path'] == null
          ? ''
          : 'https://image.tmdb.org/t/p/w500${map['poster_path']}',
      seasonNumber: map['season_number'] ?? 0,
      episodes: map['episodes'] == null
          ? []
          : List<EpisodeModel>.from(map['episodes'].map(
              (ep) => EpisodeModel.fromMap(ep),
            )),
    );
  }

  Season toEntity() {
    return Season(
      airDate: airDate,
      episodeCount: episodeCount,
      id: id,
      name: name,
      overview: overview,
      posterPath: posterPath,
      seasonNumber: seasonNumber,
      episodes: episodes,
    );
  }

  factory SeasonModel.fromEntity(Season season) {
    return SeasonModel(
      airDate: season.airDate,
      episodeCount: season.episodeCount,
      id: season.id,
      name: season.name,
      overview: season.overview,
      posterPath: season.posterPath,
      seasonNumber: season.seasonNumber,
      episodes: season.episodes.map((e) => EpisodeModel.fromEntity(e)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory SeasonModel.fromJson(String source) =>
      SeasonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SeasonModel(airDate: $airDate, episodeCount: $episodeCount, id: $id, name: $name, overview: $overview, posterPath: $posterPath, seasonNumber: $seasonNumber, episodes: $episodes)';
  }
}
