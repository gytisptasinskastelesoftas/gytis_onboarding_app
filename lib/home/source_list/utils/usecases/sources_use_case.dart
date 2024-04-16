import 'package:gytis_onboarding_app/home/source_list/utils/service/sources_service.dart';
import 'package:gytis_onboarding_app/home/source_list/utils/entity/source.dart';

class SourcesUseCase {
  final SourcesService _sourcesService;

  SourcesUseCase(this._sourcesService);

  Future<List<Source>> fetchSources(String apiKey) async {
    try {
      // Fetch the sources using the service
      List<Source> sources = await _sourcesService.fetchSources(apiKey);
      // Here you can add additional business logic if needed
      return sources;
    } catch (e) {
      throw Exception('Failed to fetch sources in use case: $e');
    }
  }
}
