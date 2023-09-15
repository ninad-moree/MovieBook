// ignore_for_file: annotate_overrides, overridden_fields

import '../../domain/entities/cast_entity.dart';

class CastCrewResultModel {
  final int id;
  final List<CastModel> cast;
  final List<Crew> crew;

  CastCrewResultModel({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory CastCrewResultModel.fromJson(Map<String, dynamic> json) {
    return CastCrewResultModel(
      id: json['id'] as int,
      cast: (json['cast'] as List<dynamic>?)
              ?.map((e) => CastModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      crew: (json['crew'] as List<dynamic>?)
              ?.map((e) => Crew.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cast'] = cast.map((v) => v.toJson()).toList();
    data['crew'] = crew.map((v) => v.toJson()).toList();
    return data;
  }
}

class CastModel extends CastEntity {
  final int castId;
  final String character;
  final String creditId;
  final int gender;
  final int id;
  final String name;
  final int order;
  final String profilePath;

  const CastModel({
    required this.castId,
    required this.character,
    required this.creditId,
    required this.gender,
    required this.id,
    required this.name,
    required this.order,
    required this.profilePath,
  }) : super(
          creditId: creditId,
          name: name,
          posterPath: profilePath,
          character: character,
        );

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      castId: json['cast_id'] as int? ??
          0, // Use a default value if cast_id is null.
      character: json['character'] as String? ??
          '', // Use a default value if character is null.
      creditId: json['credit_id'] as String? ??
          '', // Use a default value if credit_id is null.
      gender:
          json['gender'] as int? ?? 0, // Use a default value if gender is null.
      id: json['id'] as int? ?? 0, // Use a default value if id is null.
      name:
          json['name'] as String? ?? '', // Use a default value if name is null.
      order:
          json['order'] as int? ?? 0, // Use a default value if order is null.
      profilePath: json['profile_path'] as String? ??
          '', // Use a default value if profile_path is null.
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cast_id'] = castId;
    data['character'] = character;
    data['credit_id'] = creditId;
    data['gender'] = gender;
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    data['profile_path'] = profilePath;
    return data;
  }
}

class Crew {
  final String creditId;
  final String department;
  final int gender;
  final int id;
  final String job;
  final String name;
  final String? profilePath;

  Crew({
    required this.creditId,
    required this.department,
    required this.gender,
    required this.id,
    required this.job,
    required this.name,
    this.profilePath,
  });

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      creditId: json['credit_id'] as String? ??
          '', // Use a default value if credit_id is null.
      department: json['department'] as String? ??
          '', // Use a default value if department is null.
      gender:
          json['gender'] as int? ?? 0, // Use a default value if gender is null.
      id: json['id'] as int? ?? 0, // Use a default value if id is null.
      job: json['job'] as String? ?? '', // Use a default value if job is null.
      name:
          json['name'] as String? ?? '', // Use a default value if name is null.
      profilePath: json['profile_path'] as String?, // profile_path can be null.
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['credit_id'] = creditId;
    data['department'] = department;
    data['gender'] = gender;
    data['id'] = id;
    data['job'] = job;
    data['name'] = name;
    data['profile_path'] = profilePath;
    return data;
  }
}
