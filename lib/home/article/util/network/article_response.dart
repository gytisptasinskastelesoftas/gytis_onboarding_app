import 'package:json_annotation/json_annotation.dart';

import 'article_source_response.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {
  final ArticleSourceResponse source;
  final String title;
  final String? description;
  final String? content;
  final String? author;
  final DateTime publishedAt;
  final String? urlToImage;
  final String url;

  const ArticleResponse({
    required this.source,
    required this.title,
    required this.description,
    required this.content,
    required this.author,
    required this.publishedAt,
    required this.urlToImage,
    required this.url,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) => _$ArticleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}