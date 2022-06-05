import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/common/constants/logger_constants.dart';
import 'package:profile/common/event_bus/abstract_event.dart';
import 'package:profile/common/event_bus/subscriber.dart';
import 'package:profile/di/injector.dart';

abstract class EventBus {
  EventBus._();

  static final Map<dynamic, List<Subscriber<dynamic>>> _subscribers = {};

  static void subscribe<T extends Event>(Subscriber<T> subscriber) {
    _subscribers.putIfAbsent(T, () {
      return [];
    });
    _subscribers[T]!.add(subscriber);
  }

  static void unsubscribe<T extends Event>(Subscriber<T> subscriber) {
    final List<Subscriber<dynamic>> list = _subscribers[T] ?? [];

    if (list.isEmpty) {
      LOG.warn('EventBus $T Queue is empty, '
          'no ${subscriber.runtimeType} subscriber');
    }

    if (list.remove(subscriber)) {
      if (list.isEmpty) {
        _subscribers.remove(T);
      }
    }
  }

  static void emit<T extends Event>(T event) {
    final List<Subscriber<dynamic>> queue = _subscribers[T] ?? [];

    if (queue.isEmpty) {
      LOG.warn('EventBus Failed to fire the $T event. '
          'Queue is empty, no subscriber');
    }
    for (final subscriber in queue) {
      try {
        subscriber.onEvent(event);
      } catch (error) {
        LOG.warn('Receive Event', error);
      }
    }
  }

  static void emitInitBloc<T extends Event, U extends Bloc>(
    T event, {
    bool isOnce = false,
    bool isSingleton = false,
  }) {
    List<Subscriber<dynamic>> queue = _subscribers[T] ?? [];
    Bloc? blocInstance;
    if (queue.isEmpty) {
      blocInstance = Injector.resolve<U>();
    }
    queue = _subscribers[T] ?? [];

    if (isOnce) {
      try {
        queue[0].onEvent(event);
      } catch (error) {
        LOG.warn(
            'EventBus $T Queue is empty, '
            '$U didn\'t subscribe $T event',
            error);
      }
    } else {
      for (final subscriber in queue) {
        try {
          subscriber.onEvent(event);
        } catch (error) {
          LOG.warn(
              'EventBus $T Queue is empty, '
              '$U didn\'t subscribe $T event',
              error);
        }
      }
    }

    if (!isSingleton) {
      blocInstance?.close();
    }
  }

  static void reset() {
    _subscribers.clear();
  }

  static Map<dynamic, List<Subscriber<dynamic>>> get getQueue => _subscribers;
}
