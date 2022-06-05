import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile/common/constants/logger_constants.dart';
import 'package:profile/common/exceptions/server_exception.dart';
import 'package:profile/presentation/widgets/toast/toast_utils.dart';

bool isLightTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light;
}

Future<String> _loadFromAsset(String? jsonFilePath) async {
  return await rootBundle
      .loadString(jsonFilePath ?? "assets/json/chapters.json");
}

dynamic parseJson({String? jsonFilePath}) async {
  String jsonString = await _loadFromAsset(jsonFilePath);
  return jsonDecode(jsonString);
}

void handleApiError(Object e, StackTrace stacktrace) {
  LOG.error(e, stacktrace);
  var error = 'Something went wrong!';
  if (e is ServerException) {
    error = e.message;
  }
  showErrorToast(error);
}

List<String> fromJsonToStringList(Iterable? iterable) {
  return iterable != null ? List<String>.from(iterable) : [];
}
