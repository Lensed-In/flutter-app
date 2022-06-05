import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/di/injector.dart';
import 'package:profile/presentation/common_blocs/authentication_bloc/authentication_bloc.dart';
import 'package:profile/presentation/common_blocs/loader_bloc/loader_bloc.dart';

List<BlocProvider> getAppStartupBlocProviders(
  GlobalKey<NavigatorState> navigatorStateGlobalKey,
) =>
    [
      BlocProvider<LoaderBloc>(
        create: (BuildContext context) => Injector.resolve<LoaderBloc>(),
      ),
      BlocProvider<AuthenticationBloc>(
        create: (BuildContext context) =>
            Injector.resolve<AuthenticationBloc>(),
      ),
    ];
