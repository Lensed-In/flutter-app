
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/presentation/common_blocs/loader_bloc/loader_bloc.dart';
import 'package:profile/presentation/common_blocs/loader_bloc/loader_state.dart';
import 'package:profile/presentation/themes/app_colors.dart';
import 'package:profile/presentation/widgets/loader_widget/loader_widget.dart';

import 'loader_constants.dart';

class LoaderBlocWidget extends StatelessWidget {
  final GlobalKey<NavigatorState> navigator;
  final Widget child;

  const LoaderBlocWidget({
    Key? key,
    required this.navigator,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          child,
          BlocBuilder<LoaderBloc, LoaderState>(
            builder: _buildContainerWithContent,
          ),
        ],
      );

  Widget _buildContainerWithContent(BuildContext context, LoaderState state) {
    final screenSize = MediaQuery.of(context).size;
    return Visibility(
      visible: state.loading,
      child: !state.isTopLoading
          ? _fullScreenContainerWithCenterLoader(screenSize)
          : _rowWithTopCenterLoader(),
    );
  }

  Container _fullScreenContainerWithCenterLoader(Size screenSize) => Container(
        width: screenSize.width,
        height: screenSize.height,
        color: AppColor.black25,
        alignment: Alignment.center,
        child: SizedBox(
          width: LoaderConstants.loaderSize,
          height: LoaderConstants.loaderSize,
          child: const LoaderWidget(),
        ),
      );

  Row _rowWithTopCenterLoader() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: LoaderConstants.loaderSize,
            height: LoaderConstants.loaderSize,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: LoaderConstants.topPadding),
            child: const LoaderWidget(),
          ),
        ],
      );
}
