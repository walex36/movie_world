import 'dart:convert';

import 'package:lib_movies/lib_movies.dart';

class GenreModel extends Genre {
  const GenreModel({
    required int id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
    );
  }

  Genre toEntity() {
    return Genre(
      id: id,
      name: name,
    );
  }

  factory GenreModel.fromEntity(Genre genre) {
    return GenreModel(
      id: genre.id,
      name: genre.name,
    );
  }

  String toJson() => json.encode(toMap());

  factory GenreModel.fromJson(String source) =>
      GenreModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GenreModel(id: $id, name: $name)';
}
