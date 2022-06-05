// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$InjectorConfig extends InjectorConfig {
  @override
  void _configureBlocs() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => LoaderBloc())
      ..registerSingleton((c) =>
          AuthenticationBloc(authenticationUseCase: c<AuthenticationUseCase>()))
      ..registerFactory((c) =>
          MainScreenBloc(authenticationUseCase: c<AuthenticationUseCase>()))
      ..registerFactory((c) => HomeScreenBloc(
          loaderBloc: c<LoaderBloc>(),
          homeScreenUseCase: c<HomeScreenUseCase>()))
      ..registerFactory((c) => UserProfileBloc(
          loaderBloc: c<LoaderBloc>(),
          userProfileUseCase: c<UserProfileUseCase>()));
  }

  @override
  void _configureUseCases() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => AuthenticationUseCase(
          authenticationRepository: c<AuthenticationRepository>()))
      ..registerFactory((c) =>
          HomeScreenUseCase(homeScreenRepository: c<HomeScreenRepository>()))
      ..registerFactory(
          (c) => CourseUseCase(courseRepository: c<CourseRepository>()))
      ..registerFactory((c) => UserProfileUseCase(
          userProfileRepository: c<UserProfileRepository>()));
  }

  @override
  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<AuthenticationRepository>((c) =>
          AuthenticationRepositoryImpl(
              authenticationRemoteDataSource:
                  c<AuthenticationRemoteDataSource>(),
              authenticationLocalDataSource:
                  c<AuthenticationLocalDataSource>()))
      ..registerFactory<PreferenceRepository>((c) => PreferenceRepositoryImpl(
          preferenceRemoteDataSource: c<PreferenceRemoteDataSource>()))
      ..registerFactory<HomeScreenRepository>((c) => HomeScreenRepositoryImpl(
          homeScreenRemoteDataSource: c<HomeScreenRemoteDataSource>()))
      ..registerFactory<LearnRepository>((c) => LearnRepositoryImpl(
          learnRemoteDataSource: c<LearnRemoteDataSource>()))
      ..registerFactory<CourseRepository>((c) => CourseRepositoryImpl(
          courseRemoteDataSource: c<CourseRemoteDataSource>()))
      ..registerFactory<UserProfileRepository>((c) => UserProfileRepositoryImpl(
          userProfileRemoteDataSource: c<UserProfileRemoteDataSource>()));
  }

  @override
  void _configureLocalDataSources() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) =>
        AuthenticationLocalDataSource(localPreferences: c<LocalPreferences>()));
  }

  @override
  void _configureRemoteDataSources() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory(
          (c) => AuthenticationRemoteDataSource(apiClient: c<ApiClient>()))
      ..registerFactory(
          (c) => PreferenceRemoteDataSource(apiClient: c<ApiClient>()))
      ..registerFactory((c) => HomeScreenRemoteDataSource(
          apiClient: c<ApiClient>(), appGraphQLClient: c<AppGraphQLClient>()))
      ..registerFactory((c) => LearnRemoteDataSource(apiClient: c<ApiClient>()))
      ..registerFactory(
          (c) => CourseRemoteDataSource(apiClient: c<ApiClient>()))
      ..registerFactory(
          (c) => UserProfileRemoteDataSource(apiClient: c<ApiClient>()));
  }

  @override
  void _configureCommon() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => ApiClient())
      ..registerSingleton((c) => AppGraphQLClient())
      ..registerSingleton((c) => LocalPreferences());
  }
}
