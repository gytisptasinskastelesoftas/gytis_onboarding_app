import 'package:dio/dio.dart';
import 'package:gytis_onboarding_app/home/source_list/utils/network/source_response.dart';


class SourcesService {
  final Dio _dio;

  SourcesService(this._dio);

  Future<List<SourceResponse>> fetchSources(String apiKey) async {
    try {
      final response = await _dio.get(
        'https://newsapi.org/v2/sources',
        queryParameters: {'apiKey': apiKey},
      );
      final List<dynamic> sourceList = response.data['sources'];
      return sourceList.map((json) => SourceResponse.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch sources: $e');
    }
  }
}