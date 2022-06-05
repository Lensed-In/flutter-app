import 'package:flutter/material.dart';
import 'package:profile/presentation/widgets/onboarding/page_model.dart';

import 'fancy_image.dart';

class FancyPage extends StatelessWidget {
  final PageModel model;
  final double percentVisible;

  const FancyPage({
    Key? key,
    required this.model,
    this.percentVisible = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: model.color,
        alignment: Alignment.center,
        child: Opacity(
          opacity: percentVisible,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              // Lottie.asset(
              //   LottieConstants.animatedShapes,
              //   width: 200,
              //   height: 200,
              // ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Transform(
                  transform: Matrix4.translationValues(
                      0.0, 50.0 * (1.0 - percentVisible), 0.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: FancyImage(
                      // width: 200,
                      // height: 200,
                      image: model.heroImagePath,
                      color: model.heroImageColor,
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      0.0, 30.0 * (1.0 - percentVisible), 0.0),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: model.title),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      0.0, 30.0 * (1.0 - percentVisible), 0.0),
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 75.0), child: model.body),
                ),
              ]),
            ],
          ),
        ));
  }
}
