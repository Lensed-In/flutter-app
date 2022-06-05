import 'package:profile/common/constants/json_keys_constants.dart';
import 'package:profile/common/util/app_utils.dart';
import 'package:profile/data/models/course_basic_info_model.dart';
import 'package:profile/data/models/course_chapter_model.dart';
import 'package:profile/data/models/home_response_model.dart';
import 'package:profile/data/models/user_model.dart';
import 'package:profile/networking/api/api_client.dart';
import 'package:profile/networking/api/api_endpoints.dart';

class UserProfileRemoteDataSource {
  final ApiClient apiClient;

  UserProfileRemoteDataSource({required this.apiClient});

  Future<UserModel> fetchUserInfo(String userId) async {
    // final response = await apiClient.get(ApiEndpoints.fetchCourseChapters);
    final response = await parseJson(jsonFilePath: "assets/json/user.json");
    final dynamic data = response[JsonKeysConstants.data];
    return UserModel.fromJson(data);
  }

  Future<List<CourseBasicInfoModel>> fetchUserCourses(String userId) async {
    // final response = await apiClient.get(ApiEndpoints.fetchCourseChapters);
    final response = await parseJson(jsonFilePath: "assets/json/learn_response.json");
    final List<dynamic> data = response[JsonKeysConstants.data];
    return data.map((json) => CourseBasicInfoModel.fromJson(json)).toList();
  }

}
