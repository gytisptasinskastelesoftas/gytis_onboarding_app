

import 'package:gytis_onboarding_app/home/article/util/entity/article.dart';
import 'package:gytis_onboarding_app/home/article/util/mapper/article_mapper.dart';
import 'package:gytis_onboarding_app/home/article/util/network/article_response.dart';
import 'package:gytis_onboarding_app/home/article/util/service/article_service.dart';

class ArticlesUseCase {
  final ArticlesService _articlesService;

  ArticlesUseCase(this._articlesService);

  Future<List<Article>> fetchArticles(String sourcesId, String apiKey) async {
    List<ArticleResponse> articleResponses = await _articlesService.fetchArticles(sourcesId, apiKey);
    List<Article> articles = articleResponses.map((response) => ArticleMapper.articleResponseToArticle(response)).toList();
    return articles;
  }

  Future<Article> fetchArticleById(String articleId, String apiKey) async {
    return await _articlesService.fetchArticleById(articleId, apiKey);
  }
}