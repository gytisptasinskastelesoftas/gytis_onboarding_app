
import 'package:equatable/equatable.dart';

class Source extends Equatable {
  final String id;
  final String name;
  final String description;
  final String url;

  const Source({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    url
  ];
}
