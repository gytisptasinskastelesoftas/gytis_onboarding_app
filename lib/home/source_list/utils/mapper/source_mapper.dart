
import 'package:gytis_onboarding_app/home/source_list/utils/entity/source.dart';
import 'package:gytis_onboarding_app/home/source_list/utils/network/source_response.dart';

class SourceMapper {
  static Source sourceResponseToSource(SourceResponse response) {
    return Source(
      id: response.id,
      name: response.name,
      description: response.description,
      url: response.url,
    );
  }
}

