import 'package:profile/domain/entities/course_basic_info_entity.dart';

class CoursesBundleEntity {
  final String? title;
  final List<CourseBasicInfoEntity>? courses;

  CoursesBundleEntity({
    this.title,
    this.courses,
  });
}