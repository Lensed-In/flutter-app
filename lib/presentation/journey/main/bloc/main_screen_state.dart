part of 'main_screen_bloc.dart';

abstract class MainScreenState {
  final int currentIndex;
  final UserEntity? user;
  final bool? isGuest;

  MainScreenState({
    this.currentIndex = MainConstants.homePageIndex,
    this.isGuest,
    this.user,
  });

  MainScreenState.copyWith(
    MainScreenState oldState, {
    int? currentIndex,
    bool? isGuest,
    UserEntity? user,
  })  : currentIndex = currentIndex ?? oldState.currentIndex,
        isGuest = isGuest ?? oldState.isGuest,
        user = user ?? oldState.user;
}

class MainScreenInitial extends MainScreenState {}

class ChangedPageIndexState extends MainScreenState {
  ChangedPageIndexState(MainScreenState oldState, {required int index})
      : super.copyWith(oldState, currentIndex: index);
}

class MainScreenLoggedOutState extends MainScreenState {
  MainScreenLoggedOutState(MainScreenState oldState) : super.copyWith(oldState);
}

class LoadUserEventSuccessState extends MainScreenState {
  LoadUserEventSuccessState(MainScreenState oldState,
      {required bool? isGuest, required UserEntity? user})
      : super.copyWith(oldState, isGuest: isGuest, user: user);
}

class LoadUserEventFailedState extends MainScreenState {
  LoadUserEventFailedState(MainScreenState oldState) : super.copyWith(oldState);
}
