import 'package:profile/domain/entities/login_request_entity.dart';
import 'package:profile/domain/entities/sign_up_request_entity.dart';
import 'package:profile/domain/entities/user_entity.dart';

abstract class AuthenticationRepository {

  Future<UserEntity> loginUser(LoginRequestEntity entity);

  Future<UserEntity> signUpUser(SignUpRequestEntity entity);

  Future<bool> isEmailExist(String email);

  Future<void> storeUser(UserEntity user);

  Future<void> storeIsGuest(bool isGuest);

  Future<void> updateAuthenticationHeader(String? accessToken);

  Future<bool> clearPreferences();

  Future<UserEntity> getUser();

  Future<bool> getIsGuest();

}
