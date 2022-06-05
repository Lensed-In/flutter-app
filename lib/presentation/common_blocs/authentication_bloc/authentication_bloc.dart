import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pedantic/pedantic.dart';
import 'package:profile/common/event_bus/event_bus.dart';
import 'package:profile/common/event_bus/subscriber.dart';
import 'package:profile/common/util/injector_utils.dart';
import 'package:profile/domain/usecases/authentication_use_case.dart';
import 'package:profile/presentation/common_blocs/authentication_bloc/authentication_event.dart';
import 'package:profile/presentation/common_blocs/authentication_bloc/authentication_state.dart';
import 'package:profile/presentation/event_bus/authentication/authentication_subscriber.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  late Subscriber<AuthenticationSubscriberEvent> _authenticationSubscriber;
  AuthenticationUseCase authenticationUseCase;

  AuthenticationBloc({required this.authenticationUseCase})
      : super(Uninitialized()) {
    _authenticationSubscriber =
        AuthenticationSubscriber(authenticationBloc: this);
    EventBus.subscribe(_authenticationSubscriber);

    on<UpdateAccessToken>(_processUpdateAccessTokenEvent);
    on<Login>(_processLoginEvent);
    on<Logout>(_processLogOutEvent);
    on<UpdateUser>(_processUserUpdate);
  }

  @override
  Future<void> close() async {
    EventBus.unsubscribe(_authenticationSubscriber);
    await super.close();
  }

  void _processLogOutEvent(Logout event, Emitter<AuthenticationState> emit) async {
    closeAllSingletonBlocs();

    unawaited(authenticationUseCase.clearPreferences());
    emit(LoggedOutState());
  }

  void _processUpdateAccessTokenEvent(
      UpdateAccessToken event, Emitter<AuthenticationState> emit) async {
    unawaited(authenticationUseCase.updateAuthHeaderWithAccessToken(event.accessToken));

    emit(AccessTokenUpdateState(user: state.user));
  }

  void _processLoginEvent(Login event, Emitter<AuthenticationState> emit) async {
    emit( LoggedInState(user: event.user));
  }

  void _processUserUpdate(
      UpdateUser event, Emitter<AuthenticationState> emit) async {
    await authenticationUseCase.storeUser(event.user);
    emit(UserDetailsUpdatedState(user: event.user));
  }

  void _processConnectWalletEvent(Login event, Emitter<AuthenticationState> emit) async {

    emit( LoggedInState(user: event.user));
  }
}
