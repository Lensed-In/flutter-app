part of 'home_screen_bloc.dart';

abstract class HomeScreenState {
  final HomeResponseEntity? homeResponseEntity;
  final dynamic publications;

  HomeScreenState({this.homeResponseEntity, this.publications});

  HomeScreenState.copyWith(
    HomeScreenState oldState, {
    HomeResponseEntity? homeResponseEntity,
    dynamic publications,
  })  : homeResponseEntity = homeResponseEntity ?? oldState.homeResponseEntity,
        publications = publications ?? oldState.publications;
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
