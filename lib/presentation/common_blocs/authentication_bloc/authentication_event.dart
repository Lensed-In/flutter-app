import 'package:profile/domain/entities/user_entity.dart';

abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class Logout extends AuthenticationEvent {}

class Login extends AuthenticationEvent {
  final UserEntity user;

  Login({required this.user});
}

class UpdateAccessToken extends AuthenticationEvent {
  // if force true, it will exit from the app
  final String? accessToken;

  UpdateAccessToken({required this.accessToken});
}

class UpdateUser extends AuthenticationEvent {
  final UserEntity user;

  UpdateUser({required this.user});
}
