// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_chapter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseChapterModel _$CourseChapterModelFromJson(Map<String, dynamic> json) =>
    CourseChapterModel(
      seqNo: json['seqNo'] as int?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      question: json['question'] as String?,
      answer: json['answer'] as String?,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CourseChapterModelToJson(CourseChapterModel instance) =>
    <String, dynamic>{
      'seqNo': instance.seqNo,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'question': instance.question,
      'answer': instance.answer,
      'options': instance.options,
    };
