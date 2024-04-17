import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'tutorial_store.g.dart';

class TutorialStore = _TutorialStore with _$TutorialStore;

abstract class _TutorialStore with Store {
  @observable
  int currentPage = 0;

  @observable
  bool shouldNavigateHome = false;

  @action
  void nextPage(Function onFinished) {
    if (currentPage < 2) {
      currentPage++;
    } else {
      onFinished();
    }
  }
}
