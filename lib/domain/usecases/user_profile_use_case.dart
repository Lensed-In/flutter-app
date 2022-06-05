import 'package:profile/domain/entities/course_basic_info_entity.dart';
import 'package:profile/domain/entities/user_entity.dart';
import 'package:profile/domain/repositories/learn_repository.dart';
import 'package:profile/domain/repositories/user_profile_repository.dart';

class UserProfileUseCase {
  final UserProfileRepository userProfileRepository;

  UserProfileUseCase({required this.userProfileRepository});

  Future<UserEntity> fetchUserInfo(String courseId) async =>
      userProfileRepository.fetchUserInfo(courseId);

  Future<List<CourseBasicInfoEntity>> fetchUserCourses(String courseId) async =>
      userProfileRepository.fetchUserCourses(courseId);
}
