import 'package:profile/common/event_bus/abstract_event.dart';
import 'package:profile/common/event_bus/subscriber.dart';
import 'package:profile/presentation/common_blocs/authentication_bloc/authentication_bloc.dart';
import 'package:profile/presentation/common_blocs/authentication_bloc/authentication_event.dart';

part 'authentication_events.dart';

class AuthenticationSubscriber
    extends Subscriber<AuthenticationSubscriberEvent> {
  final AuthenticationBloc authenticationBloc;

  AuthenticationSubscriber({required this.authenticationBloc});

  @override
  void onEvent(AuthenticationSubscriberEvent event) {
    switch (event.runtimeType) {
      case LogoutSubscriberEvent:
        authenticationBloc.add(Logout());
        break;
    }
  }
}
