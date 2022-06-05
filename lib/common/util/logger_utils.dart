import 'package:logger/logger.dart';

class LoggerUtil extends Logger {
  LogPrinter printer;
  Level level;

  LoggerUtil({
    required this.printer,
    required this.level,
  }) : super(
          printer: printer,
          level: level,
        );

  void error(dynamic error, StackTrace stackTrace, {String? message}) {
    e('[ERROR] $message', error, stackTrace);
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }

  void warn(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      w('[WARN] $message', error, stackTrace);

  void info(dynamic message) => i('[INFO] $message');

  void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      d('[DEBUG] $message', error, stackTrace);

  void verbose(dynamic message) => v('[VERBOSE]\n$message');

  static Level logLevel({bool replicateNonTestEnv = false}) => Level.verbose;
}
