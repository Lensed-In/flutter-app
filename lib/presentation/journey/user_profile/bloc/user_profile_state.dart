part of 'user_profile_bloc.dart';

abstract class UserProfileState {
  final UserEntity? user;
  final List<CourseBasicInfoEntity>? courses;

  UserProfileState({
    this.user,
    this.courses,
  });

  UserProfileState.copyWith(
    UserProfileState oldState, {
    UserEntity? user,
    List<CourseBasicInfoEntity>? courses,
  })  : user = user ?? oldState.user,
        courses = courses ?? oldState.courses;
}

class UserProfileInitial extends UserProfileState {}

class FetchUserInfoSuccessState extends UserProfileState {
  FetchUserInfoSuccessState(UserProfileState oldState,
      {required UserEntity? user})
      : super.copyWith(oldState, user: user);
}

class FetchUserInfoFailedState extends UserProfileState {
  FetchUserInfoFailedState(UserProfileState oldState)
      : super.copyWith(oldState);
}

class FetchUserCoursesSuccessState extends UserProfileState {
  FetchUserCoursesSuccessState(UserProfileState oldState,
      {required List<CourseBasicInfoEntity>? courses})
      : super.copyWith(oldState, courses: courses);
}

class FetchUserCoursesFailedState extends UserProfileState {
  FetchUserCoursesFailedState(
    UserProfileState oldState,
  ) : super.copyWith(oldState);
}
