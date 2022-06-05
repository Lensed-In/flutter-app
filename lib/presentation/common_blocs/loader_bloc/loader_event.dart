abstract class LoaderEvent {}

class ShowLoaderEvent extends LoaderEvent {
  final bool isTopLoader;

  ShowLoaderEvent({this.isTopLoader = false});
}

class DismissLoaderEvent extends LoaderEvent {}
