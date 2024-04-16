import 'package:gytis_onboarding_app/home/source_list/utils/usecases/sources_use_case.dart';
import 'package:mobx/mobx.dart';
import 'package:gytis_onboarding_app/home/source_list/utils/entity/source.dart';

part 'sources_store.g.dart';

class SourcesStore = _SourcesStore with _$SourcesStore;

abstract class _SourcesStore with Store {
  final SourcesUseCase _sourcesUseCase;

  _SourcesStore(this._sourcesUseCase);

  @observable
  ObservableList<Source> sources = ObservableList<Source>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchSources(String apiKey) async {
    try {
      isLoading = true;
      errorMessage = null; // Clear previous errors
      sources.clear();
      final fetchedSources = await _sourcesUseCase.fetchSources(apiKey);
      sources.addAll(fetchedSources);
      isLoading = false;
    } catch (e) {
      errorMessage = 'Failed to fetch sources: $e';
      isLoading = false;
    }
  }
}