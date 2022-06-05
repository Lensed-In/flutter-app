part of 'authentication_subscriber.dart';

class AuthenticationSubscriberEvent extends Event {}

class LogoutSubscriberEvent extends AuthenticationSubscriberEvent {
  LogoutSubscriberEvent();
}
