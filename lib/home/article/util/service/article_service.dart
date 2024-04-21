import 'package:dio/dio.dart';
import 'package:gytis_onboarding_app/home/article/util/entity/article.dart';
import 'package:gytis_onboarding_app/home/article/util/mapper/article_mapper.dart';
import 'package:gytis_onboarding_app/home/article/util/network/article_response.dart';

class ArticlesService {
  final Dio _dio;

  ArticlesService(this._dio);

  Future<List<ArticleResponse>> fetchArticles(String sourcesId, String apiKey) async {
    try {
      final response = await _dio.get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {'sources': sourcesId, 'apiKey': apiKey},
      );
      final List<dynamic> articleList = response.data['articles'];
      return articleList.map((json) => ArticleResponse.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch articles: $e');
    }
  }

  Future<Article> fetchArticleById(String articleId, String apiKey) async {
    try {
      final response = await _dio.get(
          'https://api.example.com/articles/$articleId',
          queryParameters: {'apiKey': apiKey}
      );
      if (response.statusCode == 200) {
        return ArticleMapper.articleResponseToArticle(response.data);
      } else {
        throw Exception('Failed to load article with status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to fetch article: $error');
    }
  }
}