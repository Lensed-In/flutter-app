import 'package:profile/domain/entities/course_basic_info_entity.dart';
import 'package:profile/domain/entities/user_entity.dart';

abstract class UserProfileRepository {
  Future<UserEntity> fetchUserInfo(String userId);

  Future<List<CourseBasicInfoEntity>> fetchUserCourses(String userId);
}
