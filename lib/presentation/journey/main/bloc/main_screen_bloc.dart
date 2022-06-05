import 'package:bloc/bloc.dart';
import 'package:profile/common/event_bus/event_bus.dart';
import 'package:profile/common/util/app_utils.dart';
import 'package:profile/domain/entities/user_entity.dart';
import 'package:profile/domain/usecases/authentication_use_case.dart';
import 'package:profile/presentation/event_bus/authentication/authentication_subscriber.dart';
import 'package:profile/presentation/journey/main/main_constants.dart';
import 'package:profile/presentation/widgets/toast/toast_utils.dart';

part 'main_screen_event.dart';

part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final AuthenticationUseCase authenticationUseCase;

  MainScreenBloc({required this.authenticationUseCase})
      : super(MainScreenInitial()) {
    on<ChangePageIndexEvent>(_processChangePageIndexEvent);
    on<MainScreenLogoutEvent>(_processMainScreenLogoutEvent);
    on<LoadUserEvent>(_processLoadUserEvent);
  }

  void _processChangePageIndexEvent(
    ChangePageIndexEvent event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(ChangedPageIndexState(state, index: event.index));
  }

  void _processMainScreenLogoutEvent(
    MainScreenLogoutEvent event,
    Emitter<MainScreenState> emit,
  ) async {
    try {
      EventBus.emit<AuthenticationSubscriberEvent>(LogoutSubscriberEvent());
      emit(MainScreenLoggedOutState(state));
      showSuccessToast('Logged out!');
    } catch (error) {
      showErrorToast('Something went wrong!');
    }
  }

  void _processLoadUserEvent(
    LoadUserEvent event,
    Emitter<MainScreenState> emit,
  ) async {
    try {
      bool isGuest = await authenticationUseCase.getIsGuest();
      print('isGuest: $isGuest');
      UserEntity response = await authenticationUseCase.getUser();
      emit(LoadUserEventSuccessState(state, isGuest: isGuest, user: response));
    } catch (e, stacktrace) {
      handleApiError(e, stacktrace);
      emit(LoadUserEventFailedState(state));
    }
  }
}
