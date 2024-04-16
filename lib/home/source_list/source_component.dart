import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gytis_onboarding_app/home/source_list/store/sources_store.dart';
import 'package:provider/provider.dart';

class SourceComponent extends StatefulWidget {
  const SourceComponent({super.key});

  @override
  State<SourceComponent> createState() => _SourceComponentState();
}

class _SourceComponentState extends State<SourceComponent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final sourcesStore = Provider.of<SourcesStore>(context, listen: false);
      sourcesStore.fetchSources('09793d26702c482f90785b2fe3f3dd85');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Source List')),
      body: Observer(
        builder: (_) {
          final sourcesStore = Provider.of<SourcesStore>(context);
          if (sourcesStore.isLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (sourcesStore.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${sourcesStore.errorMessage}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text('Retry'),
                    onPressed: () => sourcesStore.fetchSources('09793d26702c482f90785b2fe3f3dd85'),
                  ),
                ],
              ),
            );
          } else if (sourcesStore.sources.isEmpty) {
            return const Center(child: Text("No sources available"));
          } else {
            return ListView.builder(
              itemCount: sourcesStore.sources.length,
              itemBuilder: (context, index) {
                final source = sourcesStore.sources[index];
                return ListTile(
                  title: Text(source.name),
                  subtitle: Text(source.description),
                );
              },
            );
          }
        },
      ),
    );
  }
}