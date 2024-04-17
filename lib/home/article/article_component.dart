import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gytis_onboarding_app/home/article/article_dependencies.dart';
import 'package:gytis_onboarding_app/home/article/store/articles_store.dart';
import 'package:gytis_onboarding_app/home/source_list/utils/entity/source.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ArticleComponent extends StatelessWidget {
  final String sourceId;
  const ArticleComponent({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return ArticleDependencies(
      child: ArticleComponentBase(sourceId: sourceId),
    );
  }
}

class ArticleComponentBase extends StatefulWidget {
  final String sourceId;
  const ArticleComponentBase({super.key, required this.sourceId});

  @override
  _ArticleComponentBaseState createState() => _ArticleComponentBaseState();
}

class _ArticleComponentBaseState extends State<ArticleComponentBase> {
  @override
  void initState() {
    super.initState();
    final articlesStore = Provider.of<ArticlesStore>(context, listen: false);
    articlesStore.fetchArticles(widget.sourceId);
  }

  @override
  Widget build(BuildContext context) {
    final articlesStore = Provider.of<ArticlesStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
      ),
      body: Observer(
        builder: (_) {
          final articleStore = Provider.of<ArticlesStore>(context);
          final state = articlesStore.articleState;
          return switch (state) {
            EmptyState() => const Center(child: Text("No sources available")),
            ErrorState() => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: ${articleStore.errorMessage}'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      child: const Text('Retry'),
                      onPressed: () => articleStore.fetchArticles(widget.sourceId),
                    ),
                  ],
                ),
              ),
            LoadingState() => const Center(child: CircularProgressIndicator.adaptive()),
            ListState() => ListView.builder(
                itemCount: state.articleList.length,
                itemBuilder: (context, index) {
                  final article = state.articleList[index];
                  return ListTile(
                    leading: article.urlToImage != null ? Image.network(
                      article.urlToImage!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.broken_image);
                      },
                    ) : const Icon(Icons.image),
                    title: Text(article.title, style: Theme.of(context).textTheme.headlineSmall),
                    subtitle: Column(
                      children: [
                        Text(article.content ?? "", maxLines: 2,),
                        Text(DateFormat('yyyy-MM-dd').format(article.publishedAt)),
                      ],
                    ),
                  );
                },
              ),
          };
        },
      ),
    );
  }
}
