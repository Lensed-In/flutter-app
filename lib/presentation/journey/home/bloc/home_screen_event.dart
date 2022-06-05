part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenEvent {}

class FetchHomeScreenDataEvent extends HomeScreenEvent{}

class FetchJobsEvent extends HomeScreenEvent{}

class PostPublicationEvent extends HomeScreenEvent{}
