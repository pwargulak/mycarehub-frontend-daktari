// Flutter imports:
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:prohealth360_daktari/application/core/services/helpers.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_contexts.dart';
import 'package:sghi_core/app_wrapper/enums.dart';

void main() {
  FlutterConfig.loadValueForTesting(<String, String>{
    'DEV_SENTRY_DNS': 'dev_sentry_dns',
    'PROD_SENTRY_DNS': 'prod_sentry_dns',
    'DEMO_SENTRY_DNS': 'demo_sentry_dns',
    'EXTERNAL_SENTRY_DNS': 'external_sentry_dns',
    'DEV_STREAM_API_KEY': 'dev_stream_api_key',
    'DEMO_STREAM_API_KEY': 'demo_stream_api_key',
    'PROD_STREAM_API_KEY': 'prod_stream_api_key',
    'EXTERNAL_STREAM_API_KEY': 'external_stream_api_key',
  });

  test('getAppSetupData should return the correct instance of AppSetupData',
      () async {
    expect(getAppSetupData(testAppContexts.last), devAppSetupData);

    expect(getAppSetupData(demoAppContexts.last), demoAppSetupData);

    expect(getAppSetupData(prodAppContexts.last), prodAppSetupData);

    expect(getAppSetupData(AppContext.BewellCONSUMER), devAppSetupData);
  });
}
