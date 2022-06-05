import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:profile/common/constants/json_keys_constants.dart';
import 'package:profile/domain/entities/course_basic_info_entity.dart';
import 'package:profile/domain/entities/course_chapter_entity.dart';

part 'course_chapter_model.g.dart';

@JsonSerializable()
class CourseChapterModel extends CourseChapterEntity {
  CourseChapterModel({
    int? seqNo,
    String? type,
    String? title,
    String? description,
    String? question,
    String? answer,
    List<String>? options,
  }) : super(
          seqNo: seqNo,
          type: type,
          title: title,
          description: description,
          question: question,
          answer: answer,
          options: options,
        );

  factory CourseChapterModel.fromEntity(CourseChapterEntity entity) =>
      CourseChapterModel(
        seqNo: entity.seqNo,
        type: entity.type,
        title: entity.title,
        description: entity.description,
        question: entity.question,
        answer: entity.answer,
        options: entity.options,
      );


  factory CourseChapterModel.fromJson(Map<String, dynamic> json) =>
      _$CourseChapterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseChapterModelToJson(this);

  String toJsonString() {
    final jsonMap = toJson();
    return json.encode(jsonMap);
  }

  factory CourseChapterModel.fromJsonString(String? jsonString) {
    if (jsonString != null) {
      final Map<String, dynamic> data = json.decode(jsonString);
      return CourseChapterModel.fromJson(data);
    }
    return CourseChapterModel();
  }
}
