import 'package:lib_dependencies/lib_dependencies.dart';

class CreatedBy extends Equatable {
  final int id;
  final String creditId;
  final String name;
  final int gender;
  final String profilePath;

  const CreatedBy({
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
    required this.profilePath,
  });

  @override
  List<Object?> get props => [
        id,
        creditId,
        name,
        gender,
        profilePath,
      ];

  CreatedBy copyWith({
    int? id,
    String? creditId,
    String? name,
    int? gender,
    String? profilePath,
  }) {
    return CreatedBy(
      id: id ?? this.id,
      creditId: creditId ?? this.creditId,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      profilePath: profilePath ?? this.profilePath,
    );
  }
}
