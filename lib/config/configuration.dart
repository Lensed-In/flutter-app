import 'package:flutter/foundation.dart';

import 'build_variant_enum.dart';

class Configuration {
  static String? _buildVariant;
  static String? _apiHostUrl;
  static String? _deepLinkScheme;
  static String? _deepLinkHost;
  static String? _s3AssetsBaseUrl;

  static bool? _shouldEnableAllLogs;
  static bool? _shouldEnableCrashlytics;

  void setConfigurationValues(Map<String, dynamic> config) {
    _shouldEnableAllLogs = config['shouldEnableAllLogs'] ?? false;
    _shouldEnableCrashlytics = config['shouldEnableCrashlytics'] ?? true;
    _apiHostUrl = config['apiHostUrl'];
    _deepLinkScheme = config['deepLinkScheme'];
    _deepLinkHost = config['deepLinkHost'];
    _s3AssetsBaseUrl = config['s3AssetsBaseUrl'];
  }

  static String get apiHostUrl => _apiHostUrl ?? '';

  static String? get deepLinkScheme => _deepLinkScheme;

  static String? get deepLinkHost => _deepLinkHost;

  static String? get s3AssetsBaseUrl => _s3AssetsBaseUrl;

  static bool? get shouldEnableAllLogs => _shouldEnableAllLogs;

  static bool? get shouldEnableCrashlytics => _shouldEnableCrashlytics;

  static bool? get isDev => _buildVariant == describeEnum(BuildVariant.dev);

  static bool? get isProd => _buildVariant == describeEnum(BuildVariant.prod);
}
