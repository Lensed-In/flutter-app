import 'package:pedantic/pedantic.dart';
import 'package:profile/data/local_data_source/authentication_local_data_source.dart';
import 'package:profile/data/models/course_chapter_model.dart';
import 'package:profile/data/models/login_request_model.dart';
import 'package:profile/data/models/sign_up_request_model.dart';
import 'package:profile/data/models/user_model.dart';
import 'package:profile/data/remote_data_sources/authentication_remote_data_source.dart';
import 'package:profile/data/remote_data_sources/course_remote_data_source.dart';
import 'package:profile/data/remote_data_sources/home_screen_remote_data_source.dart';
import 'package:profile/domain/entities/home_response_entity.dart';
import 'package:profile/domain/entities/login_request_entity.dart';
import 'package:profile/domain/entities/sign_up_request_entity.dart';
import 'package:profile/domain/entities/user_entity.dart';
import 'package:profile/domain/repositories/authentication_repository.dart';
import 'package:profile/domain/repositories/course_repository.dart';
import 'package:profile/domain/repositories/home_screen_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseRemoteDataSource courseRemoteDataSource;

  CourseRepositoryImpl({
    required this.courseRemoteDataSource,
  });

  @override
  Future<List<CourseChapterModel>> fetchCourseChapters(String courseId) async {
    final response =
        await courseRemoteDataSource.fetchCoursesChapters(courseId);
    return response;
  }

  @override
  Future<dynamic> enrollInCourse(String courseId) async {
    final response = await courseRemoteDataSource.enrollInCourse(courseId);
    return response;
  }

  @override
  Future<dynamic> completeCourse(String courseId) async {
    final response = await courseRemoteDataSource.completeCourse(courseId);
    return response;
  }
}
