import 'package:pedantic/pedantic.dart';
import 'package:profile/data/local_data_source/authentication_local_data_source.dart';
import 'package:profile/data/models/login_request_model.dart';
import 'package:profile/data/models/sign_up_request_model.dart';
import 'package:profile/data/models/user_model.dart';
import 'package:profile/data/remote_data_sources/authentication_remote_data_source.dart';
import 'package:profile/domain/entities/login_request_entity.dart';
import 'package:profile/domain/entities/sign_up_request_entity.dart';
import 'package:profile/domain/entities/user_entity.dart';
import 'package:profile/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;
  final AuthenticationLocalDataSource authenticationLocalDataSource;

  AuthenticationRepositoryImpl({
    required this.authenticationRemoteDataSource,
    required this.authenticationLocalDataSource,
  });

  @override
  Future<UserEntity> loginUser(LoginRequestEntity entity) async {
    final response = await authenticationRemoteDataSource
        .loginUser(LoginRequestModel.fromEntity(entity));
    unawaited(_storeUserDataToLocalStorage(response));
    return response;
  }

  @override
  Future<UserEntity> signUpUser(SignUpRequestEntity entity) async =>
      authenticationRemoteDataSource
          .signUpUser(SignUpRequestModel.fromEntity(entity));

  @override
  Future<bool> isEmailExist(String email) async =>
      authenticationRemoteDataSource.isEmailExist(email);

  @override
  Future<void> storeUser(UserEntity userEntity) =>
      authenticationLocalDataSource.storeUser(
          UserModel.fromEntity(userEntity).toJsonString());

  @override
  Future<void> storeIsGuest(bool isGuest) =>
      authenticationLocalDataSource.storeIsGuest(isGuest);

  @override
  Future<bool> getIsGuest() async =>
      authenticationLocalDataSource.getIsGuest();

  @override
  Future<bool> clearPreferences() async =>
      authenticationLocalDataSource.clearPreferences();

  @override
  Future<void> updateAuthenticationHeader(String? accessToken) async =>
      authenticationRemoteDataSource.updateAuthorizationHeader(accessToken);

  @override
  Future<String> getUserId() async => authenticationLocalDataSource.getUserId();

  @override
  Future<void> storeUserId(String? userId) async =>
      authenticationLocalDataSource.storeUserId(userId);

  @override
  Future<String> getAccessToken() async =>
      authenticationLocalDataSource.getAccessToken();

  @override
  Future<void> storeAccessToken(String? accessToken) async =>
      authenticationLocalDataSource.storeAccessToken(accessToken);

  @override
  Future<bool> removeAccessToken() async =>
      authenticationLocalDataSource.removeAccessToken();

  @override
  Future<bool> removeUserId() async =>
      authenticationLocalDataSource.removeUserId();

  @override
  Future<UserModel> getUser() async {
    final String? data = await authenticationLocalDataSource.getUser();
    return UserModel.fromJsonString(data);
  }


  Future<void> _storeUserDataToLocalStorage(
    UserModel model,
  ) async {
    if (model.id != null) {
      unawaited(storeIsGuest(false));
      unawaited(storeUserId(model.id));
    }
    if (model.accessToken != null) {
      unawaited(storeAccessToken(model.accessToken));
      unawaited(updateAuthenticationHeader(model.accessToken));
    }
    // if (model.questionnaire != null) {
    //   final questionnaireModel =
    //   QuestionnaireModel.fromEntity(model.questionnaire);
    //   unawaited(authenticationLocalDataSource
    //       .storeUserQuestionnaireData(questionnaireModel.toJsonString()));
    // }
    unawaited(
      authenticationLocalDataSource.storeUser(model.toJsonString()),
    );
  }
}
