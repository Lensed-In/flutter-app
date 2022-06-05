// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobEntity _$JobEntityFromJson(Map<String, dynamic> json) => JobEntity(
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageURI: json['imageURI'] as String?,
      employer: json['employer'] as String?,
      organization: json['organization'] as String?,
      location: json['location'] as String?,
      salary: json['salary'] as String?,
    );

Map<String, dynamic> _$JobEntityToJson(JobEntity instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'imageURI': instance.imageURI,
      'employer': instance.employer,
      'organization': instance.organization,
      'location': instance.location,
      'salary': instance.salary,
    };
