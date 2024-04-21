import 'package:flutter/material.dart';
import 'package:gytis_onboarding_app/home/article/article_details/article_detail_dependencies.dart';
import 'package:gytis_onboarding_app/home/article/util/entity/article.dart';
import 'package:intl/intl.dart';

class ArticleDetailsComponent extends StatelessWidget {
  final Article article;

  const ArticleDetailsComponent({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return ArticleDetailsDependencies(
      child: _ArticleDetailBaseComponent(article: article),
    );
  }
}

class _ArticleDetailBaseComponent extends StatelessWidget {
  final Article article;

  const _ArticleDetailBaseComponent({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (article.urlToImage != null)
                  Image.network(
                    article.urlToImage!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 200),
                  ),
                const SizedBox(height: 10),
                Text(article.title, style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 4),
                Text(article.description ?? 'No description', style: Theme.of(context).textTheme.subtitle1),
                const SizedBox(height: 10),
                Text('By ${article.author}, Published on ${DateFormat('yyyy-MM-dd').format(article.publishedAt)}', style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(height: 10),
                Text(article.content ?? 'No additional content available', style: Theme.of(context).textTheme.bodyText2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
