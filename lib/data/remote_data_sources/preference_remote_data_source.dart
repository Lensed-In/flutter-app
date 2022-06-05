import 'dart:convert';

import 'package:profile/common/constants/json_keys_constants.dart';
import 'package:profile/networking/api/api_client.dart';
import 'package:profile/networking/api/api_endpoints.dart';

class PreferenceRemoteDataSource {
  final ApiClient apiClient;

  PreferenceRemoteDataSource({required this.apiClient});

  Future<List<String>> updateInterests(List<String> interests) async {
    final response = await apiClient.post(
        ApiEndpoints.updateInterests, jsonEncode(interests));
    return jsonDecode(response[JsonKeysConstants.data]);
  }

  Future<List<String>> updateRoles(List<String> roles) async {
    final response =
        await apiClient.post(ApiEndpoints.updateRoles, jsonEncode(roles));
    return jsonDecode(response[JsonKeysConstants.data]);
  }

  Future<List<String>> updatePurposes(List<String> purposes) async {
    final response =
        await apiClient.post(ApiEndpoints.updatePurposes, jsonEncode(purposes));
    return jsonDecode(response[JsonKeysConstants.data]);
  }
}
