import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  late SharedPreferences sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> set(String key, dynamic value) {
    assert(
      value is bool || value is double || value is int || value is String,
      'Unsupported type',
    );

    final Map<Type, Function> typeResolvers = {
      bool: sharedPreferences.setBool,
      double: sharedPreferences.setDouble,
      int: sharedPreferences.setInt,
      String: sharedPreferences.setString,
    };

    return typeResolvers[value.runtimeType]!(key, value);
  }

  dynamic get(String key) => sharedPreferences.get(key);

  bool contains(String key) => sharedPreferences.containsKey(key);

  Future<bool> remove(String key) => sharedPreferences.remove(key);

  Future<bool> clearAll() => sharedPreferences.clear();
}
