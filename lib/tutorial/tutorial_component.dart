import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gytis_onboarding_app/app/app_routes.dart';
import 'package:gytis_onboarding_app/tutorial/store/tutorial_store.dart';
import 'package:gytis_onboarding_app/tutorial/util/page_content_component.dart';

class TutorialComponent extends StatefulWidget {
  const TutorialComponent({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<TutorialComponent> {
  final TutorialStore store = TutorialStore();
  void _navigateToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => PageView(
          onPageChanged: (int page) => store.currentPage = page,
          children: const [
            PageContentComponent(
              title: "Welcome to Our App",
              description: "Description of what the app does and how it benefits the user.",
              imageAsset: "assets/logo/Logo.png",
            ),
            PageContentComponent(
              title: "Track Your Progress",
              description: "How users can track their progress using your app.",
              imageAsset: "assets/logo/Logo.png",
            ),
            PageContentComponent(
              title: "Achieve Your Goals",
              description: "Motivate the user to achieve their goals using the app.",
              imageAsset: "assets/logo/Logo.png",
            ),
          ],
        ),
      ),
      bottomSheet: Observer(
        builder: (_) => Container(
          height: 60,
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          color: Colors.blue,
          child: TextButton(
            onPressed: () => AppRoutes.navigateToHome(context),
            child: Text(
              store.currentPage < 2 ? "Next" : "Done",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
