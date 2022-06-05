import 'package:json_annotation/json_annotation.dart';

part 'job_entity.g.dart';

@JsonSerializable()
class JobEntity {
  final String? title;
  final String? description;
  final String? imageURI;
  final String? employer;
  final String? organization;
  final String? location;
  final String? salary;


  JobEntity({
    this.title,
    this.description,
    this.imageURI,
    this.employer,
    this.organization,
    this.location,
    this.salary,
  });


  factory JobEntity.fromJson(Map<String, dynamic> json) =>
      _$JobEntityFromJson(json);
}
