import 'package:gytis_onboarding_app/home/source_list/utils/mapper/source_mapper.dart';
import 'package:gytis_onboarding_app/home/source_list/utils/network/source_response.dart';
import 'package:gytis_onboarding_app/home/source_list/utils/service/sources_service.dart';
import 'package:gytis_onboarding_app/home/source_list/utils/entity/source.dart';

class SourcesUseCase {
  final SourcesService _sourcesService;

  SourcesUseCase(this._sourcesService);

  Future<List<Source>> fetchSources(String apiKey) async {
    try {
      List<SourceResponse> sourceResponses = await _sourcesService.fetchSources(apiKey);
      // Map Source
      List<Source> sources = sourceResponses.map((response) => SourceMapper.sourceResponseToSource(response)).toList();
      return sources;
    } catch (e) {
      throw Exception('Failed to fetch sources: $e');
    }
  }
}
