abstract class LoaderState {
  final bool loading;
  final bool isTopLoading;

  LoaderState({required this.loading, this.isTopLoading = false});
}

class Loading extends LoaderState {
  @override
  final bool isTopLoading;

  Loading({
    this.isTopLoading = false,
  }) : super(loading: true);
}

class Dismissed extends LoaderState {
  Dismissed() : super(loading: false, isTopLoading: false);
}
