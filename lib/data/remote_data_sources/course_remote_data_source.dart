import 'package:profile/common/constants/json_keys_constants.dart';
import 'package:profile/common/util/app_utils.dart';
import 'package:profile/data/models/course_chapter_model.dart';
import 'package:profile/data/models/home_response_model.dart';
import 'package:profile/networking/api/api_client.dart';
import 'package:profile/networking/api/api_endpoints.dart';

class CourseRemoteDataSource {
  final ApiClient apiClient;

  CourseRemoteDataSource({required this.apiClient});

  Future<List<CourseChapterModel>> fetchCoursesChapters(String courseId) async {
    // final response = await apiClient.get(ApiEndpoints.fetchCourseChapters);
    final response = await parseJson(jsonFilePath: "assets/json/chapters.json");
    final List<dynamic> data = response[JsonKeysConstants.data];
    return data.map((json) => CourseChapterModel.fromJson(json)).toList();
  }

  Future<dynamic> enrollInCourse(String courseId) async {
    // final response = await apiClient.get(ApiEndpoints.fetchCourseChapters);
    final response = await parseJson(jsonFilePath: "assets/json/chapters.json");
    return response;
  }

  Future<dynamic> completeCourse(String courseId) async {
    // final response = await apiClient.get(ApiEndpoints.fetchCourseChapters);
    final response = await parseJson(jsonFilePath: "assets/json/chapters.json");
    return response;
  }

}
