import 'package:profile/domain/entities/course_basic_info_entity.dart';

abstract class LearnRepository {
  Future<List<CourseBasicInfoEntity>> fetchLearnScreenData(String userId);
}
