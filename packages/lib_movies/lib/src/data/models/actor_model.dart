import 'dart:convert';

import 'package:lib_movies/lib_movies.dart';

class ActorModel extends Actor {
  const ActorModel({
    required bool adult,
    required int gender,
    required int id,
    required String knownForDepartment,
    required String name,
    required String originalName,
    required double popularity,
    required String profilePath,
    required int castId,
    required String character,
    required String creditId,
    required int order,
  }) : super(
          adult: adult,
          gender: gender,
          id: id,
          knownForDepartment: knownForDepartment,
          name: name,
          originalName: originalName,
          popularity: popularity,
          profilePath: profilePath,
          castId: castId,
          character: character,
          creditId: creditId,
          order: order,
        );

  ActorModel copyWith({
    bool? adult,
    int? gender,
    int? id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    double? popularity,
    String? profilePath,
    int? castId,
    String? character,
    String? creditId,
    int? order,
  }) {
    return ActorModel(
      adult: adult ?? this.adult,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      knownForDepartment: knownForDepartment ?? this.knownForDepartment,
      name: name ?? this.name,
      originalName: originalName ?? this.originalName,
      popularity: popularity ?? this.popularity,
      profilePath: profilePath ?? this.profilePath,
      castId: castId ?? this.castId,
      character: character ?? this.character,
      creditId: creditId ?? this.creditId,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'gender': gender,
      'id': id,
      'knownForDepartment': knownForDepartment,
      'name': name,
      'originalName': originalName,
      'popularity': popularity,
      'profilePath': profilePath,
      'castId': castId,
      'character': character,
      'creditId': creditId,
      'order': order,
    };
  }

  factory ActorModel.fromMap(Map<String, dynamic> map) {
    return ActorModel(
      adult: map['adult'] ?? false,
      gender: map['gender'] ?? 0,
      id: map['id'] ?? 0,
      knownForDepartment: map['known_for_department'] ?? '',
      name: map['name'] ?? '',
      originalName: map['original_name'] ?? '',
      popularity: map['popularity'] ?? 0,
      profilePath: map['profile_path'] != null
          ? 'https://image.tmdb.org/t/p/w500${map['profile_path']}'
          : '',
      castId: map['cast_id'] ?? '',
      character: map['character'] ?? '',
      creditId: map['credit_id'] ?? '',
      order: map['order'] ?? '',
    );
  }

  Actor toEntity() {
    return Actor(
      adult: adult,
      gender: gender,
      id: id,
      knownForDepartment: knownForDepartment,
      name: name,
      originalName: originalName,
      popularity: popularity,
      profilePath: profilePath,
      castId: castId,
      character: character,
      creditId: creditId,
      order: order,
    );
  }

  factory ActorModel.fromEntity(Actor actor) {
    return ActorModel(
      adult: actor.adult,
      gender: actor.gender,
      id: actor.id,
      knownForDepartment: actor.knownForDepartment,
      name: actor.name,
      originalName: actor.originalName,
      popularity: actor.popularity,
      profilePath: actor.profilePath,
      castId: actor.castId,
      character: actor.character,
      creditId: actor.creditId,
      order: actor.order,
    );
  }

  String toJson() => json.encode(toMap());

  factory ActorModel.fromJson(String source) =>
      ActorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ActorModel(adult: $adult, gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, castId: $castId, character: $character, creditId: $creditId, order: $order)';
  }
}
