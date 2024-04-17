
import 'package:json_annotation/json_annotation.dart';

part 'source_response.g.dart';

@JsonSerializable()
class SourceResponse {
  final String id;
  final String name;
  final String description;
  final String url;

  SourceResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
  });

  factory SourceResponse.fromJson(Map<String, dynamic> json) => _$SourceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SourceResponseToJson(this);
}