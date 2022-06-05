import 'package:flutter_bloc/flutter_bloc.dart';

import 'loader_event.dart';
import 'loader_state.dart';

class LoaderBloc extends Bloc<LoaderEvent, LoaderState> {
  LoaderBloc() : super(Dismissed()) {
    on<ShowLoaderEvent>(_processShowLoaderEvent);
    on<DismissLoaderEvent>(_processDismissLoaderEvent);
  }

  void _processShowLoaderEvent(
      ShowLoaderEvent event, Emitter<LoaderState> emit) async {
    emit(Loading(isTopLoading: event.isTopLoader));
  }

  void _processDismissLoaderEvent(
      DismissLoaderEvent event, Emitter<LoaderState> emit) async {
    emit(Dismissed());
  }
}
