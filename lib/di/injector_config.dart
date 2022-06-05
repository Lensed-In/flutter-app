import 'package:profile/common/local_preferences/local_preferences.dart';
import 'package:profile/data/local_data_source/authentication_local_data_source.dart';
import 'package:profile/data/remote_data_sources/authentication_remote_data_source.dart';
import 'package:profile/data/remote_data_sources/course_remote_data_source.dart';
import 'package:profile/data/remote_data_sources/home_screen_remote_data_source.dart';
import 'package:profile/data/remote_data_sources/learn_remote_data_source.dart';
import 'package:profile/data/remote_data_sources/preference_remote_data_source.dart';
import 'package:profile/data/remote_data_sources/user_profile_remote_data_source.dart';
import 'package:profile/data/respositories/authentication_repository_impl.dart';
import 'package:profile/data/respositories/course_repository_impl.dart';
import 'package:profile/data/respositories/home_screen_repository_impl.dart';
import 'package:profile/data/respositories/learn_repository_impl.dart';
import 'package:profile/data/respositories/preference_repository_impl.dart';
import 'package:profile/data/respositories/user_profile_repository_impl.dart';
import 'package:profile/domain/repositories/authentication_repository.dart';
import 'package:profile/domain/repositories/course_repository.dart';
import 'package:profile/domain/repositories/home_screen_repository.dart';
import 'package:profile/domain/repositories/learn_repository.dart';
import 'package:profile/domain/repositories/preference_repository.dart';
import 'package:profile/domain/repositories/user_profile_repository.dart';
import 'package:profile/domain/usecases/authentication_use_case.dart';
import 'package:profile/domain/usecases/course_use_case.dart';
import 'package:profile/domain/usecases/home_screen_use_case.dart';
import 'package:profile/domain/usecases/user_profile_use_case.dart';
import 'package:profile/networking/api/api_client.dart';
import 'package:profile/networking/api/graph_ql_client.dart';
import 'package:profile/presentation/common_blocs/authentication_bloc/authentication_bloc.dart';
import 'package:profile/presentation/common_blocs/loader_bloc/loader_bloc.dart';
import 'package:profile/presentation/journey/home/bloc/home_screen_bloc.dart';
import 'package:profile/presentation/journey/main/bloc/main_screen_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:profile/presentation/journey/user_profile/bloc/user_profile_bloc.dart';

part 'injector_config.g.dart';

abstract class InjectorConfig {
  static late KiwiContainer container;

  static void setup() {
    container = KiwiContainer();
    final injector = _$InjectorConfig();
    // ignore: cascade_invocations
    injector._configure();
  }

  static final resolve = container.resolve;

  void _configure() {
    _configureBlocs();
    _configureUseCases();
    _configureRepositories();
    _configureLocalDataSources();
    _configureRemoteDataSources();
    _configureCommon();
  }

  /// ============ Register Blocs ============
  @Register.singleton(LoaderBloc)
  @Register.singleton(AuthenticationBloc)
  @Register.factory(MainScreenBloc)
  @Register.factory(HomeScreenBloc)
  @Register.factory(UserProfileBloc)
  void _configureBlocs();

  /// ============ Register UseCases ============
  @Register.factory(AuthenticationUseCase)
  @Register.factory(HomeScreenUseCase)
  @Register.factory(CourseUseCase)
  @Register.factory(UserProfileUseCase)
  void _configureUseCases();

  /// ============ Register Repositories ============
  @Register.factory(
    AuthenticationRepository,
    from: AuthenticationRepositoryImpl,
  )
  @Register.factory(
    PreferenceRepository,
    from: PreferenceRepositoryImpl,
  )
  @Register.factory(
    HomeScreenRepository,
    from: HomeScreenRepositoryImpl,
  )
  @Register.factory(
    LearnRepository,
    from: LearnRepositoryImpl,
  )
  @Register.factory(
    CourseRepository,
    from: CourseRepositoryImpl,
  )
  @Register.factory(
    UserProfileRepository,
    from: UserProfileRepositoryImpl,
  )
  void _configureRepositories();


  /// ============ Register LocalDataSources ============
  @Register.factory(AuthenticationLocalDataSource)
  void _configureLocalDataSources();


  /// ============ Register RemoteDataSources ============
  @Register.factory(AuthenticationRemoteDataSource)
  @Register.factory(PreferenceRemoteDataSource)
  @Register.factory(HomeScreenRemoteDataSource)
  @Register.factory(LearnRemoteDataSource)
  @Register.factory(CourseRemoteDataSource)
  @Register.factory(UserProfileRemoteDataSource)
  void _configureRemoteDataSources();


  /// ============ Register Common Classes ============
  @Register.singleton(ApiClient)
  @Register.singleton(AppGraphQLClient)
  @Register.singleton(LocalPreferences)
  void _configureCommon();
}
