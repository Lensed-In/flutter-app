import 'package:flutter/foundation.dart';

class PlatformException implements Exception {
  final String message;

  PlatformException({required this.message});
}
