import 'package:gytis_onboarding_app/home/source_list/utils/usecases/sources_use_case.dart';
import 'package:mobx/mobx.dart';
import 'package:gytis_onboarding_app/home/source_list/utils/entity/source.dart';

part 'sources_store.g.dart';

class SourcesStore = _SourcesStore with _$SourcesStore;

abstract class _SourcesStore with Store {
  final SourcesUseCase _sourcesUseCase;

  _SourcesStore(this._sourcesUseCase);

  @observable
  List<Source> sources = [];

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchSources(String apiKey) async {
    try {
      isLoading = true;
      errorMessage = null;
      final fetchedSources = await _sourcesUseCase.fetchSources(apiKey);
      sources = fetchedSources;
      isLoading = false;
    } catch (e) {
      errorMessage = 'Failed to fetch sources: $e';
      isLoading = false;
    }
  }
}