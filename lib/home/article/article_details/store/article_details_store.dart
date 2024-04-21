import 'package:mobx/mobx.dart';
import 'package:gytis_onboarding_app/home/article/util/entity/article.dart';
import 'package:gytis_onboarding_app/home/article/util/usecase/article_use_case.dart';

part 'article_details_store.g.dart';

class ArticleDetailsStore = _ArticleDetailsStore with _$ArticleDetailsStore;

abstract class _ArticleDetailsStore with Store {
  final ArticlesUseCase _articlesUseCase;

  _ArticleDetailsStore(this._articlesUseCase);

  @observable
  Article? article;

  @observable
  String? errorMessage;

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchArticleDetails(String articleId) async {
    try {
      isLoading = true;
      errorMessage = null;
      article = await _articlesUseCase.fetchArticleById(articleId, '09793d26702c482f90785b2fe3f3dd85');
      isLoading = false;
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      throw Exception('Failed to fetch article details: $e');
    }
  }
}
