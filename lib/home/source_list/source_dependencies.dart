import 'package:flutter/material.dart';
import 'package:gytis_onboarding_app/home/source_list/store/sources_store.dart';
import 'package:gytis_onboarding_app/home/source_list/utils/service/sources_service.dart';
import 'package:gytis_onboarding_app/home/source_list/utils/usecases/sources_use_case.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

Widget createSourcesStoreProvider({required Widget child}) {
  final dio = Dio();
  final sourcesService = SourcesService(dio);
  final sourcesUseCase = SourcesUseCase(sourcesService);

  return Provider<SourcesStore>(
    create: (_) => SourcesStore(sourcesUseCase),
    child: child,
  );
}