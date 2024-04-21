import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gytis_onboarding_app/home/article/article_details/store/article_details_store.dart';
import 'package:gytis_onboarding_app/home/article/util/usecase/article_use_case.dart';
import 'package:provider/provider.dart';
import 'package:gytis_onboarding_app/home/article/util/service/article_service.dart';

class ArticleDetailsDependencies extends StatelessWidget {
  final Widget child;

  const ArticleDetailsDependencies({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Dio>(
          create: (context) => Dio(),
        ),
        Provider<ArticlesService>(
          create: (context) => ArticlesService(context.read<Dio>()),
        ),
        Provider<ArticlesUseCase>(
          create: (context) => ArticlesUseCase(context.read<ArticlesService>()),
        ),
        Provider<ArticleDetailsStore>(
          create: (context) => ArticleDetailsStore(context.read<ArticlesUseCase>()),
        ),
      ],
      child: child,
    );
  }
}
