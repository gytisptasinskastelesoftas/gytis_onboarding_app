import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gytis_onboarding_app/app/app_routes.dart';
import 'package:gytis_onboarding_app/tutorial/store/tutorial_store.dart';
import 'package:gytis_onboarding_app/tutorial/util/page_content_component.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorialComponent extends StatefulWidget {
  const TutorialComponent({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<TutorialComponent> {
  final TutorialStore store = TutorialStore();
  late final PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: store.currentPage);

    reaction(
          (_) => store.currentPage,
          (int newPage) => _pageController.animateToPage(
        newPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  void _navigateToHome() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('tutorialComplete', true);

    // Navigate to the home screen
    Navigator.pushReplacementNamed(context, '/home');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => PageView(
          controller: _pageController,
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
            onPressed: () {
              if (store.currentPage < 2) {
                store.nextPage(() {});
              } else {
                store.nextPage(_navigateToHome);
              }
            },
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
