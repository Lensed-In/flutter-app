part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileEvent {}

class FetchUserInfoEvent extends UserProfileEvent{}

class FetchUserCoursesEvent extends UserProfileEvent{}
