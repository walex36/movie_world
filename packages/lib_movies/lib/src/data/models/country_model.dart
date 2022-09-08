import 'dart:convert';

import 'package:lib_movies/lib_movies.dart';

class CountryModel extends Country {
  const CountryModel({
    required String iso31661,
    required String name,
  }) : super(
          iso31661: iso31661,
          name: name,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iso31661': iso31661,
      'name': name,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      iso31661: map['iso_3166_1'] ?? '',
      name: map['name'] ?? '',
    );
  }

  Country toEntity() {
    return Country(
      iso31661: iso31661,
      name: name,
    );
  }

  factory CountryModel.fromEntity(Country country) {
    return CountryModel(
      iso31661: country.iso31661,
      name: country.name,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) =>
      CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CountryModel(iso31661: $iso31661, name: $name)';
}
