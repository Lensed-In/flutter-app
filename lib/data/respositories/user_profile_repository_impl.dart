import 'package:profile/data/models/course_basic_info_model.dart';
import 'package:profile/data/models/user_model.dart';
import 'package:profile/data/remote_data_sources/learn_remote_data_source.dart';
import 'package:profile/data/remote_data_sources/user_profile_remote_data_source.dart';
import 'package:profile/domain/entities/user_entity.dart';
import 'package:profile/domain/repositories/learn_repository.dart';
import 'package:profile/domain/repositories/user_profile_repository.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDataSource userProfileRemoteDataSource;

  UserProfileRepositoryImpl({required this.userProfileRemoteDataSource});

  @override
  Future<UserModel> fetchUserInfo(String userId) async {
    final response = await userProfileRemoteDataSource.fetchUserInfo(userId);
    return response;
  }

  @override
  Future<List<CourseBasicInfoModel>> fetchUserCourses(String userId) async {
    final response = await userProfileRemoteDataSource.fetchUserCourses(userId);
    return response;
  }
}
