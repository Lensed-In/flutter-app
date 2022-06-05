import 'package:profile/common/util/logger_utils.dart';
import 'package:logger/logger.dart';

LoggerUtil LOG = LoggerUtil(
  printer: PrettyPrinter(
    methodCount: 0,
    lineLength: 150,
    printTime: true,
    printEmojis: false,
  ),
  level: LoggerUtil.logLevel(),
);
