import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:prohealth360_daktari/application/core/services/app_setup_data.dart';
// Project imports:
import 'package:prohealth360_daktari/domain/core/value_objects/app_contexts.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/infrastructure/endpoints.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sghi_core/app_wrapper/base_context.dart';
import 'package:sghi_core/app_wrapper/enums.dart';

/// This show only exposed the AppContext and BaseContext to prevent conflicts
/// between the endpoint constants in the library, and the local ones

/// Returns the correct [AppSetupData] based on the [AppContext]
///
/// Example AppContext are:
/// - AppTest,
/// - AppDemo,
/// - AppProd,
/// - AppE2E,
AppSetupData getAppSetupData(AppContext context) {
  switch (context) {
    case AppContext.AppTest:
      return devAppSetupData;
    case AppContext.AppDemo:
      return demoAppSetupData;
    case AppContext.AppProd:
      return prodAppSetupData;

    default:
      return devAppSetupData;
  }
}

final AppSetupData devAppSetupData = AppSetupData(
  appContexts: testAppContexts,
  environment: 'DEV',
  appName: appName,
  sentryDNS: FlutterConfig.get('DEV_SENTRY_DNS') as String,
  streamAPIKey: FlutterConfig.get('DEV_STREAM_API_KEY') as String,
  customContext: const BaseContext(
    anonymousLoginEndpoint: '',
    graphqlEndpoint: kTestGraphqlEndpoint,
    setPrimaryPhoneNumberEndpoint: '',
    refreshTokenEndpoint: kTestRefreshTokenEndpoint,
    retryResendOtpEndpoint: '',
    requestPinResetEndpoint: '',
    pinResetEndpoint: '',
    userRecoveryPhoneNumbersEndpoint: '',
    verifyContactOTPEndpoint: kTestVerifyContactOTPEndpoint,
    verifyPhoneEndpoint: kTestVerifyPhoneEndpoint,
    sendContactVerificationOTPEndpoint: '',
    sendRecoverAccountOtpEndpoint: kTestSendRecoverAccountOtpEndpoint,
    loginByPhoneEndpoint: kTestLoginByPhoneEndpoint,
    updateUserPinEndpoint: kTestUpdateUserPinEndpoint,
    uploadFileEndPoint: '',
    createUserByPhoneEndpoint: '',
    switchFlaggedFeaturesEndpoint: '',
    respondedSecurityQuestionsEndpoint:
        kTestGetRecordedSecurityQuestionsEndpoint,
    verifySecurityQuestionsEndpoint: kTestVerifySecurityQuestionsEndpoint,
    refreshStreamTokenEndpoint: kTestRefreshStreamTokenEndpoint,
    pinResetServiceRequestEndpoint: kTestPINResetServiceRequestEndpoint,
    optInClientEndpoint: kTestOptInEndpoint,
  ),
);

final AppSetupData demoAppSetupData = AppSetupData(
  appContexts: demoAppContexts,
  environment: 'DEMO',
  appName: appName,
  sentryDNS: FlutterConfig.get('DEMO_SENTRY_DNS') as String,
  streamAPIKey: FlutterConfig.get('DEMO_STREAM_API_KEY') as String,
  customContext: const BaseContext(
    anonymousLoginEndpoint: '',
    graphqlEndpoint: kDemoGraphqlEndpoint,
    setPrimaryPhoneNumberEndpoint: '',
    refreshTokenEndpoint: kDemoRefreshTokenEndpoint,
    retryResendOtpEndpoint: kDemoRetryResendOtpEndpoint,
    requestPinResetEndpoint: '',
    pinResetEndpoint: '',
    userRecoveryPhoneNumbersEndpoint: '',
    verifyContactOTPEndpoint: kDemoVerifyContactOTPEndpoint,
    verifyPhoneEndpoint: kDemoVerifyPhoneEndpoint,
    sendContactVerificationOTPEndpoint: '',
    sendRecoverAccountOtpEndpoint: kDemoSendRecoverAccountOtpEndpoint,
    loginByPhoneEndpoint: kDemoLoginByPhoneEndpoint,
    updateUserPinEndpoint: kDemoUpdateUserPinEndpoint,
    uploadFileEndPoint: '',
    createUserByPhoneEndpoint: '',
    switchFlaggedFeaturesEndpoint: '',
    respondedSecurityQuestionsEndpoint:
        kDemoGetRecordedSecurityQuestionsEndpoint,
    verifySecurityQuestionsEndpoint: kDemoVerifySecurityQuestionsEndpoint,
    refreshStreamTokenEndpoint: kDemoRefreshStreamTokenEndpoint,
    pinResetServiceRequestEndpoint: kDemoPINResetServiceRequestEndpoint,
    optInClientEndpoint: kDemoOptInEndpoint,
  ),
);

