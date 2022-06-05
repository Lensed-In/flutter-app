import 'package:profile/domain/entities/login_request_entity.dart';
import 'package:profile/domain/entities/sign_up_request_entity.dart';
import 'package:profile/domain/entities/user_entity.dart';
import 'package:profile/domain/repositories/authentication_repository.dart';

class AuthenticationUseCase {
  final AuthenticationRepository authenticationRepository;

  AuthenticationUseCase({
    required this.authenticationRepository,
  });

  Future<UserEntity> loginUser(LoginRequestEntity entity) async =>
      authenticationRepository.loginUser(entity);

  Future<UserEntity> signUpUser(SignUpRequestEntity entity) async =>
      authenticationRepository.signUpUser(entity);

  Future<bool> isEmailExist(String email) async =>
      authenticationRepository.isEmailExist(email);

  Future<void> storeUser(UserEntity user) =>
      authenticationRepository.storeUser(user);

  Future<void> storeIsGuest(bool isGuest) =>
      authenticationRepository.storeIsGuest(isGuest);

  Future<void> updateAuthHeaderWithAccessToken(String? accessToken) async =>
      authenticationRepository.updateAuthenticationHeader(accessToken);

  Future<void> clearPreferences() async =>
      await authenticationRepository.clearPreferences();

  Future<UserEntity> getUser() async =>
      await authenticationRepository.getUser();

  Future<bool> getIsGuest() async =>
      await authenticationRepository.getIsGuest();
}
