import 'package:movies/src/domain/domain.dart';

class CollectionModel extends Collection {
  const CollectionModel({
    required int id,
    required String name,
    required String posterPath,
    required String backdropPath,
  }) : super(
          id: id,
          name: name,
          posterPath: posterPath,
          backdropPath: backdropPath,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'posterPath': posterPath,
      'backdropPath': backdropPath,
    };
  }

  factory CollectionModel.fromMap(Map<String, dynamic> map) {
    return CollectionModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      posterPath: map['poster_path'] ?? '',
      backdropPath: map['backdrop_path'] ?? '',
    );
  }

  Collection toEntity() {
    return Collection(
      id: id,
      name: name,
      posterPath: posterPath,
      backdropPath: backdropPath,
    );
  }

  factory CollectionModel.fromEntity(Collection collection) {
    return CollectionModel(
      id: collection.id,
      name: collection.name,
      posterPath: collection.posterPath,
      backdropPath: collection.backdropPath,
    );
  }

  @override
  String toString() {
    return 'CollectionModel(id: $id, name: $name, posterPath: $posterPath, backdropPath: $backdropPath)';
  }
}
