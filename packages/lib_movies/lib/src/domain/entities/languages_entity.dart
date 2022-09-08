// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lib_dependencies/lib_dependencies.dart';

class Languages extends Equatable {
  final String englishName;
  final String iso6391;
  final String name;
  const Languages({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  Languages copyWith({
    String? englishName,
    String? iso6391,
    String? name,
  }) {
    return Languages(
      englishName: englishName ?? this.englishName,
      iso6391: iso6391 ?? this.iso6391,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [
        englishName,
        iso6391,
        name,
      ];
}
