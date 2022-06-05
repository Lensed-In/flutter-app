part of 'home_screen_bloc.dart';

abstract class HomeScreenState {
  final HomeResponseEntity? homeResponseEntity;
  final dynamic publications;
  final dynamic jobs;

  HomeScreenState({this.homeResponseEntity, this.publications, this.jobs});

  HomeScreenState.copyWith(
    HomeScreenState oldState, {
    HomeResponseEntity? homeResponseEntity,
    dynamic publications,
        dynamic jobs,
  })  : homeResponseEntity = homeResponseEntity ?? oldState.homeResponseEntity,
        publications = publications ?? oldState.publications,
        jobs = jobs ?? oldState.jobs;
}

class HomeScreenInitial extends HomeScreenState {}

class FetchHomeScreenDataSuccessState extends HomeScreenState {
  FetchHomeScreenDataSuccessState(HomeScreenState oldState,
      {required dynamic publications})
      : super.copyWith(oldState, publications: publications);
}

class FetchHomeScreenDataFailedState extends HomeScreenState {
  FetchHomeScreenDataFailedState(
    HomeScreenState oldState,
  ) : super.copyWith(oldState);
}

class FetchJobsSuccessState extends HomeScreenState {
  FetchJobsSuccessState(HomeScreenState oldState,
      {required dynamic jobs})
      : super.copyWith(oldState, jobs: jobs);
}

class FetchJobsFailedState extends HomeScreenState {
  FetchJobsFailedState(
      HomeScreenState oldState,
      ) : super.copyWith(oldState);
}
