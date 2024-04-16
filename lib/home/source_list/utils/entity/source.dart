import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';
@JsonSerializable()
class Source {
  String id;
  String name;
  String description;
  String url;

  Source({required this.id, required this.name, required this.description, required this.url});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}