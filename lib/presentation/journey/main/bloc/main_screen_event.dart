part of 'main_screen_bloc.dart';

abstract class MainScreenEvent {}

class ChangePageIndexEvent extends MainScreenEvent {
  final int index;

  ChangePageIndexEvent({
    required this.index,
  });
}

class LoadUserEvent extends MainScreenEvent {}

class MainScreenLogoutEvent extends MainScreenEvent {}
