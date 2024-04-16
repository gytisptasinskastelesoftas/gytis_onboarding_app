import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gytis_onboarding_app/home/source_list/source_component.dart';
import 'package:gytis_onboarding_app/home/store/home_store.dart';

class HomeComponent extends StatelessWidget {
  final HomeStore store = HomeStore();
  HomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => IndexedStack(
          index: store.currentIndex,
          children: [
            const SourceComponent(),
            Container(child: const Text("Page 2")),
            Container(child: const Text("Page 3")),
          ],
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (_) => BottomNavigationBar(
          currentIndex: store.currentIndex,
          onTap: store.changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
            )
          ],
        ),
      ),
    );
  }
}
