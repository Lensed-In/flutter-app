import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/presentation/app/route_constants.dart';
import 'package:profile/presentation/common_blocs/authentication_bloc/authentication_bloc.dart';
import 'package:profile/presentation/common_blocs/authentication_bloc/authentication_state.dart';

List<BlocListener> getAppStartupBlocListeners(
  GlobalKey<NavigatorState> navigatorStateGlobalKey,
) =>
    [
      BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) => _processAuthenticationState(
            context, state, navigatorStateGlobalKey),
      )
    ];

void _processAuthenticationState(
    BuildContext context,
    AuthenticationState state,
    GlobalKey<NavigatorState> navigatorStateGlobalKey) {
  switch (state.runtimeType) {
    case LoggedOutState:
      _navigateToOfferingScreen(navigatorStateGlobalKey);
      break;
  }
}

void _navigateToOfferingScreen(
    GlobalKey<NavigatorState> navigatorStateGlobalKey) {

  navigatorStateGlobalKey.currentState
      ?.pushNamedAndRemoveUntil(RouteConstants.welcome1, (_) => false);

  // navigatorStateGlobalKey.currentState.pushNamed(RouteConstants.login);
}