final AppSetupData prodAppSetupData = AppSetupData(
  appContexts: prodAppContexts,
  environment: 'PROD',
  sentryDNS: FlutterConfig.get('PROD_SENTRY_DNS') as String,
  streamAPIKey: FlutterConfig.get('PROD_STREAM_API_KEY') as String,
  appName: appName,
  customContext: const BaseContext(
    anonymousLoginEndpoint: '',
    graphqlEndpoint: kProdGraphqlEndpoint,
    setPrimaryPhoneNumberEndpoint: '',
    refreshTokenEndpoint: kProdRefreshTokenEndpoint,
    retryResendOtpEndpoint: kProdRetryResendOtpEndpoint,
    requestPinResetEndpoint: '',
    pinResetEndpoint: '',
    userRecoveryPhoneNumbersEndpoint: '',
    verifyContactOTPEndpoint: kProdVerifyContactOTPEndpoint,
    verifyPhoneEndpoint: kProdVerifyPhoneEndpoint,
    sendContactVerificationOTPEndpoint: '',
    sendRecoverAccountOtpEndpoint: kProdSendRecoverAccountOtpEndpoint,
    loginByPhoneEndpoint: kProdLoginByPhoneEndpoint,
    updateUserPinEndpoint: kProdUpdateUserPinEndpoint,
    uploadFileEndPoint: '',
    createUserByPhoneEndpoint: '',
    switchFlaggedFeaturesEndpoint: '',
    respondedSecurityQuestionsEndpoint:
        kProdGetRecordedSecurityQuestionsEndpoint,
    verifySecurityQuestionsEndpoint: kProdVerifySecurityQuestionsEndpoint,
    refreshStreamTokenEndpoint: kProdRefreshStreamTokenEndpoint,
    pinResetServiceRequestEndpoint: kProdPINResetServiceRequestEndpoint,
    optInClientEndpoint: kProdOptInEndpoint,
  ),
);

/// Used to capture User Exceptions and logged to AfyaMoja Sentry
///
/// These include exceptions like: `'Error while fetching user feed'`
/// Check `exception_strings.dart` for more examples of these exceptions.
///
/// @params
/// - message: Reported as issue title
/// - query and variables: The query/mutation with variables that resulted into the exception
/// - response: Response received
/// - error: exception string
Future<void> captureException(
  String? message, {
  String? query,
  Map<String, dynamic>? variables,
  dynamic response,
  dynamic error,
}) async {
  final Map<String, dynamic> stackTrace = <String, dynamic>{
    'query': query,
    'variables': variables,
    'response': response,
    'error': error
  };

  /// Adds the stackTrace as a breadcrumb
  Sentry.addBreadcrumb(
    Breadcrumb(
      message: 'Stacktrace for: $message',
      data: stackTrace,
      timestamp: DateTime.now(),
    ),
  );
  await Sentry.captureException(UserException(message));
}

void showTextSnackbar(
  ScaffoldMessengerState scaffoldMessengerState, {
  required String content,
  SnackBarAction? action,
}) {
  scaffoldMessengerState
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(content),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: closeString,
          textColor: Colors.white,
          onPressed: () => scaffoldMessengerState.hideCurrentSnackBar(),
        ),
      ),
    );
}
