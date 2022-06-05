import 'package:profile/domain/entities/course_chapter_entity.dart';

abstract class CourseRepository {
  Future<List<CourseChapterEntity>> fetchCourseChapters(String courseId);

  Future<dynamic> enrollInCourse(String courseId);

  Future<dynamic> completeCourse(String courseId);
}
