import 'package:flutter/material.dart';

abstract class Languages {

  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;

  String get welcomeScreenTitle;

  String get welcomeScreenMessage;

  String get orLabel;

  String get continueLabel;

  String get domain;

  String get alreadyHaveAnAccount;

  String get dontHaveAnAccount;

  String get signIn;

  String get signUp;

  String get continueWithApple;

  String get continueWithGoogle;

  String get orSignUpWithEmail;

  String get continueAsAGuest;

  String get enterName;

  String get enterEmail;

  String get enterPassword;

  String get confirmPassword;

  String get home;

  String get learn;

  String get people;

  String get community;

  String get jobs;

  String get profile;

  String get portfolio;

  String get insights;

  String get settings;

  String get inbox;

  String get start;

  String get done;

  String get skip;

  String get onBoardingResourcePageTitle;

  String get onBoardingResourcePageMessage;

  String get onBoardingLearnPageTitle;

  String get onBoardingLearnPageMessage;

  String get onBoardingPeoplePageTitle;

  String get onBoardingPeoplePageMessage;

  String get onBoardingNFTPageTitle;

  String get onBoardingNFTPageMessage;

  String get onBoardingJobsPageTitle;

  String get onBoardingJobsPageMessage;
}