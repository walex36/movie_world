import 'package:lib_core/src/const/country_iso.dart';
import 'package:lib_dependencies/lib_dependencies.dart';

class Country extends Equatable {
  final String iso31661;
  final String name;
  const Country({
    required this.iso31661,
    required this.name,
  });

  String get nativeName {
    final itens =
        countryIso.where((element) => element['iso_3166_1'] == name).toList();

    if (itens.isEmpty) {
      return name;
    }

    return itens.first['native_name'] ?? name;
  }

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
