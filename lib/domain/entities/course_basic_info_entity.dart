import 'package:profile/domain/entities/user_entity.dart';

class CourseBasicInfoEntity {
  final String? id;
  final String? cover;
  final String? title;
  final String? description;
  final String? readTime;
  final int? totalChapters;
  final int? totalQuiz;
  final int? totalUserEnrolled;
  final List<String>? topEnrolledUsersPic;
  final UserEntity? creator;

  CourseBasicInfoEntity({
    this.id,
    this.cover,
    this.title,
    this.description,
    this.readTime,
    this.totalChapters,
    this.totalQuiz,
    this.totalUserEnrolled,
    this.topEnrolledUsersPic,
    this.creator,
  });
}
