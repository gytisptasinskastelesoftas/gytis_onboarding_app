import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String sourceId;
  final String title;
  final String? description;
  final bool isFavourite;
  final String? content;
  final String author;
  final DateTime publishedAt;
  final String? urlToImage;
  final String url;

  const Article({
    required this.sourceId,
    required this.title,
    required this.description,
    required this.isFavourite,
    required this.content,
    required this.author,
    required this.publishedAt,
    required this.urlToImage,
    required this.url,
  });

  @override
  List<Object?> get props => [
    sourceId,
    title,
    description,
    isFavourite,
    content,
    author,
    publishedAt,
    urlToImage,
    url,
  ];
}
