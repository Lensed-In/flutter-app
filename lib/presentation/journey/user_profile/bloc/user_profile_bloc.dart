import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:profile/common/util/app_utils.dart';
import 'package:profile/domain/entities/course_basic_info_entity.dart';
import 'package:profile/domain/entities/user_entity.dart';
import 'package:profile/domain/usecases/user_profile_use_case.dart';
import 'package:profile/presentation/common_blocs/loader_bloc/loader_bloc.dart';
import 'package:profile/presentation/common_blocs/loader_bloc/loader_event.dart';

part 'user_profile_event.dart';

part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final LoaderBloc loaderBloc;
  final UserProfileUseCase userProfileUseCase;

  UserProfileBloc({
    required this.loaderBloc,
    required this.userProfileUseCase,
  }) : super(UserProfileInitial()) {
    on<FetchUserInfoEvent>(_processFetchUserInfoEvent);
    on<FetchUserCoursesEvent>(_processFetchUserCoursesEvent);
  }

  void _processFetchUserInfoEvent(
      FetchUserInfoEvent event,
      Emitter<UserProfileState> emit,
      ) async {
    try {
      loaderBloc.add(ShowLoaderEvent());

      UserEntity response = await userProfileUseCase.fetchUserInfo('');
      emit(FetchUserInfoSuccessState(state, user: response));
    } catch (e, stacktrace) {
      handleApiError(e, stacktrace);
      emit(FetchUserInfoFailedState(state));
    }
    loaderBloc.add(DismissLoaderEvent());
  }

  void _processFetchUserCoursesEvent(
    FetchUserCoursesEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    try {
      loaderBloc.add(ShowLoaderEvent());

      List<CourseBasicInfoEntity> response =
          await userProfileUseCase.fetchUserCourses('');
      emit(FetchUserCoursesSuccessState(state, courses: response));
    } catch (e, stacktrace) {
      handleApiError(e, stacktrace);
      emit(FetchUserCoursesFailedState(state));
    }
    loaderBloc.add(DismissLoaderEvent());
  }
}
