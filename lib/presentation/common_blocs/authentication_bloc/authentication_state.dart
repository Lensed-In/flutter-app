import 'package:profile/domain/entities/user_entity.dart';

abstract class AuthenticationState {
  final UserEntity? user;
  AuthenticationState({this.user});
}

// when nothing is initialized
class Uninitialized extends AuthenticationState {
  Uninitialized() : super();
}

// when the app is trying to load
class AppLoading extends AuthenticationState {}

class LoggedInState extends AuthenticationState {
  LoggedInState({user}) : super(user: user);
}

class LoggedOutState extends AuthenticationState {}

class AccessTokenUpdateState extends AuthenticationState {
  AccessTokenUpdateState({user}) : super(user: user);
}

class UserDetailsUpdatedState extends AuthenticationState {
  UserDetailsUpdatedState({user}) : super(user: user);
}
