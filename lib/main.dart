import 'dart:async';

import 'package:profile/common/local_preferences/local_preferences.dart';
import 'package:profile/config/configuration.dart';
import 'package:profile/di/injector.dart';
import 'package:profile/di/injector_config.dart';
import 'package:profile/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '.build_config.dart' as build_config;

Future<void> main() async {
  Configuration().setConfigurationValues(build_config.environment);
  WidgetsFlutterBinding.ensureInitialized();
  InjectorConfig.setup();
  unawaited(Injector.resolve<LocalPreferences>().init());
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  runZoned(() => runApp(const App()));
}
