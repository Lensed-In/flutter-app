import 'dart:convert';
import 'dart:io';

/// Creates the environment specific part file `.env.dart`
/// having all values maintained in `config.json` and the environment variables.
/// If specified environment variables, has same keys present in `config.json`,
/// will be replaced at build time in CI.
///
/// Usage:  dart tools/env.dart
Future<void> main() async {
  // Read config.json file  with all app related entries,
  // present in tools folder at root of project.
  // Any new app related constant needs to be added to config.json
  final Map<String, dynamic> config = {};
  final String buildVariant = Platform.environment['buildVariant'] ?? 'dev';
  final file = File('tools/config.json');
  final String content = file.readAsStringSync();
  final Map<String, dynamic> appConfig = json.decode(content);
  config['buildVariant'] = buildVariant;

  // Read the keys from system level environment variables
  // and from config environment variables.
  appConfig['environmentVariables'].forEach(
    (key, value) => config[key] = Platform.environment[key] ?? value,
  );
  appConfig[buildVariant].forEach((key, value) => config[key] = value);

  // Write all the resolved variables to part file `.env.dart`.
  const filename = 'lib/.build_config.dart';
  await File(filename).writeAsString(
    'final Map<String, dynamic> environment = ${json.encode(config)};',
  );
}
