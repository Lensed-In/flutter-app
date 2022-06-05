import 'package:pedantic/pedantic.dart';
import 'package:profile/data/local_data_source/authentication_local_data_source.dart';
import 'package:profile/data/models/login_request_model.dart';
import 'package:profile/data/models/sign_up_request_model.dart';
import 'package:profile/data/models/user_model.dart';
import 'package:profile/data/remote_data_sources/authentication_remote_data_source.dart';
import 'package:profile/data/remote_data_sources/home_screen_remote_data_source.dart';
import 'package:profile/domain/entities/home_response_entity.dart';
import 'package:profile/domain/entities/login_request_entity.dart';
import 'package:profile/domain/entities/sign_up_request_entity.dart';
import 'package:profile/domain/entities/user_entity.dart';
import 'package:profile/domain/repositories/authentication_repository.dart';
import 'package:profile/domain/repositories/home_screen_repository.dart';

class HomeScreenRepositoryImpl implements HomeScreenRepository {
  final HomeScreenRemoteDataSource homeScreenRemoteDataSource;

  HomeScreenRepositoryImpl({
    required this.homeScreenRemoteDataSource,
  });

  @override
  Future<HomeResponseEntity> fetchHomeScreenData(String userId) async {
    final response = await homeScreenRemoteDataSource
        .fetchHomeScreenData(userId);
    return response;
  }

  @override
  Future<dynamic> fetchFeedData(String userId) async {
    final response = homeScreenRemoteDataSource.fetchExplorePublications(userId);
    return response;
  }

  @override
  Future<dynamic> fetchJobs() async {
    final response = homeScreenRemoteDataSource.fetchJobs();
    return response;
  }

  @override
  Future<dynamic> postPublications(String request) async {
    final response = homeScreenRemoteDataSource.postPublications(request);
    return response;
  }

  @override
  Future<dynamic> lensLogin(dynamic request) async {
    final response = homeScreenRemoteDataSource.lensLogin(request);
    return response;
  }

}
