import 'dart:convert';

import 'package:lib_core/lib_core.dart';

class CompanyModel extends Company {
  const CompanyModel({
    required int id,
    required String logoPath,
    required String name,
    required String originCountry,
  }) : super(
          id: id,
          logoPath: logoPath,
          name: name,
          originCountry: originCountry,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'logoPath': logoPath,
      'name': name,
      'originCountry': originCountry,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      id: map['id'] ?? 0,
      logoPath: map['logo_path'] != null
          ? 'https://image.tmdb.org/t/p/w500${map['logo_path']}'
          : '',
      name: map['name'] ?? '',
      originCountry: map['origin_country'] ?? '',
    );
  }

  Company toEntity() {
    return Company(
      id: id,
      logoPath: logoPath,
      name: name,
      originCountry: originCountry,
    );
  }

  factory CompanyModel.fromEntity(Company company) {
    return CompanyModel(
      id: company.id,
      logoPath: company.logoPath,
      name: company.name,
      originCountry: company.originCountry,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) =>
      CompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CompanyModel(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';
  }
}
