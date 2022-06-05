import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:profile/common/constants/json_keys_constants.dart';
import 'package:profile/data/models/course_basic_info_model.dart';
import 'package:profile/domain/entities/courses_bundle_entity.dart';

// part 'course_bundle_model.g.dart';

// @JsonSerializable()
class CoursesBundleModel extends CoursesBundleEntity {
  CoursesBundleModel({
    String? title,
    List<CourseBasicInfoModel>? courses,
  }) : super(
          title: title,
          courses: courses,
        );

  factory CoursesBundleModel.fromEntity(CoursesBundleEntity? entity) =>
      entity != null
          ? CoursesBundleModel(
              title: entity.title,
              courses: CourseBasicInfoModel.fromEntityList(entity.courses),
            )
          : CoursesBundleModel();

  static List<CoursesBundleModel> fromEntityList(
          List<CoursesBundleEntity>? entityList) =>
      entityList != null
          ? entityList
              .map((category) => CoursesBundleModel.fromEntity(category))
              .toList()
          : [];

  factory CoursesBundleModel.fromJson(Map<String, dynamic>? jsonMap) {

    return jsonMap != null
        ? CoursesBundleModel(
            title: jsonMap[JsonKeysConstants.title],
            courses: CourseBasicInfoModel.fromJsonList(
                jsonMap[JsonKeysConstants.courses]))
        : CoursesBundleModel();
  }

  Map<String, dynamic> toJson() {
    final json = {
      JsonKeysConstants.title: title,
      JsonKeysConstants.courses: CourseBasicInfoModel.toJsonList(courses),
    };
    return json;
  }

  static List<CoursesBundleModel> fromJsonList(Iterable? jsonList) {
    final List<CoursesBundleModel> courses = [];
    if (jsonList != null && List<dynamic>.from(jsonList).isNotEmpty) {
      for (final Map<String, dynamic> course in jsonList) {
        courses.add(CoursesBundleModel.fromJson(course));
      }
    }
    return courses;
  }

  static List<Map<String, dynamic>> toJsonList(List<CoursesBundleEntity>? courseBundleEntityList) {
    return (courseBundleEntityList != null && courseBundleEntityList.isNotEmpty ? courseBundleEntityList : [])
        .map((entity) => CoursesBundleModel.fromEntity(entity).toJson())
        .toList();
  }


  // factory CoursesBundleModel.fromJson(Map<String, dynamic> json) =>
  //     _$CoursesBundleModelFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$CoursesBundleModelToJson(this);

  String toJsonString() {
    final jsonMap = toJson();
    return json.encode(jsonMap);
  }

  factory CoursesBundleModel.fromJsonString(String? jsonString) {
    if (jsonString != null) {
      final Map<String, dynamic> data = json.decode(jsonString);
      return CoursesBundleModel.fromJson(data);
    }
    return CoursesBundleModel();
  }
}
