import 'package:gytis_onboarding_app/home/article/util/entity/article.dart';
import 'package:gytis_onboarding_app/home/article/util/network/article_response.dart';

class ArticleMapper {
  static Article articleResponseToArticle(ArticleResponse response) {
    return Article(
      title: response.title,
      urlToImage: response.urlToImage,
      url: response.url,
      publishedAt: response.publishedAt,
      content: response.content,
      sourceId: response.source.id,
      description: response.description,
      isFavourite: false,
      author: response.author ?? "Unknown",
    );
  }
}
