import 'package:profile/domain/entities/courses_bundle_entity.dart';

class HomeResponseEntity {
  final CoursesBundleEntity? featuredCourse;
  final List<CoursesBundleEntity>? trendingCourses;

  HomeResponseEntity({
    this.featuredCourse,
    this.trendingCourses,
  });
}
