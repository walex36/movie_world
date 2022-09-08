// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lib_dependencies/lib_dependencies.dart';

class Company extends Equatable {
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;
  const Company({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  Company copyWith({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) {
    return Company(
      id: id ?? this.id,
      logoPath: logoPath ?? this.logoPath,
      name: name ?? this.name,
      originCountry: originCountry ?? this.originCountry,
    );
  }

  @override
  List<Object?> get props => [
        id,
        logoPath,
        name,
        originCountry,
      ];
}
