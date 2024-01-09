import 'dart:convert';
import 'package:series/src/domain/domain.dart';

class CreateByModel extends CreatedBy {
  const CreateByModel({
    required int id,
    required String creditId,
    required String name,
    required int gender,
    required String profilePath,
  }) : super(
          id: id,
          creditId: creditId,
          name: name,
          gender: gender,
          profilePath: profilePath,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'creditId': creditId,
      'name': name,
      'gender': gender,
      'profilePath': profilePath,
    };
  }

  factory CreateByModel.fromMap(Map<String, dynamic> map) {
    return CreateByModel(
      id: map['id'] ?? 0,
      creditId: map['credit_id'] ?? '',
      name: map['name'] ?? '',
      gender: map['gender'] ?? 0,
      profilePath: map['profile_path'] ?? '',
    );
  }

  CreatedBy toEntity() {
    return CreatedBy(
      id: id,
      creditId: creditId,
      name: name,
      gender: gender,
      profilePath: profilePath,
    );
  }

  factory CreateByModel.fromEntity(CreatedBy createdBy) {
    return CreateByModel(
      id: createdBy.id,
      creditId: createdBy.creditId,
      name: createdBy.name,
      gender: createdBy.gender,
      profilePath: createdBy.profilePath,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateByModel.fromJson(String source) =>
      CreateByModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CreateByModel(id: $id, creditId: $creditId, name: $name, gender: $gender, profilePath: $profilePath)';
  }
}
