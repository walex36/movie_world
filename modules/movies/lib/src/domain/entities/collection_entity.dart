// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lib_dependencies/lib_dependencies.dart';

class Collection extends Equatable {
  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;

  const Collection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  Collection copyWith({
    int? id,
    String? name,
    String? posterPath,
    String? backdropPath,
  }) {
    return Collection(
      id: id ?? this.id,
      name: name ?? this.name,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        posterPath,
        backdropPath,
      ];
}
