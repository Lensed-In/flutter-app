import 'package:profile/domain/entities/course_chapter_entity.dart';
import 'package:profile/domain/repositories/course_repository.dart';

class CourseUseCase {
  final CourseRepository courseRepository;

  CourseUseCase({
    required this.courseRepository,
  });

  Future<List<CourseChapterEntity>> fetchCourseChapters(String courseId) async =>
      courseRepository.fetchCourseChapters(courseId);

  Future<dynamic> enrollInCourse(String courseId) async =>
      courseRepository.enrollInCourse(courseId);

  Future<dynamic> completeCourse(String courseId) async =>
      courseRepository.completeCourse(courseId);
}
