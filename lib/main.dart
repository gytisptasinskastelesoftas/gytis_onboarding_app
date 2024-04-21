import 'package:flutter/material.dart';
import 'package:gytis_onboarding_app/app/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool tutorialComplete = prefs.getBool('tutorialComplete') ?? false;

  runApp(MyApp(tutorialComplete: tutorialComplete));
}

class MyApp extends StatelessWidget {
  final bool tutorialComplete;
  const MyApp({super.key, required this.tutorialComplete});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.getInitialRoute(tutorialComplete),
      routes: AppRoutes.routes,
    );
  }
}
