import 'dart:convert';

import 'package:profile/common/constants/json_keys_constants.dart';
import 'package:profile/data/models/courses_bundle_model.dart';
import 'package:profile/domain/entities/home_response_entity.dart';

// part 'home_response_model.g.dart';

// @JsonSerializable()
class HomeResponseModel extends HomeResponseEntity {
  HomeResponseModel({
    CoursesBundleModel? featuredCourse,
    List<CoursesBundleModel>? trendingCourses,
  }) : super(
          featuredCourse: featuredCourse,
          trendingCourses: trendingCourses,
        );

  factory HomeResponseModel.fromEntity(HomeResponseEntity entity) =>
      HomeResponseModel(
        featuredCourse: CoursesBundleModel.fromEntity(entity.featuredCourse),
        trendingCourses:
            CoursesBundleModel.fromEntityList(entity.trendingCourses),
      );

  // factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
  //     _$HomeResponseModelFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$HomeResponseModelToJson(this);

  factory HomeResponseModel.fromJson(Map<String, dynamic> jsonMap) {
    return HomeResponseModel(
      featuredCourse: CoursesBundleModel.fromJson(
          jsonMap[JsonKeysConstants.featuredCourse]),
      trendingCourses: CoursesBundleModel.fromJsonList(
          jsonMap[JsonKeysConstants.trendingCourses]),
    );
  }

  Map<String, dynamic> toJson() {
    final json = {
      JsonKeysConstants.featuredCourse: CoursesBundleModel.fromEntity(featuredCourse).toJson(),
      JsonKeysConstants.trendingCourses: CoursesBundleModel.fromJsonList(trendingCourses),
    };
    return json;
  }

  String toJsonString() {
    final jsonMap = toJson();
    return json.encode(jsonMap);
  }

  factory HomeResponseModel.fromJsonString(String? jsonString) {
    if (jsonString != null) {
      final Map<String, dynamic> data = json.decode(jsonString);
      return HomeResponseModel.fromJson(data);
    }
    return HomeResponseModel();
  }
}
