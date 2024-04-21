import 'package:flutter/material.dart';
import 'package:gytis_onboarding_app/home/home_component.dart';
import 'package:gytis_onboarding_app/tutorial/tutorial_component.dart';

class AppRoutes {
  static String getInitialRoute(bool tutorialComplete) {
    return tutorialComplete ? '/home' : '/';
  }

  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const TutorialComponent(),
    '/home': (context) => HomeComponent(),
  };

  static void navigateToHome(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/home');
  }
}

