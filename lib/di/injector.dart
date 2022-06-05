import 'package:kiwi/kiwi.dart';

abstract class Injector {
  static KiwiContainer container = KiwiContainer();
  static final resolve = container.resolve;
}
