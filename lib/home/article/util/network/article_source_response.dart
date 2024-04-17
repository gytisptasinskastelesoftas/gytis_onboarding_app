import 'package:json_annotation/json_annotation.dart';

part 'article_source_response.g.dart';

@JsonSerializable()
class ArticleSourceResponse {
  final String id;
  final String name;

  ArticleSourceResponse({
    required this.id,
    required this.name,
  });

  factory ArticleSourceResponse.fromJson(Map<String, dynamic> json) => _$ArticleSourceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleSourceResponseToJson(this);
}