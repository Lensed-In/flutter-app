import 'package:profile/common/constants/json_keys_constants.dart';
import 'package:profile/data/models/login_request_model.dart';
import 'package:profile/data/models/sign_up_request_model.dart';
import 'package:profile/data/models/user_model.dart';
import 'package:profile/networking/api/api_client.dart';
import 'package:profile/networking/api/api_endpoints.dart';
import 'package:profile/networking/api/api_params_constants.dart';
import 'package:profile/networking/api/graph_ql_client.dart';
import 'package:profile/networking/http/http_util.dart';

class AuthenticationRemoteDataSource {
  final ApiClient apiClient;

  AuthenticationRemoteDataSource({required this.apiClient});

  Future<UserModel> loginUser(LoginRequestModel model) async {
    final response = await apiClient.post(ApiEndpoints.login, model.toJson());
    return UserModel.fromJson(response[JsonKeysConstants.data]);
  }

  Future<UserModel> signUpUser(SignUpRequestModel model) async {
    final response = await apiClient.post(ApiEndpoints.signUp, model.toJson());
    return UserModel.fromJson(response[JsonKeysConstants.data]);
  }

  Future<bool> isEmailExist(String email) async {
    final path = HttpUtil.formPathWithQueryParams(
      ApiEndpoints.isEmailExist,
      paramsMap: {ApiParamsConstants.email: email},
    );

    final response = await apiClient.get(path);
    return response[JsonKeysConstants.data] != null;
  }

  Future<dynamic> requestToSendOtp(Map<String, String> bodyMap) async {
    final response = await apiClient.post(ApiEndpoints.sendOtp, bodyMap);
    return response;
  }

  Future<dynamic> verifyOtp(Map<String, String> bodyMap) async {
    final response = await apiClient.post(ApiEndpoints.verifyOtp, bodyMap);
    return response;
  }

  Future<void> updateAuthorizationHeader(String? accessToken) async {
    apiClient.updateAuthorizationHeader(accessToken);
  }

  Future<dynamic> requestToSendOtpForResetPassword(
      Map<String, String> bodyMap) async {
    final response =
        await apiClient.post(ApiEndpoints.sendOtp, bodyMap);
    return response;
  }

  Future<dynamic> requestToResetPassword(Map<String, String> bodyMap) async {
    final response = await apiClient.post(ApiEndpoints.resetPassword, bodyMap);
    return response;
  }

  Future<void> changePassword(Map<String, String> bodyMap) =>
      apiClient.post(ApiEndpoints.changePassword, bodyMap);
}
