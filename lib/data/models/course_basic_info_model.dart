import 'dart:convert';

import 'package:profile/common/constants/json_keys_constants.dart';
import 'package:profile/common/util/app_utils.dart';
import 'package:profile/data/models/user_model.dart';
import 'package:profile/domain/entities/course_basic_info_entity.dart';

class CourseBasicInfoModel extends CourseBasicInfoEntity {
  CourseBasicInfoModel({
    String? id,
    String? cover,
    String? title,
    String? description,
    String? readTime,
    int? totalChapters,
    int? totalQuiz,
    int? totalUserEnrolled,
    List<String>? topEnrolledUsersPic,
    UserModel? creator,
  }) : super(
          id: id,
          cover: cover,
          title: title,
          description: description,
          readTime: readTime,
          totalChapters: totalChapters,
          totalQuiz: totalQuiz,
          totalUserEnrolled: totalUserEnrolled,
          topEnrolledUsersPic: topEnrolledUsersPic,
          creator: creator,
        );

  factory CourseBasicInfoModel.fromEntity(CourseBasicInfoEntity entity) =>
      CourseBasicInfoModel(
        id: entity.id,
        cover: entity.cover,
        title: entity.title,
        description: entity.description,
        readTime: entity.readTime,
        totalChapters: entity.totalChapters,
        totalQuiz: entity.totalQuiz,
        totalUserEnrolled: entity.totalUserEnrolled,
        topEnrolledUsersPic: entity.topEnrolledUsersPic,
        creator: UserModel.fromEntity(entity.creator),
      );

  static List<CourseBasicInfoModel> fromEntityList(
      List<CourseBasicInfoEntity>? entityList) {
    if (entityList == null) {
      return [];
    }

    return entityList
        .map((category) => CourseBasicInfoModel.fromEntity(category))
        .toList();
  }

  factory CourseBasicInfoModel.fromJson(Map<String, dynamic> jsonMap) {
    return CourseBasicInfoModel(
        id: jsonMap[JsonKeysConstants.id],
        cover: jsonMap[JsonKeysConstants.cover],
        title: jsonMap[JsonKeysConstants.title],
        description: jsonMap[JsonKeysConstants.description],
        readTime: jsonMap[JsonKeysConstants.readTime],
        totalChapters: jsonMap[JsonKeysConstants.totalChapters],
        totalQuiz: jsonMap[JsonKeysConstants.totalQuiz],
        totalUserEnrolled: jsonMap[JsonKeysConstants.totalUserEnrolled],
        topEnrolledUsersPic: fromJsonToStringList(
            jsonMap[JsonKeysConstants.topEnrolledUsersPic]),
        creator: UserModel.fromJson(jsonMap[JsonKeysConstants.creator]));
  }

  Map<String, dynamic> toJson() {
    final json = {
      JsonKeysConstants.id: id,
      JsonKeysConstants.cover: cover,
      JsonKeysConstants.title: title,
      JsonKeysConstants.description: description,
      JsonKeysConstants.readTime: readTime,
      JsonKeysConstants.totalChapters: totalChapters,
      JsonKeysConstants.totalQuiz: totalQuiz,
      JsonKeysConstants.totalUserEnrolled: totalUserEnrolled,
      JsonKeysConstants.topEnrolledUsersPic: topEnrolledUsersPic,
      JsonKeysConstants.creator: UserModel.fromEntity(creator).toJson(),
    };
    return json;
  }

  static List<CourseBasicInfoModel> fromJsonList(Iterable? jsonList) {
    final List<CourseBasicInfoModel> courses = [];
    if (jsonList != null && List<dynamic>.from(jsonList).isNotEmpty) {
      for (final Map<String, dynamic> course in jsonList) {
        courses.add(CourseBasicInfoModel.fromJson(course));
      }
    }
    return courses;
  }

  static List<Map<String, dynamic>> toJsonList(
      List<CourseBasicInfoEntity>? courseBasicInfoEntityList) {
    return (courseBasicInfoEntityList != null &&
                courseBasicInfoEntityList.isNotEmpty
            ? courseBasicInfoEntityList
            : [])
        .map((entity) => CourseBasicInfoModel.fromEntity(entity).toJson())
        .toList();
  }

  // factory CourseBasicInfoModel.fromJson(Map<String, dynamic> json) =>
  //     _$CourseBasicInfoModelFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$CourseBasicInfoModelToJson(this);

  String toJsonString() {
    final jsonMap = toJson();
    return json.encode(jsonMap);
  }

  factory CourseBasicInfoModel.fromJsonString(String? jsonString) {
    if (jsonString != null) {
      final Map<String, dynamic> data = json.decode(jsonString);
      return CourseBasicInfoModel.fromJson(data);
    }
    return CourseBasicInfoModel();
  }
}
