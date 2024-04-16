import 'package:flutter/material.dart';
import 'package:gytis_onboarding_app/app/app_dependencies.dart';
import 'package:gytis_onboarding_app/home/home_component.dart';

void main() {
  runApp(
    const AppDependencies(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeComponent());
  }
}
