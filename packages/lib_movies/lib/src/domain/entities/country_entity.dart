// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lib_dependencies/lib_dependencies.dart';

class Country extends Equatable {
  final String iso31661;
  final String name;
  const Country({
    required this.iso31661,
    required this.name,
  });

  Country copyWith({
    String? iso31661,
    String? name,
  }) {
    return Country(
      iso31661: iso31661 ?? this.iso31661,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [
        iso31661,
        name,
      ];
}
