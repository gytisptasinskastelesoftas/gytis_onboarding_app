import 'package:gytis_onboarding_app/home/article/util/entity/article.dart';
import 'package:gytis_onboarding_app/home/article/util/usecase/article_use_case.dart';
import 'package:mobx/mobx.dart';

part 'articles_store.g.dart';

class ArticlesStore = _ArticlesStore with _$ArticlesStore;

abstract class _ArticlesStore with Store {

  final ArticlesUseCase _articlesUseCase;

  _ArticlesStore(this._articlesUseCase);

  @observable
  ArticleState articleState = LoadingState();

  @observable
  String? errorMessage;
  @observable
  bool isLoading = false;
  @action
  Future<void> fetchArticles(String sourceId) async {
    try {
      isLoading = true;
      errorMessage = null;
      final fetchedArticles = await _articlesUseCase.fetchArticles(sourceId,"09793d26702c482f90785b2fe3f3dd85");
      articleState = ArticleState.listState(fetchedArticles);
      isLoading = false;
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      throw Exception('Failed to fetch articles: $e');
    }
  }
}

sealed class ArticleState {
  factory ArticleState.listState(List<Article> articleList) => ListState._(articleList);
}

class EmptyState implements ArticleState {

}

class ErrorState implements ArticleState {

}

class LoadingState implements ArticleState {

}

class ListState implements ArticleState {
  final List<Article> articleList;

  ListState._(this.articleList);
}