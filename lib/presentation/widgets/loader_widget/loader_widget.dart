import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:profile/common/constants/lottie_constants.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        child: LottieBuilder.asset(LottieConstants.loading),
      );
}
