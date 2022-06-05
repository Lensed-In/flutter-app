import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:profile/common/constants/json_keys_constants.dart';
import 'package:profile/common/util/app_utils.dart';
import 'package:profile/data/models/home_response_model.dart';
import 'package:profile/networking/api/api_client.dart';
import 'package:profile/networking/api/graph_ql_client.dart';
import 'package:profile/networking/api/graph_ql_query.dart';

class HomeScreenRemoteDataSource {
  final ApiClient apiClient;
  final AppGraphQLClient appGraphQLClient;

  HomeScreenRemoteDataSource({required this.apiClient, required this.appGraphQLClient});

  Future<HomeResponseModel> fetchHomeScreenData(String userId) async {
    // final response = await apiClient.get(ApiEndpoints.fetchHomeScreenData);
    final response = await parseJson(jsonFilePath: "assets/json/home_response.json");
    return HomeResponseModel.fromJson(response[JsonKeysConstants.data]);
  }

  Future<dynamic> fetchExplorePublications(String userId) async {
    final response = await appGraphQLClient.query(QueryOptions(document: gql(explorePublications)));

    return response.data;
  }

  Future<dynamic> postPublications(String request) async {
    final response = await appGraphQLClient.mutate(MutationOptions(document: gql(createPostTypedData(request))));
    
    print(response);

    return response.data;
  }

  Future<dynamic> lensLogin(String request) async {
    final response = await appGraphQLClient.mutate(MutationOptions(document: gql(authentication(request))));

    print(response);

    return response.data;
  }

}
