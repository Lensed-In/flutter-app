import 'package:profile/data/remote_data_sources/preference_remote_data_source.dart';
import 'package:profile/domain/repositories/preference_repository.dart';

class PreferenceRepositoryImpl implements PreferenceRepository {
  final PreferenceRemoteDataSource preferenceRemoteDataSource;

  PreferenceRepositoryImpl({
    required this.preferenceRemoteDataSource
  });

  @override
  Future<List<String>> updateInterests(List<String> interests) async {
    final response =
        await preferenceRemoteDataSource.updateInterests(interests);
    return response;
  }

  @override
  Future<List<String>> updateRoles(List<String> interests) async {
    final response = await preferenceRemoteDataSource.updateRoles(interests);
    return response;
  }

  @override
  Future<List<String>> updatePurposes(List<String> interests) async {
    final response = await preferenceRemoteDataSource.updatePurposes(interests);
    return response;
  }

}
