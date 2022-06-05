
abstract class PreferenceRepository {

  Future<List<String>> updateInterests(List<String> interests);

  Future<List<String>> updateRoles(List<String> roles);

  Future<List<String>> updatePurposes(List<String> purposes);

}
