import 'package:dio/dio.dart';
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
}