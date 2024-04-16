import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gytis_onboarding_app/home/source_list/store/sources_store.dart';
import 'package:gytis_onboarding_app/home/source_list/utils/service/sources_service.dart';
import 'package:gytis_onboarding_app/home/source_list/utils/usecases/sources_use_case.dart';
import 'package:provider/provider.dart';

class AppDependencies extends StatelessWidget {
  final Widget child;

  const AppDependencies({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SourcesService>(
          create: (context) => SourcesService(Dio()),
        ),
        Provider<SourcesUseCase>(
          create: (context) => SourcesUseCase(context.read<SourcesService>()),
        ),
        Provider<SourcesStore>(
          create: (context) => SourcesStore(context.read<SourcesUseCase>()),
        ),
      ],
      child: child,
    );
  }
}
