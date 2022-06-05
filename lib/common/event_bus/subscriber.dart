import 'package:profile/common/event_bus/abstract_event.dart';

// ignore: one_member_abstracts
abstract class Subscriber<T extends Event> {
  void onEvent(T event);
}
