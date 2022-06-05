import 'package:profile/domain/entities/home_response_entity.dart';
import 'package:profile/domain/repositories/home_screen_repository.dart';

class HomeScreenUseCase {
  final HomeScreenRepository homeScreenRepository;

  HomeScreenUseCase({
    required this.homeScreenRepository,
  });

  Future<HomeResponseEntity> fetchHomeScreenData(String userId) async =>
      homeScreenRepository.fetchHomeScreenData(userId);


  Future<dynamic> fetchFeedData(String userId) async =>
      homeScreenRepository.fetchFeedData(userId);

  Future<dynamic> fetchJobs() async =>
      homeScreenRepository.fetchJobs();

  Future<dynamic> postPublications(String request) async =>
      homeScreenRepository.postPublications(request);

  Future<dynamic> lensLogin(dynamic request) async =>
      homeScreenRepository.lensLogin(request);
}
