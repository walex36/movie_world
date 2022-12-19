import 'dart:convert';
import 'package:lib_series/src/domain/entities/episode_entity.dart';

class EpisodeModel extends Episode {
  const EpisodeModel({
    required DateTime airDate,
    required int episodeNumber,
    required int id,
    required String name,
    required String overview,
    required String productionCode,
    required int seasonNumber,
    required String stillPath,
    required double voteAverage,
    required int voteCount,
  }) : super(
          airDate: airDate,
          episodeNumber: episodeNumber,
          id: id,
          name: name,
          overview: overview,
          productionCode: productionCode,
          seasonNumber: seasonNumber,
          stillPath: stillPath,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'airDate': airDate.millisecondsSinceEpoch,
      'episodeNumber': episodeNumber,
      'id': id,
      'name': name,
      'overview': overview,
      'productionCode': productionCode,
      'seasonNumber': seasonNumber,
      'stillPath': stillPath,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory EpisodeModel.fromMap(Map<String, dynamic> map) {
    return EpisodeModel(
      airDate: map['air_date'] == null
          ? DateTime(0)
          : DateTime.parse(map['air_date']),
      episodeNumber: map['episode_number'] ?? 0,
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      overview: map['overview'] ?? '',
      productionCode: map['production_code'] ?? '',
      seasonNumber: map['season_number'] ?? 0,
      stillPath: map['still_path'] == null
          ? ''
          : 'https://image.tmdb.org/t/p/w500${map['still_path']}',
      voteAverage: map['vote_average'] ?? 0,
      voteCount: map['vote_count'] ?? 0,
    );
  }

  Episode toEntity() {
    return Episode(
      airDate: airDate,
      episodeNumber: episodeNumber,
      id: id,
      name: name,
      overview: overview,
      productionCode: productionCode,
      seasonNumber: seasonNumber,
      stillPath: stillPath,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  factory EpisodeModel.fromEntity(Episode episode) {
    return EpisodeModel(
      airDate: episode.airDate,
      episodeNumber: episode.episodeNumber,
      id: episode.id,
      name: episode.name,
      overview: episode.overview,
      productionCode: episode.productionCode,
      seasonNumber: episode.seasonNumber,
      stillPath: episode.stillPath,
      voteAverage: episode.voteAverage,
      voteCount: episode.voteCount,
    );
  }

  String toJson() => json.encode(toMap());

  factory EpisodeModel.fromJson(String source) =>
      EpisodeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EpisodeModel(airDate: $airDate, episodeNumber: $episodeNumber, id: $id, name: $name, overview: $overview, productionCode: $productionCode, seasonNumber: $seasonNumber, stillPath: $stillPath, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(covariant EpisodeModel other) {
    if (identical(this, other)) return true;

    return other.airDate == airDate &&
        other.episodeNumber == episodeNumber &&
        other.id == id &&
        other.name == name &&
        other.overview == overview &&
        other.productionCode == productionCode &&
        other.seasonNumber == seasonNumber &&
        other.stillPath == stillPath &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount;
  }

  @override
  int get hashCode {
    return airDate.hashCode ^
        episodeNumber.hashCode ^
        id.hashCode ^
        name.hashCode ^
        overview.hashCode ^
        productionCode.hashCode ^
        seasonNumber.hashCode ^
        stillPath.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode;
  }
}
