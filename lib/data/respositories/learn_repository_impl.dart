import 'package:profile/data/models/course_basic_info_model.dart';
import 'package:profile/data/remote_data_sources/learn_remote_data_source.dart';
import 'package:profile/domain/repositories/learn_repository.dart';

class LearnRepositoryImpl implements LearnRepository {
  final LearnRemoteDataSource learnRemoteDataSource;

  LearnRepositoryImpl({required this.learnRemoteDataSource});

  @override
  Future<List<CourseBasicInfoModel>> fetchLearnScreenData(String userId) async {
    final response = await learnRemoteDataSource.fetchLearnScreenData(userId);
    return response;
  }
}
