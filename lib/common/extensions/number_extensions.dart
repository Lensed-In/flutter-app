import 'dart:math';

import 'package:intl/intl.dart';

extension DoubleExtenstion on double {
  double toPrecision(int fractionDigits) {
    final num mod = pow(10, fractionDigits.toDouble());
    return (this * mod).round().toDouble() / mod;
  }

  ///truncates to specified digits after decimals
  ///eg 123.455566677.truncateToPrecision(2) => 123.45
  double truncateToPrecision(int digits) {
    final data = '$this'.split('.');
    if (data.length == 1) {
      return this;
    } else {
      data[1] =
          data[1].length <= digits ? data[1] : data[1].substring(0, digits);
    }
    return double.tryParse(data.join('.')) ?? this;
  }

  double mToKm() => this * 0.001;

  double cmToM() => this * 0.01;

  double kmToM() => this * 1000;

  double mToCM() => this * 100;

  double secToMin() => this / Duration.secondsPerMinute;

  double minToSec() => this * Duration.secondsPerMinute;

  ///converts degree to radians
  double toRad() => this * pi / 180;

  ///converts radians to degree
  double toDeg() => this * 180 / pi;

  double add(double n) {
    return this + n;
  }

  double percentage(double n) => (this / 100) * n;
}

extension IntExtension on int {
  ///Converts number(s) to compact form
  ///1,000 - 1K, 10,000 - 10K, 1,000,000 - 1M
  String compact() =>
      NumberFormat.compact(locale: 'en').format(this).toLowerCase();

  ///hrs:mins
  String formattedTimeInHrsMins() {
    var seconds = this;
    final hours = seconds ~/ Duration.secondsPerHour;
    seconds -= hours * Duration.secondsPerHour;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;
    final List<String> tokens = [
      '$hours'.padLeft(2, '0'),
      '$minutes'.padLeft(2, '0')
    ];
    return tokens.join(':');
  }

  ///mins:secs
  String formattedTimeInMinsSecs() {
    var seconds = this;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;
    final List<String> tokens = [
      '$minutes'.padLeft(2, '0'),
      '$seconds'.padLeft(2, '0')
    ];
    return tokens.join(':');
  }

  ///mins
  String formattedTimeInMins() {
    final minutes = this ~/ Duration.secondsPerMinute;
    return '${minutes.toInt()}';
  }

  ///hrs:mins:secs
  String formattedTimeInHrsMinsSecs({bool isHoursOptional = false}) {
    int seconds = this;
    if (seconds != 0) {
      final hours = seconds ~/ Duration.secondsPerHour;
      seconds -= hours * Duration.secondsPerHour;
      final minutes = seconds ~/ Duration.secondsPerMinute;
      seconds -= minutes * Duration.secondsPerMinute;
      final List<String> tokens = [];
      if (hours != 0) {
        tokens.add('$hours'.padLeft(2, '0'));
      } else if (!isHoursOptional) {
        tokens.add('00');
      }
      tokens
        ..add('$minutes'.padLeft(2, '0'))
        ..add('$seconds'.padLeft(2, '0'));
      return tokens.join(':');
    }
    return '00:00:00';
  }

  int add(int? n) {
    if (n != null) {
      return this + n;
    }
    return this;
  }

  int millisToSec() => (this / Duration.millisecondsPerSecond).round();
}
