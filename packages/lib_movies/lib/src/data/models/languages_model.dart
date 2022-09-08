import 'dart:convert';

import 'package:lib_movies/lib_movies.dart';

class LanguagesModel extends Languages {
  const LanguagesModel({
    required String englishName,
    required String iso6391,
    required String name,
  }) : super(
          englishName: englishName,
          iso6391: iso6391,
          name: name,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'englishName': englishName,
      'iso6391': iso6391,
      'name': name,
    };
  }

  factory LanguagesModel.fromMap(Map<String, dynamic> map) {
    return LanguagesModel(
      englishName: map['english_name'] ?? '',
      iso6391: map['iso_639_1'] ?? '',
      name: map['name'] ?? '',
    );
  }

  Languages toEntity() {
    return Languages(
      englishName: englishName,
      iso6391: iso6391,
      name: name,
    );
  }

  factory LanguagesModel.fromEntity(Languages languages) {
    return LanguagesModel(
      englishName: languages.englishName,
      iso6391: languages.iso6391,
      name: languages.name,
    );
  }

  String toJson() => json.encode(toMap());

  factory LanguagesModel.fromJson(String source) =>
      LanguagesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LanguagesModel(englishName: $englishName, iso6391: $iso6391, name: $name)';
}
