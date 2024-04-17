import 'package:gytis_onboarding_app/home/source_list/utils/usecases/sources_use_case.dart';
import 'package:mobx/mobx.dart';
import 'package:gytis_onboarding_app/home/source_list/utils/entity/source.dart';

part 'sources_store.g.dart';

class SourcesStore = _SourcesStore with _$SourcesStore;

abstract class _SourcesStore with Store {
  final SourcesUseCase _sourcesUseCase;

  _SourcesStore(this._sourcesUseCase);

  @observable
  SourcesState sourcesState = LoadingState();

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
      sourcesState = SourcesState.listState(fetchedSources);
      isLoading = false;
    } catch (e) {
      errorMessage = 'Failed to fetch sources: $e';
      isLoading = false;
    }
  }
}

sealed class SourcesState {
  factory SourcesState.listState(List<Source> sourceList) => ListState._(sourceList);
}

class EmptyState implements SourcesState {

}

class ErrorState implements SourcesState {

}

class LoadingState implements SourcesState {

}

class ListState implements SourcesState {
  final List<Source> sourceList;

  ListState._(this.sourceList);
}
