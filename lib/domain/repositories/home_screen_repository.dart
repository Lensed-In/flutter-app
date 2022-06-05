
import 'package:profile/domain/entities/home_response_entity.dart';

abstract class HomeScreenRepository {

  Future<HomeResponseEntity> fetchHomeScreenData(String userId);

  Future<dynamic> fetchFeedData(String userId);

  Future<dynamic> fetchJobs();

  Future<dynamic> postPublications(String request);

  Future<dynamic> lensLogin(dynamic request);
}
