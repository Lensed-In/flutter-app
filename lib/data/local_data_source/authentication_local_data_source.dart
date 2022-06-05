import 'package:profile/common/constants/shared_preference_keys_constant.dart';
import 'package:profile/common/local_preferences/local_preferences.dart';

class AuthenticationLocalDataSource {
  final LocalPreferences localPreferences;

  AuthenticationLocalDataSource({required this.localPreferences});

  Future<void> storeIsGuest(bool? isGuest) async =>
      localPreferences.set(SharedPreferenceKeys.isGuest, isGuest);

  Future<bool> getIsGuest() async =>
      localPreferences.get(SharedPreferenceKeys.isGuest) ?? false;

  Future<bool> removeIsGuest() async =>
      localPreferences.remove(SharedPreferenceKeys.isGuest);

  Future<void> storeUserId(String? userId) async =>
      localPreferences.set(SharedPreferenceKeys.loggedInUserId, userId);

  Future<String> getUserId() async =>
      localPreferences.get(SharedPreferenceKeys.loggedInUserId) ?? '';

  Future<bool> removeUserId() async =>
      localPreferences.remove(SharedPreferenceKeys.loggedInUserId);

  Future<void> storeAccessToken(String? accessToken) async =>
      localPreferences.set(SharedPreferenceKeys.accessToken, accessToken);

  Future<String> getAccessToken() async =>
      localPreferences.get(SharedPreferenceKeys.accessToken) ?? '';

  Future<bool> removeAccessToken() async =>
      localPreferences.remove(SharedPreferenceKeys.accessToken);

  Future<void> storeUserQuestionnaireData(String questionnaireJson) async =>
      localPreferences.set(
        SharedPreferenceKeys.questionnaireData,
        questionnaireJson,
      );

  Future<void> storeUser(String user) async =>
      localPreferences.set(SharedPreferenceKeys.user, user);

  Future<String?> getUser() async =>
      localPreferences.get(SharedPreferenceKeys.user);

  Future<String> getQuestionnaireJsonData() async =>
      localPreferences.get(SharedPreferenceKeys.questionnaireData);

  Future<bool> removeUserQuestionnaireData() async =>
      localPreferences.remove(SharedPreferenceKeys.questionnaireData);

  Future<bool> clearPreferences() async => localPreferences.clearAll();
}
