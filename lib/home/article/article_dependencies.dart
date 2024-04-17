import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gytis_onboarding_app/home/article/store/articles_store.dart';
import 'package:gytis_onboarding_app/home/article/util/service/article_service.dart';
import 'package:gytis_onboarding_app/home/article/util/usecase/article_use_case.dart';
import 'package:gytis_onboarding_app/home/source_list/store/sources_store.dart';
import 'package:gytis_onboarding_app/home/source_list/utils/service/sources_service.dart';
import 'package:gytis_onboarding_app/home/source_list/utils/usecases/sources_use_case.dart';
import 'package:provider/provider.dart';

class ArticleDependencies extends StatelessWidget {
  final Widget child;

  const ArticleDependencies({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ArticlesService>(
          create: (context) => ArticlesService(Dio()),
        ),
        Provider<ArticlesUseCase>(
          create: (context) => ArticlesUseCase(context.read<ArticlesService>()),
        ),
        Provider<ArticlesStore>(
          create: (context) => ArticlesStore(context.read<ArticlesUseCase>()),
        ),
      ],
      child: child,
    );
  }
}
