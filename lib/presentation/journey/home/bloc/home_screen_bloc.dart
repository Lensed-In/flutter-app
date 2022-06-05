
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:profile/common/util/app_utils.dart';
import 'package:profile/domain/entities/home_response_entity.dart';
import 'package:profile/domain/usecases/home_screen_use_case.dart';
import 'package:profile/networking/api/flutter_ipfs.dart';
import 'package:profile/presentation/common_blocs/loader_bloc/loader_bloc.dart';
import 'package:profile/presentation/common_blocs/loader_bloc/loader_event.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final LoaderBloc loaderBloc;
  final HomeScreenUseCase homeScreenUseCase;

  HomeScreenBloc({
    required this.loaderBloc,
    required this.homeScreenUseCase,
  }) : super(HomeScreenInitial()) {
    on<FetchHomeScreenDataEvent>(_processFetchHomeScreenDataEvent);
    on<PostPublicationEvent>(_processLensLoginEvent);
  }

  void _processFetchHomeScreenDataEvent(
    FetchHomeScreenDataEvent event,
    Emitter<HomeScreenState> emit,
  ) async {
    try {
      loaderBloc.add(ShowLoaderEvent());

      dynamic response = await homeScreenUseCase.fetchFeedData('');
      emit(
          FetchHomeScreenDataSuccessState(state, publications: response));
    } catch (e, stacktrace) {
      handleApiError(e, stacktrace);
      emit(FetchHomeScreenDataFailedState(state));
    }
    loaderBloc.add(DismissLoaderEvent());
  }

  void _processPostPublicationEvent(
      PostPublicationEvent event,
      Emitter<HomeScreenState> emit,
      ) async {
    try {
      loaderBloc.add(ShowLoaderEvent());

      FlutterIpfs ipfs = FlutterIpfs();

      String json = '{"sample": "I love LensedIn"}';

      String cid = await ipfs.uploadToIpfs(json);
      print('cid: $cid');

      String ipfsUrl = 'ipfs://$cid';
      String profileId = 'anhbde';

      final createPostRequest = '''{
        profileId: $profileId,
        contentURI: $cid,
        collectModule: {
          freeCollectModule: { followerOnly: true },
        },
        referenceModule: {
          followerOnlyReferenceModule: false,
        },
      }''';

      dynamic response = await homeScreenUseCase.postPublications(createPostRequest);
      print('_processPostPublicationEvent');
      print(response);
      emit(
          FetchHomeScreenDataSuccessState(state, publications: response));
    } catch (e, stacktrace) {
      handleApiError(e, stacktrace);
      emit(FetchHomeScreenDataFailedState(state));
    }
    loaderBloc.add(DismissLoaderEvent());
  }

  void _processLensLoginEvent(
      PostPublicationEvent event,
      Emitter<HomeScreenState> emit,
      ) async {
    try {
      loaderBloc.add(ShowLoaderEvent());

      String address = '0xdA86780f3902EbE7A92204D939CF1e03009ecf18';
      String signature = 'Sign this message';


      final loginRequest = '''{
        address: $address,
        signature: $signature,
      }''';

      dynamic response = await homeScreenUseCase.lensLogin(loginRequest);
      print('_processLensLoginEvent');
      print(response);
      emit(
          FetchHomeScreenDataSuccessState(state, publications: response));
    } catch (e, stacktrace) {
      handleApiError(e, stacktrace);
      emit(FetchHomeScreenDataFailedState(state));
    }
    loaderBloc.add(DismissLoaderEvent());
  }
}
