import 'dart:convert';
import 'dart:io';

import 'package:prohealth360_daktari/application/core/services/custom_client.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/auth_credentials.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart' as core;
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sghi_core/communities/core/endpoints.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
// Project imports:
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/infrastructure/repository/initialize_db.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
// Project imports:
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:firebase_analytics_platform_interface/firebase_analytics_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_messaging_platform_interface/firebase_messaging_platform_interface.dart';
import 'package:sqflite/sqlite_api.dart';

import 'mock_utils.dart';

class MockBuildContext extends Mock implements BuildContext {}

typedef DidNavigate = void Function(
  Route<dynamic>? route,
  Route<dynamic>? previousRoute,
);
const String testString = 'test';

class TestNavigatorObserver extends NavigatorObserver {
  TestNavigatorObserver({this.onPop, this.onPush});

  final DidNavigate? onPop;
  final DidNavigate? onPush;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      onPop?.call(route, previousRoute);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onPush?.call(route, previousRoute);
  }
}

class MockInitializeDB extends Mock implements InitializeDB<MockStateDB> {
  @override
  String get dbName =>
      super.noSuchMethod(Invocation.getter(#dbName), returnValue: 'testDb')
          as String;

  @override
  Future<MockStateDB> database({MockStateDB? preInitializedDB}) =>
      super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: Future<MockStateDB>.value(MockStateDB()),
      ) as Future<MockStateDB>;
}

const Size tabletLandscape = Size(1280, 720);
const Size typicalLargePhoneScreenSizePortrait = Size(300, 800);

class MockStateDB extends Mock implements Database {
  @override
  Future<List<Map<String, Object?>>> rawQuery(
    String sql, [
    List<Object?>? arguments,
  ]) =>
      super.noSuchMethod(
        Invocation.method(#rawQuery, <dynamic>[sql, arguments]),
        returnValue: Future<List<Map<String, Object?>>>.value(
          <Map<String, Object?>>[
            <String, Object?>{'miscState': 10}
          ],
        ),
      ) as Future<List<Map<String, Object?>>>;

  @override
  Future<int> rawInsert(String sql, [List<Object?>? arguments]) =>
      super.noSuchMethod(
        Invocation.method(#rawInsert, <dynamic>[sql, arguments]),
        returnValue: Future<int>.value(10),
      ) as Future<int>;

  @override
  Batch batch() {
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    throw UnimplementedError();
  }

  @override
  Future<int> delete(String table, {String? where, List<Object?>? whereArgs}) {
    throw UnimplementedError();
  }

  @override
  Future<T> devInvokeMethod<T>(String method, [dynamic arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<T> devInvokeSqlMethod<T>(
    String method,
    String sql, [
    List<Object?>? arguments,
  ]) {
    throw UnimplementedError();
  }

  @override
  Future<void> execute(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  Future<int> getVersion() {
    throw UnimplementedError();
  }

  @override
  Future<int> insert(
    String table,
    Map<String, Object?> values, {
    String? nullColumnHack,
    ConflictAlgorithm? conflictAlgorithm,
  }) {
    throw UnimplementedError();
  }

  @override
  bool get isOpen => true;

  @override
  String get path => 'test';

  @override
  Future<List<Map<String, Object?>>> query(
    String table, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<int> rawDelete(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<int> rawUpdate(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  Future<void> setVersion(int version) {
    throw UnimplementedError();
  }

  @override
  Future<T> transaction<T>(
    Future<T> Function(Transaction txn) action, {
    bool? exclusive,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<int> update(
    String table,
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
    ConflictAlgorithm? conflictAlgorithm,
  }) {
    throw UnimplementedError();
  }
}

class MockConnectivityPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements ConnectivityPlatform {
  MockConnectivityPlatform({List<ConnectivityResult>? connectivityValues})
      : connectivityValues = connectivityValues ??
            <ConnectivityResult>[ConnectivityResult.mobile];

  final List<ConnectivityResult> connectivityValues;

  @override
  Future<ConnectivityResult> checkConnectivity() async {
    return connectivityValues.last;
  }

  @override
  Stream<ConnectivityResult> get onConnectivityChanged {
    return Stream<ConnectivityResult>.fromIterable(connectivityValues);
  }
}

final Map<String, dynamic> mockPrimaryContact = <String, dynamic>{
  'active': true,
  'contact': '+254717356476',
  'contactType': 'PHONE',
  'optedIn': true
};

final Map<String, dynamic> mockFacility = <String, dynamic>{
  'id': 'some_id',
  'name': 'facility name',
  'code': 123,
  'phone': '+254717356476',
  'active': false,
  'county': 'Nairobi',
  'description': 'detailed description',
};

final Map<String, dynamic> mockCreatePin = <String, dynamic>{
  'newPIN': '1234',
  'confirmPIN': '1234',
};

final Map<String, dynamic> mockPhoneLoginState = <String, dynamic>{
  'phoneNumber': '+254704002748',
  'pinCode': '1234',
};

final Map<String, dynamic> mockVerifyPhoneState = <String, dynamic>{
  'invalidOTP': false,
  'failedToSendOTP': false,
  'canResendOTP': false,
};

Map<String, dynamic> mockIconDetails = <String, dynamic>{
  'url': alertCircleIcon
};

Map<String, dynamic> mockNotificationActions = <String, dynamic>{
  'name': 'Calendar',
  'route': ' ',
  'icon': mockIconDetails
};

Map<String, dynamic> mockNotification = <String, dynamic>{
  'description':
      'Your Teleconsult with Dr Tibu for 11am has been set. Click this link to join ',
  'createdAt': '2022-04-28T07:00:20Z',
  'type': 'APPOINTMENT',
  'actions': <dynamic>[mockNotificationActions],
  'status': 'Missed',
  'id': 'some-id',
  'title': 'title',
};
Map<String, dynamic> mockNotificationsResponse = <String, dynamic>{
  'fetchNotifications': <String, dynamic>{
    'notifications': <dynamic>[
      mockNotification,
      <String, dynamic>{
        'id': 'some-id',
        'title': 'title',
        'type': 'SERVICE_REQUEST',
        'body':
            'Your Teleconsult with Dr Tibu for 11am has been set. Click this link to join ',
        'isRead': false,
        'createdAt': '2022-04-28T07:00:20Z',
        'actions': <dynamic>[mockNotificationActions],
        'status': 'Missed',
        'description': 'Your Teleconsult ',
      },
    ]
  }
};

Map<String, dynamic> mockClientResponse = <String, dynamic>{
  'ID': 'some-id',
  'User': <String, dynamic>{
    'Username': 'new-user',
    'Name': 'new name',
    'Active': false,
    'TermsAccepted': false,
    'Contacts': <String, dynamic>{
      'ContactType': 'PHONE',
      'ContactValue': '07000000',
      'Active': false,
      'OptedIn': false,
    }
  }
};

Map<String, dynamic> mockRoleResponse = <String, dynamic>{
  'roleID': 'some-id',
  'name': 'some-name',
};

Map<String, dynamic> mockRegisterClient = <String, dynamic>{
  'ID': 'id',
  'active': true,
  'clientType': 'clientType',
  'enrollmentDate': '2021-01-01',
  'fhirPatientID': 'some-id',
  'emrHealthRecordID': 'some-id',
  'treatmentBuddy': 'buddy',
  'counselled': false,
  'organisation': 'organisation',
  'userID': 'user_id',
  'currentFacilityID': 'some-id',
  'chv': 'chv',
  'caregiver': 'caregiver'
};

final Map<String, dynamic> mockRegisterStaff = <String, dynamic>{
  'ID': '',
  'active': false,
  'staffNumber': '12345678',
  'userID': 'some-id',
  'defaultFacility': '',
};

Map<String, dynamic> mockRegisterPayload = <String, dynamic>{
  'facility': 'Kanairo',
  'clientType': 'PMTCT',
  'clientName': 'Joker',
  'gender': 'male',
  'dateOfBirth': '1998-01-01',
  'phoneNumber': '+254704002748',
  'enrollmentDate': '2021-02-07',
  'cccNumber': 'joker1',
  'counselled': true
};

Map<String, dynamic> mockRegisterCaregiverPayload = <String, dynamic>{
  'facility': 'Kanairo',
  'name': 'Joker',
  'gender': 'male',
  'dateOfBirth': '1998-01-01',
  'phoneNumber': '+254704002748',
  'enrollmentDate': '2021-02-07',
  'sendInvite': true,
  'assignedClients': <dynamic>[
    <String, dynamic>{
      'clientID': 'test',
      'caregiverType': 'FATHER',
    }
  ]
};

Map<String, dynamic> mockAssignCaregiver = <String, dynamic>{
  'clientID': 'Id',
  'caregiverID': 'id',
  'caregiverType': 'FATHER',
};

Map<String, dynamic> mockClientConfigurationPayload = <String, dynamic>{
  'clientType': 'PMTCT',
  'ageGroup': '14 - 16 yrs',
};

Map<String, dynamic> mockListFacilities = <String, dynamic>{
  'Facilities': <dynamic>[
    mockFacility,
  ]
};

final MockTestGraphQlClient mockGraphQlClient =
    MockTestGraphQlClient.withResponse(
  'idToken',
  'endpoint',
  http.Response('success response', 200),
);

final Map<String, dynamic> termsMock = <String, dynamic>{
  'termsID': 10001,
  'text': 'Dummy PRO Terms'
};

final Map<String, dynamic> mockAssessmentResponsesByToolType =
    <String, dynamic>{
  'clientID': 'client-id',
  'screeningToolResponseID': 'screening-id',
  'serviceRequestID': 'sr-id',
  'name': 'Test',
  'phoneNumber': '+254712345678',
  'serviceRequest':
      'Test has a score of 3 for TB Assessment. They require your attention'
};

final Map<String, dynamic> mockToolAssessmentResponses = <String, dynamic>{
  'getScreeningToolServiceRequestResponses': <String, dynamic>{
    'serviceRequestID': 'test',
    'getAssessmentResponsesByToolType': <dynamic>[
      mockAssessmentResponsesByToolType,
      mockAssessmentResponsesByToolType,
    ]
  }
};

final Map<String, dynamic> mockPendingServiceRequestCount = <String, dynamic>{
  'data': <String, dynamic>{
    'getPendingServiceRequestsCount': <String, dynamic>{
      'clientsServiceRequestCount': <String, dynamic>{
        'requestsTypeCount': <Map<String, dynamic>>[
          <String, dynamic>{'requestType': 'RED_FLAG', 'total': 2},
          <String, dynamic>{'requestType': 'PIN_RESET', 'total': 2},
          <String, dynamic>{
            'requestType': 'SCREENING_TOOLS_RED_FLAG',
            'total': 2
          },
          <String, dynamic>{'requestType': 'SURVEY_RED_FLAG', 'total': 2},
        ],
      },
      'staffServiceRequestCount': <String, dynamic>{
        'requestsTypeCount': <Map<String, dynamic>>[
          <String, dynamic>{'requestType': 'STAFF_PIN_RESET', 'total': 1}
        ]
      }
    }
  }
};

/// a short client for providing custom responses
///
/// a good use case is when you want to return error responses
class MockShortGraphQlClient extends IGraphQlClient {
  MockShortGraphQlClient.withResponse(
    String idToken,
    String endpoint,
    this.response,
  ) {
    super.idToken = idToken;
    super.endpoint = endpoint;
  }

  final http.Response response;

  @override
  Future<http.Response> callRESTAPI({
    required String endpoint,
    required String method,
    Map<String, dynamic>? variables,
    Duration? timeout,
    Map<String, String>? customHeaders,
  }) {
    return Future<http.Response>.value(response);
  }

  @override
  Future<http.Response> query(
    String queryString,
    Map<String, dynamic> variables, {
    Duration? timeout,
  }) {
    return Future<http.Response>.value(response);
  }
}

class MockCustomGraphQlClient extends IGraphQlClient implements CustomClient {
  MockCustomGraphQlClient.withResponse(
    String idToken,
    String endpoint,
    this.response,
  ) {
    super.idToken = idToken;
    super.endpoint = endpoint;
  }

  final http.Response response;

  @override
  Future<http.Response> callRESTAPI({
    required String endpoint,
    required String method,
    Map<String, dynamic>? variables,
    Duration? timeout,
    Map<String, String>? customHeaders,
  }) {
    return Future<http.Response>.value(response);
  }

  @override
  Future<http.Response> query(
    String queryString,
    Map<String, dynamic> variables, {
    Duration? timeout,
  }) {
    return Future<http.Response>.value(response);
  }

  @override
  Future<AuthCredentials?> refreshToken() {
    return Future<AuthCredentials>(AuthCredentials.initial);
  }

  @override
  BuildContext get context => throw UnimplementedError();

  @override
  String get refreshTokenEndpoint => throw UnimplementedError();

  @override
  String get userID => throw UnimplementedError();
}

class MockTestGraphQlClient extends IGraphQlClient {
  MockTestGraphQlClient();

  MockTestGraphQlClient.withResponse(
    String idToken,
    String endpoint,
    this.response,
  ) {
    super.idToken = idToken;
    super.endpoint = endpoint;
  }

  late final http.Response response;

  @override
  Future<http.Response> callRESTAPI({
    required String endpoint,
    required String method,
    Map<String, dynamic>? variables,
    Duration? timeout,
    Map<String, String>? customHeaders,
  }) async {
    if (endpoint.contains('upload')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'id': '1r1idoAs54kbZ90l9KkHSK7GKva',
            },
          ),
          201,
        ),
      );
    }

    if (endpoint.contains('login_by_phone')) {
      return Future<http.Response>.value(
        http.Response(json.encode(mockLoginResponse), 201),
      );
    }

    if (endpoint.contains('verify_otp')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'getCurrentTerms': termsMock,
                'sendOTP': <String, dynamic>{
                  'otp': '123456',
                  'phoneNumber': '0712345678',
                },
                'sendRetryOTP': <String, dynamic>{
                  'otp': '123456',
                  'phoneNumber': '0712345678',
                },
                'verifyOTP': true
              }
            },
          ),
          201,
        ),
      );
    }

    if (endpoint.contains('send_otp')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'getCurrentTerms': termsMock,
                'sendOTP': <String, dynamic>{
                  'otp': '123456',
                  'phoneNumber': '0712345678',
                },
                'sendRetryOTP': <String, dynamic>{
                  'otp': '123456',
                  'phoneNumber': '0712345678',
                },
                'verifyOTP': true
              }
            },
          ),
          201,
        ),
      );
    }
    if (endpoint.contains('opt-in')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'status': true}),
          201,
        ),
      );
    }
    if (endpoint.contains(syncEndpoint)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(syncResponseMock),
          201,
        ),
      );
    }

    if (endpoint.contains('joined_members')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(joinedMembersResponseMock),
          201,
        ),
      );
    }

    if (endpoint.contains('/send/m.room.message/')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'event_id': '16741180035XJnPW:chat.savannahghi.org',
          }),
          201,
        ),
      );
    }

    if (endpoint.contains('m.room.power_levels')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(powerLevelsResponseMock),
          201,
        ),
      );
    }

    if (endpoint.contains('/invite')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{}),
          201,
        ),
      );
    }

    if (endpoint.contains('/join')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'room_id': '!NvYSqaASzlfRpFCMtr:chat.savannahghi.org',
          }),
          201,
        ),
      );
    }

    if (endpoint.contains('/leave')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{}),
          201,
        ),
      );
    }

    if (endpoint.contains('/kick')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{}),
          201,
        ),
      );
    }

    if (endpoint.contains('/redact')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'event_id': '16741180035XJnPW:chat.savannahghi.org',
          }),
          201,
        ),
      );
    }

    if (endpoint.contains('/createRoom')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'room_id': '!NvYSqaASzlfRpFCMtr:chat.savannahghi.org',
          }),
          201,
        ),
      );
    }

    if (endpoint.contains('/media/v3/download/')) {
      final String dir = Directory.current.path;
      final String imgPath = '$dir/test/test_resources/test_file.png';
      final ByteData imgData = await rootBundle.load(imgPath);
      final Uint8List uint8list = imgData.buffer.asUint8List();

      return Future<http.Response>.value(
        http.Response(json.encode(uint8list), 201),
      );
    }

    if (endpoint.contains(searchMembersEndpoint)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'results': <Map<String, dynamic>>[loginResponseMock],
          }),
          201,
        ),
      );
    }

    return Future<http.Response>.value(
      http.Response(
        json.encode(
          <String, dynamic>{
            'data': <String, dynamic>{
              // add your data here
            }
          },
        ),
        201,
      ),
    );
  }

  @override
  Future<http.Response> query(
    String queryString,
    Map<String, dynamic> variables, {
    Duration? timeout,
  }) async {
    final String otpVariables = json.encode(<String, dynamic>{
      'msisdn': '+254717356476',
      'email': 'abiud.orina@savannahinformatics.com'
    });

    final String errorOtpVariables = json.encode(<String, dynamic>{
      'msisdn': '+254717356477',
      'email': 'abiud.orina@savannahinformatics.com'
    });

    if (json.encode(variables) == otpVariables) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'generateAndEmailOTP': '123456'}
          }),
          201,
        ),
      );
    }

    if (json.encode(variables) == errorOtpVariables) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'Error': 'this is a sample error with an ID token'
          }),
          201,
        ),
      );
    }

    if (variables['phonenumber'] == '+254712345678') {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              // add your data here
              'otp': '1234'
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains('updateUserProfile')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'updateUserProfile': <String, dynamic>{
                'userBioData': <String, String>{
                  'firstName': 'Test',
                  'lastName': 'Name'
                }
              },
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains(getTermsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'getCurrentTerms': termsMock}
          }),
          201,
        ),
      );
    }

    if (queryString.contains(acceptTermsAndConditionsMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'acceptTerms': true}
          }),
          201,
        ),
      );
    }

    if (queryString.contains(recordSecurityQuestionResponsesMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': mockRecordSecurityQuestionResponseData,
          }),
          201,
        ),
      );
    }

    if (queryString.contains(setUserPINMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'setUserPIN': true}
          }),
          201,
        ),
      );
    }

    if (queryString.contains(setNickNameMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'setNickName': true}
          }),
          201,
        ),
      );
    }

    if (queryString.contains(completeOnboardingTourMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'completeOnboardingTour': true}
          }),
          201,
        ),
      );
    }

    if (queryString.contains(fetchNotificationFilters)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{'data': mockNotificationFiltersResponse},
          ),
          201,
        ),
      );
    }
    if (queryString.contains(surveyResponseQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'getSurveyResponse': <dynamic>[
                  mockSurveyResponse,
                  mockSurveyResponse
                ]
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(registerClientMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'registerClient': <String, dynamic>{
                  'id': '',
                  'active': false,
                  'clientType': '',
                  'enrollmentDate': null,
                  'fhirPatientID': '',
                  'emrHealthRecordID': '',
                  'treatmentBuddy': '',
                  'counselled': false,
                  'organisation': '',
                  'userID': '',
                  'currentFacilityID': '',
                  'chv': '',
                  'caregiver': ''
                }
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(registerCaregiverMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'registerCaregiver': true}
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(addFacilitiesToClientProfileMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'addFacilitiesToClientProfile': true}
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(addFacilitiesToStaffProfileMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'addFacilitiesToStaffProfile': true}
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(removeFacilitiesFromStaffProfileMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'removeFacilitiesFromStaffProfile': true
              }
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(removeFacilitiesFromClientProfileMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'removeFacilitiesFromClientProfile': true
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(getServiceRequestsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': mockServiceRequests,
          }),
          201,
        ),
      );
    }
    if (queryString.contains(searchServiceRequestsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': mockSearchServiceRequests,
          }),
          201,
        ),
      );
    }

    if (queryString.contains(getResolvedServiceRequestsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': mockServiceRequests,
          }),
          201,
        ),
      );
    }

    if (queryString.contains(getPendingServiceRequestsCountQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(mockPendingServiceRequestCount),
          201,
        ),
      );
    }

    if (queryString.contains(searchFacilityQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'listFacilities': <String, dynamic>{'facilities': mockFacilities}
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains(searchProgramFacilitiesQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'listProgramFacilities': <String, dynamic>{
                'facilities': mockFacilities
              }
            }
          }),
          201,
        ),
      );
    }
    if (queryString.contains(getClientFacilitiesQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getClientFacilities': <String, dynamic>{
                'facilities': mockFacilities
              }
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains(listOrganizationsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'listOrganisations': <String, dynamic>{
                  'organisations': <dynamic>[
                    <String, dynamic>{
                      'id': 'some-id',
                      'name': 'Organisation SI THREE',
                      'description': 'Organisation SI Two',
                      'programs': <dynamic>[mockProgramData]
                    },
                    <String, dynamic>{
                      'id': 'some-id',
                      'name': 'Organisation Two Five Four',
                      'description': 'Test Organisation Two Five Four',
                      'programs': <dynamic>[mockProgramData]
                    },
                    <String, dynamic>{
                      'id': 'some-id',
                      'name': 'Organisation SI THREE',
                      'description': 'Organisation SI Two',
                      'programs': <dynamic>[mockProgramData]
                    },
                  ]
                }
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(searchOrganizationQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'searchOrganisations': <dynamic>[
                  <String, dynamic>{
                    'id': 'some-id',
                    'name': 'Organisation SI THREE',
                    'description': 'Organisation SI Two',
                    'programs': <dynamic>[mockProgramData]
                  },
                  <String, dynamic>{
                    'id': 'some-id',
                    'name': 'Organisation Two Five Four',
                    'description': 'Test Organisation Two Five Four',
                    'programs': <dynamic>[mockProgramData]
                  },
                ]
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(setStaffDefaultFacilityMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'setStaffDefaultFacility': <String, dynamic>{'id': 'testId'},
              }
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(setStaffProgramMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'setStaffProgram': <String, dynamic>{
                  'staffProfile': <String, dynamic>{
                    'ID': 'testID',
                    'StaffNumber': 'testStaffNumber',
                    'DefaultFacility': <String, dynamic>{
                      'ID': 'testID',
                      'name': 'testName',
                      'Username': 'testUserName',
                      'Active': true,
                      'Gender': 'male'
                    },
                    'User': <String, dynamic>{
                      'ID': 'testID',
                      'Name': 'testName'
                    }
                  },
                  'communityToken': 'testToken'
                },
              }
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(createOrganisationMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'createOrganisation': <String, dynamic>{
                  'staffProfile': true,
                }
              }
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(addFacilityToProgramMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'addFacilityToProgram': true}
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(getCaregiverManagedClientsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'getCaregiverManagedClients': <String, dynamic>{
                  'pagination': <String, dynamic>{
                    'limit': 20,
                    'currentPage': 1,
                    'count': 2,
                    'totalPages': 1,
                    'nextPage': null,
                    'previousPage': null
                  },
                  'managedClients': <dynamic>[
                    <String, dynamic>{
                      'caregiverConsent': true,
                      'clientConsent': true,
                      'workStationDetails': <String, dynamic>{
                        'notifications': 1,
                        'surveys': 1,
                        'articles': 1,
                        'messages': 1
                      },
                      'clientProfile': <String, dynamic>{
                        'id': '0some-id',
                        'username': 'testUserName',
                        'active': true,
                        'termsAccepted': true,
                      }
                    },
                    <String, dynamic>{
                      'caregiverConsent': true,
                      'clientConsent': true,
                      'workStationDetails': <String, dynamic>{
                        'notifications': 0,
                        'surveys': 0,
                        'articles': 0,
                        'messages': 0
                      },
                      'clientProfile': <String, dynamic>{
                        'id': '0some-id',
                        'username': 'testUserName',
                        'active': true,
                        'termsAccepted': true,
                      }
                    }
                  ]
                }
              }
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(listClientsCaregiversQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'listClientsCaregivers': <String, dynamic>{
                  'Pagination': <String, dynamic>{
                    'Limit': 20,
                    'CurrentPage': 1,
                    'Count': 2,
                    'TotalPages': 1,
                    'NextPage': null,
                    'PreviousPage': null
                  },
                  'caregivers': <dynamic>[
                    <String, dynamic>{
                      'id': 'testId',
                      'consent': <String, dynamic>{'consentStatus': 'ACCEPTED'},
                      'user': mockUserData,
                      'caregiverNumber': '1234',
                      'isClient': false,
                    },
                    <String, dynamic>{
                      'id': 'testId2',
                      'consent': <String, dynamic>{'consentStatus': 'PENDING'},
                      'user': mockUserData,
                      'caregiverNumber': '123457',
                      'isClient': true,
                    },
                    <String, dynamic>{
                      'id': 'testId3',
                      'consent': <String, dynamic>{'consentStatus': 'REJECTED'},
                      'user': mockUserData,
                      'caregiverNumber': '123495',
                      'isClient': true,
                    },
                  ],
                }
              }
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(listUserProgramsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'listUserPrograms': <String, dynamic>{
                  'count': 1,
                  'programs': <dynamic>[
                    <String, dynamic>{
                      'id': 'testId',
                      'name': 'testName',
                      'active': true,
                      'organisation': <String, dynamic>{
                        'id': 'testOrgId',
                        'description': 'testOrgDescription',
                      },
                    }
                  ],
                }
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(getStaffFacilitiesQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'getStaffFacilities': <String, dynamic>{
                  'facilities': <dynamic>[
                    <String, dynamic>{
                      'id': 'testId',
                      'name': 'testName',
                      'phone': '+254725992732',
                      'active': true,
                      'county': 'testC',
                      'description': 'Operates from Monday to Friday',
                      'fhirOrganisationID': 'testId',
                      'workStationDetails': <String, dynamic>{
                        'notifications': 1,
                        'messages': 2,
                        'surveys': 3,
                        'articles': 4,
                        'serviceRequests': 5
                      }
                    }
                  ]
                }
              }
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(searchProgramsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'searchPrograms': <dynamic>[
                  <String, dynamic>{
                    'id': 'testId',
                    'name': 'testName',
                    'active': true,
                    'organisation': <String, dynamic>{
                      'id': 'testOrgId',
                      'description': 'testOrgDescription',
                    },
                  },
                  <String, dynamic>{
                    'id': 'testId2',
                    'name': 'testName2',
                    'active': true,
                    'organisation': <String, dynamic>{
                      'id': 'testOrgId2',
                      'description': 'testOrgDescription2',
                    },
                  },
                ]
              }
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(checkIfPhoneExistsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'checkIfPhoneExists': true}
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(getProgramFacilitiesQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'getProgramFacilities': mockFacilities}
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(listMembersQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'listMembers': listMembersMock,
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains(searchClientQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'data': clientResponseMock}),
          201,
        ),
      );
    }

    if (queryString.contains(searchCaregiverUserQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'data': caregiverResponseMock}),
          201,
        ),
      );
    }

    if (queryString.contains(recentlySharedHealthDiaryQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'data': mockDiaryEntry}),
          201,
        ),
      );
    }

    if (queryString.contains(listNotificationsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'data': mockNotificationsResponse}),
          201,
        ),
      );
    }

    if (queryString.contains(searchStaffMemberQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'data': staffMembersResponseMock}),
          201,
        ),
      );
    }

    if (queryString.contains(registerStaffMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'registerStaff': <String, dynamic>{
                  'id': '',
                  'active': false,
                  'staffNumber': '12345678',
                  'userID': 'some-id',
                  'defaultFacility': '',
                }
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(verifyClientPinResetServiceRequestMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'verifyClientPinResetServiceRequest': true
              }
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(verifyStaffPinResetServiceRequestQMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'verifyStaffPinResetServiceRequest': true
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(inviteUserMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'inviteUser': true}
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(listSurveysQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': surveysMock,
          }),
          200,
        ),
      );
    }

    if (queryString.contains(getSurveyWithServiceRequestQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': surveyServiceRequestsMock,
          }),
          200,
        ),
      );
    }

    if (queryString.contains(listSurveyRespondentsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'data': surveyRespondentsMock}),
          200,
        ),
      );
    }
    if (queryString.contains(getSurveyServiceRequestUserQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{'data': surveyServiceRequestsRespondentsMock},
          ),
          200,
        ),
      );
    }

    if (queryString.contains(getAvailableFacilityScreeningToolsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getFacilityRespondedScreeningTools': <String, dynamic>{
                'screeningTools': <dynamic>[
                  <String, dynamic>{
                    'id': 'some-id',
                    'active': true,
                    'questionnaireID': 'some-id',
                    'questionnaire': <String, dynamic>{
                      'id': 'some-id',
                      'active': true,
                      'name': 'TB Assessment',
                      'description': 'TB Description'
                    }
                  },
                  <String, dynamic>{
                    'id': 'some-id',
                    'active': true,
                    'questionnaireID': 'some-id',
                    'questionnaire': <String, dynamic>{
                      'id': 'some-id',
                      'active': true,
                      'name': 'Violence Assessment',
                      'description': 'Violence Description'
                    }
                  },
                  <String, dynamic>{
                    'id': 'some-id',
                    'active': true,
                    'questionnaireID': 'some-id',
                    'questionnaire': <String, dynamic>{
                      'id': 'some-id',
                      'active': true,
                      'name': 'Contraceptive Assessment',
                      'description': 'Contraceptive Description'
                    }
                  },
                  <String, dynamic>{
                    'id': 'some-id',
                    'active': true,
                    'questionnaireID': 'some-id80b1',
                    'questionnaire': <String, dynamic>{
                      'id': 'some-id',
                      'active': true,
                      'name': 'Alcohol and substance Assessment',
                      'description': 'Alcohol and substance Description'
                    }
                  }
                ],
                'pagination': <String, dynamic>{
                  'currentPage': 1,
                  'limit': 10,
                  'count': 1,
                  'totalPages': 1,
                  'nextPage': null,
                  'previousPage': null
                }
              }
            }
          }),
          200,
        ),
      );
    }
    if (queryString.contains(getAssessmentResponsesByToolTypeQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'getScreeningToolRespondents': <String, dynamic>{
                  'screeningToolRespondents': <dynamic>[
                    mockAssessmentResponsesByToolType,
                    mockAssessmentResponsesByToolType
                  ]
                }
              },
            },
          ),
          200,
        ),
      );
    }
    if (queryString.contains(resolveServiceRequestMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'resolveServiceRequest': true,
            }
          }),
          200,
        ),
      );
    }
    if (queryString.contains(readNotificationsMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'readNotifications': true,
              }
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(sendClientSurveyLinksMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'sendClientSurveyLinks': true,
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(retrieveFacilityQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'retrieveFacility': <String, dynamic>{
                  'code': 12345,
                  'id': 'test',
                  'phone': '0712345678',
                },
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(addFacilityContactMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'addFacilityContact': true,
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(getScreeningToolServiceRequestResponsesQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getScreeningToolResponse': <String, dynamic>{
                'id': 'some-id',
                'screeningToolID': 'tool-id',
                'facilityID': 'facility-id',
                'clientID': 'client-id',
                'questionResponses': <dynamic>[
                  <String, dynamic>{
                    'questionType': 'CLOSE_ENDED',
                    'selectMultiple': false,
                    'responseValueType': 'STRING',
                    'sequence': 1,
                    'questionText':
                        'Have you experienced a cough for any duration?',
                    'normalizedResponse': <String, dynamic>{'0': 'Yes'}
                  },
                  <String, dynamic>{
                    'questionType': 'CLOSE_ENDED',
                    'selectMultiple': false,
                    'responseValueType': 'STRING',
                    'sequence': 2,
                    'questionText': 'Do you have a fever?',
                    'normalizedResponse': <String, dynamic>{'0': 'Yes'}
                  },
                  <String, dynamic>{
                    'questionType': 'CLOSE_ENDED',
                    'selectMultiple': false,
                    'responseValueType': 'STRING',
                    'sequence': 2,
                    'questionText': 'Do you have a fever?',
                    'normalizedResponse': <String, dynamic>{'0': 'Yes'}
                  },
                  <String, dynamic>{
                    'questionType': 'CLOSE_ENDED',
                    'selectMultiple': false,
                    'responseValueType': 'STRING',
                    'sequence': 4,
                    'questionText': 'Do you experience night sweats?',
                    'normalizedResponse': <String, dynamic>{'0': 'Yes'}
                  }
                ]
              }
            }
          }),
          200,
        ),
      );
    }

    return Future<http.Response>.value(
      http.Response(json.encode(<String, dynamic>{}), 201),
    );
  }
}

final List<Map<String, dynamic>> mockFacilities = <Map<String, dynamic>>[
  <String, dynamic>{
    'id': 'some-id',
    'name': 'Test Facility',
    'identifier': <String, dynamic>{
      'id': 'some-id',
      'value': '1234',
      'type': 'MFL_CODE'
    },
    'description': '',
    'phone': '',
    'active': true,
    'county': 'Test',
    'fhirOrganisationID': '',
    'workStationDetails': <String, dynamic>{
      'notifications': 1,
      'messages': 1,
      'serviceRequests': 1
    }
  },
  <String, dynamic>{
    'id': 'some-id2',
    'name': 'Kanairo',
    'identifier': <String, dynamic>{
      'id': 'some-id',
      'value': '5678',
      'type': 'MFL_CODE'
    },
    'description': 'Kanairo Hospital',
    'phone': '',
    'active': true,
    'county': 'Kanairo',
    'fhirOrganisationID': '',
    'workStationDetails': <String, dynamic>{
      'notifications': 1,
      'messages': 1,
      'serviceRequests': 1
    }
  },
];

Map<String, dynamic> mockSecurityQuestion = <String, dynamic>{
  'securityQuestionID': 'id',
  'questionStem': 'What are the last 4 digits of your CCC number?',
  'description': 'description',
  'responseType': 'NUMBER',
  'active': true,
};

Map<String, dynamic> mockSecurityQuestionResponse = <String, dynamic>{
  'id': 'id',
  'timeStamp': '2021-05-06T05:34:24Z',
  'userId': 'userId',
  'securityQuestionId': 'securityQuestionId',
  'response': 'response',
};

Map<String, dynamic> helpCenterFAQMock = <String, dynamic>{
  'data': <String, dynamic>{
    'getFaqsContent': <dynamic>[
      <String, dynamic>{
        'id': '5f89b9120251c700391da360',
        'createdAt': '2020-10-16T18:15:30+03:00',
        'excerpt': 'PRO',
        'featureImage':
            'https://images.unsplash.com/photo-1525466760727-1d8be8721154?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=2000&fit=max&ixid=eyJhcHBfaWQiOjExNzczfQ',
        'html': 'Reach 100 percent coverage first',
        'publishedAt': '2020-10-16T18:19:34+03:00',
        'slug': 'how-to-add-your-cover',
        'title': 'How to add your cover',
        'readingTime': 0,
        'tags': <dynamic>[
          <String, dynamic>{
            'id': '5f89b94a0251c700391da364',
            'name': 'faqs',
            'slug': 'faqs'
          }
        ]
      }
    ]
  }
};

Map<String, dynamic> mockFAQtag = <String, dynamic>{
  'id': '5f89b94a0251c700391da364',
  'name': 'faqs',
  'slug': 'faqs',
};

final Map<String, dynamic> mockUser = <String, dynamic>{
  'userID': 'UNKNOWN',
  'userName': 'UNKNOWN',
  'firstName': 'UNKNOWN',
  'lastName': 'UNKNOWN',
  'name': 'UNKNOWN',
  'userType': 'UNKNOWN',
  'gender': core.Gender.unknown.name,
  'active': false,
  'primaryContact': <String, dynamic>{
    'ID': 'UNKNOWN',
    'ContactType': 'PHONE',
    'ContactValue': 'UNKNOWN',
    'Active': false,
    'OptedIn': false,
  },
  'lastSuccessfulLogin': 'UNKNOWN',
  'lastFailedLogin': 'UNKNOWN',
  'failedLoginCount': 0,
  'nextAllowedLogin': 'UNKNOWN',
  'pinChangeRequired': false,
  'hasSetPin': false,
  'isPhoneVerified': false,
  'hasSetSecurityQuestions': false,
  'termsAccepted': false,
  'acceptedTermsID': 0,
  'suspended': false,
  'avatar': 'UNKNOWN'
};
final Map<String, dynamic> mockUserData = <String, dynamic>{
  'ID': 'testID',
  'Username': 'test user',
  'Name': 'test user',
  'Contacts': <String, dynamic>{'contactValue': '1779185060'}
};

final Map<String, dynamic> mockProgramData = <String, dynamic>{
  'id': 'bbe653e3-4159-44a0-8f75-ff1af971521f',
  'active': true,
  'name': 'Mycarehub',
  'description': '',
  'organisation': <String, dynamic>{
    'id': '4181df12-ca96-4f28-b78b-8e8ad88b25df',
    'name': 'Savannah Informatics Global Health Institute',
    'description': 'Savannah Informatics Global Health Institute'
  },
  'facilities': mockFacilities
};

final Map<String, dynamic> mockLoginUser = <String, dynamic>{
  'userID': 'UNKNOWN',
  'userName': 'UNKNOWN',
  'firstName': 'John',
  'lastName': 'Doe',
  'name': 'John Doe',
  'userType': 'UNKNOWN',
  'gender': core.Gender.unknown.name,
  'active': false,
  'primaryContact': <String, dynamic>{
    'contactType': 'PHONE',
    'contactValue': 'UNKNOWN',
    'active': false,
    'optedIn': false,
  },
  'lastSuccessfulLogin': 'UNKNOWN',
  'lastFailedLogin': 'UNKNOWN',
  'failedLoginCount': 0,
  'nextAllowedLogin': 'UNKNOWN',
  'pinChangeRequired': false,
  'hasSetPin': false,
  'isPhoneVerified': false,
  'hasSetSecurityQuestions': false,
  'termsAccepted': false,
  'acceptedTermsID': 0,
  'suspended': false,
  'avatar': 'UNKNOWN'
};

final Map<String, dynamic> mockUserProfile = <String, dynamic>{
  'id': 'UNKNOWN',
  'user_id': 'UNKNOWN',
  'active': false,
  'staff_number': 'UNKNOWN',
  'facilities': <dynamic>[],
  'default_facility': 'UNKNOWN',
  'user': mockUser,
  'userState': <String, dynamic>{
    'userProfile': <String, dynamic>{
      'id': 'UNKNOWN',
      'userName': 'UNKNOWN',
      'primaryPhone': null,
      'primaryEmailAddress': 'unknown@email.co.ke',
      'secondaryPhoneNumbers': null,
      'secondaryEmailAddresses': null,
      'terms_accepted': false,
      'suspended': false,
      'photoUploadID': 'UNKNOWN',
      'covers': null,
      'userBioData': <String, dynamic>{
        'firstName': 'UNKNOWN',
        'lastName': 'UNKNOWN',
        'dateOfBirth': 'UNKNOWN',
        'gender': 'unknown'
      },
      'homeAddress': null,
      'workAddress': null,
      'referralLink': null,
      'assistant': null
    },
    'customerProfile': null,
    'communicationSettings': <String, dynamic>{
      'profileID': 'UNKNOWN',
      'allowWhatsApp': false,
      'allowTextSMS': false,
      'allowPush': false,
      'allowEmail': false
    },
    'auth': <String, dynamic>{
      'customToken': 'UNKNOWN',
      'id_token': 'UNKNOWN',
      'expires_in': 'UNKNOWN',
      'refresh_token': 'UNKNOWN',
      'uid': 'UNKNOWN',
      'is_admin': false,
      'is_anonymous': true,
      'can_experiment': false,
      'change_pin': null
    },
    'isSignedIn': false,
    'signedInTime': 'UNKNOWN',
    'inActivitySetInTime': 'UNKNOWN',
    'tokenExpiryTime': 'UNKNOWN'
  }
};

final List<dynamic> mockServiceRequestsResponse = <dynamic>[
  <String, dynamic>{
    'id': 'test',
    'requestType': 'RED_FLAG',
    'request': 'test',
    'clientID': 'test',
    'facilityID': 'test',
    'clientName': 'test',
    'clientContact': 'test',
    'resolvedAt': 'test',
    'resolvedBy': 'test',
    'resolvedByName': 'test',
    'createdAt': '2022-02-09T08:40:46Z'
  },
  <String, dynamic>{
    'id': 'test',
    'requestType': 'STAFF_PIN_RESET',
    'request': 'I have not been myself lately',
    'clientID': 'test',
    'facilityID': 'test',
    'clientName': 'Calvin Ojiambo',
    'clientContact': '+254712345678',
    'staffName': 'Calvin Ojiambo',
    'staffContact': '+254712345678',
    'resolvedAt': '2022-02-09T08:40:46Z',
    'resolvedBy': 'test',
    'resolvedByName': 'test',
    'createdAt': '2022-02-09T08:40:46Z',
    'meta': <String, dynamic>{
      'ccc_number': '1234567890',
      'is_ccc_number_valid': true
    }
  },
  <String, dynamic>{
    'id': 'test',
    'requestType': 'PIN_RESET',
    'request': 'I am feeling very bad',
    'clientID': 'test',
    'facilityID': 'test',
    'clientName': 'Jenny McLaren',
    'clientContact': '+254712345678',
    'staffName': 'Jenny McLaren',
    'staffContact': '+254712345678',
    'resolvedAt': 'test',
    'resolvedBy': 'test',
    'resolvedByName': 'test',
    'createdAt': '2022-02-09T08:40:46Z',
    'meta': <String, dynamic>{
      'ccc_number': '1234567890',
      'is_ccc_number_valid': false
    }
  },
  <String, dynamic>{
    'id': 'test',
    'requestType': 'SCREENING_TOOLS_RED_FLAG',
    'request': 'I have not been myself lately',
    'clientID': 'test',
    'facilityID': 'test',
    'clientName': 'Calvin Ojiambo',
    'clientContact': '+254712345678',
    'staffName': 'Calvin Ojiambo',
    'staffContact': '+254712345678',
    'resolvedAt': '2022-02-09T08:40:46Z',
    'resolvedBy': 'test',
    'resolvedByName': 'test',
    'createdAt': '2022-02-09T08:40:46Z',
    'meta': <String, dynamic>{
      'ccc_number': '1234567890',
      'is_ccc_number_valid': true
    }
  },
  <String, dynamic>{
    'id': 'test',
    'request': 'I have not been myself lately',
    'clientID': 'test',
    'facilityID': 'test',
    'clientName': 'Calvin Ojiambo',
    'clientContact': '+254712345678',
    'staffName': 'Calvin Ojiambo',
    'staffContact': '+254712345678',
    'resolvedAt': '2022-02-09T08:40:46Z',
    'resolvedBy': 'test',
    'resolvedByName': 'test',
    'createdAt': '2022-02-09T08:40:46Z',
    'meta': <String, dynamic>{
      'ccc_number': '1234567890',
      'is_ccc_number_valid': true
    }
  },
];

final Map<String, dynamic> mockServiceRequests = <String, dynamic>{
  'getServiceRequests': mockServiceRequestsResponse
};
final Map<String, dynamic> mockSearchServiceRequests = <String, dynamic>{
  'searchServiceRequests': mockServiceRequestsResponse
};

final Map<String, dynamic> mockNotificationFiltersResponse = <String, dynamic>{
  'fetchNotificationTypeFilters': <dynamic>[
    <String, dynamic>{'name': 'Communities', 'enum': 'COMMUNITIES'},
    <String, dynamic>{'name': 'Moderator Demotion', 'enum': 'DEMOTE_MODERATOR'},
  ]
};

final Map<String, dynamic> groupStateMock = <String, dynamic>{
  'listCommunityMembers': <dynamic>[
    <String, dynamic>{
      'user': <String, dynamic>{
        'id': core.UNKNOWN,
        'userID': core.UNKNOWN,
        'name': core.UNKNOWN,
        'role': core.UNKNOWN,
        'username': core.UNKNOWN,
        'gender': 'unknown',
        'extraData': <String, dynamic>{
          'bannedInCommunity': false,
        }
      },
      'isModerator': true,
    },
  ],
};

final Map<String, dynamic> mockSurvey = <String, dynamic>{
  'projectId': 2,
  'name': 'project-name',
};

final Map<String, dynamic> mockServiceRequestSurveySurvey = <String, dynamic>{
  'projectID': 2,
  'title': 'project-name',
  'formID': '2',
  'linkID': '2',
};

final Map<String, dynamic> mockSurveyRespondent = <String, dynamic>{
  'id': 'some-id',
  'name': 'John  Doe',
  'projectID': 1,
  'submitterID': 1,
  'formID': 'some-id'
};

final Map<String, dynamic> mockSurveyResponse = <String, dynamic>{
  'question': 'testQ',
  'answer': <dynamic>['testA'],
};

final Map<String, dynamic> surveysMock = <String, dynamic>{
  'listSurveys': <dynamic>[
    mockSurvey,
    mockSurvey,
  ],
};

final Map<String, dynamic> surveyServiceRequestsMock = <String, dynamic>{
  'getSurveyWithServiceRequest': <dynamic>[
    mockServiceRequestSurveySurvey,
    mockServiceRequestSurveySurvey,
  ],
};

final Map<String, dynamic> surveyRespondentsMock = <String, dynamic>{
  'listSurveyRespondents': <String, dynamic>{
    'surveyRespondents': <dynamic>[
      mockSurveyRespondent,
      mockSurveyRespondent,
    ],
  }
};

final Map<String, dynamic> surveyServiceRequestsRespondentsMock =
    <String, dynamic>{
  'getSurveyServiceRequestUser': <String, dynamic>{
    'users': <dynamic>[
      mockSurveyRespondent,
      mockSurveyRespondent,
    ],
  }
};

final Map<String, dynamic> clientResponseMock = <String, dynamic>{
  'searchClientUser': <dynamic>[
    <String, dynamic>{
      'id': 'some-id',
      'identifiers': <dynamic>[
        <String, dynamic>{'id': 'testId', 'type': 'CCC', 'value': 'myCCCNumber'}
      ],
      'active': true,
      'user': <String, dynamic>{
        'id': 'some-id',
        'username': 'Username',
        'name': 'User Name',
        'active': false,
        'termsAccepted': false,
        'contacts': <String, dynamic>{
          'contactType': 'PHONE',
          'contactValue': '07000000',
          'active': false,
          'optedIn': false,
        }
      }
    }
  ]
};

final Map<String, dynamic> caregiverResponseMock = <String, dynamic>{
  'searchCaregiverUser': <dynamic>[
    <String, dynamic>{
      'id': 'some-id',
      'caregiverNumber': '1234',
      'user': <String, dynamic>{
        'id': 'some-id',
        'username': 'Username',
        'name': 'User Name',
        'contacts': <String, dynamic>{
          'contactType': 'PHONE',
          'contactValue': '07000000',
        }
      },
      'isClient': true
    }
  ]
};

final Map<String, dynamic> staffMembersResponseMock = <String, dynamic>{
  'searchStaffUser': <dynamic>[
    <String, dynamic>{
      'id': 'some-id',
      'cccNumber': '12345',
      'active': true,
      'user': <String, dynamic>{
        'id': 'some-id',
        'username': 'Username',
        'name': 'User Name',
        'active': false,
        'termsAccepted': false,
        'contacts': <String, dynamic>{
          'contactType': 'PHONE',
          'contactValue': '07000000',
          'active': false,
          'optedIn': false,
        }
      },
      'staffNumber': 'some-id'
    },
  ]
};

final Map<String, dynamic> mockMiscState = <String, dynamic>{
  'message': 'UNKNOWN',
  'otpCode': 'UNKNOWN',
  'acceptedTerms': false,
  'faqList': <dynamic>[],
  'eventState': <String, dynamic>{
    'eventName': 'UNKNOWN',
    'eventPayload': 'UNKNOWN'
  },
  'createPin': 'UNKNOWN',
  'resumeWithPin': false,
  'confirmPin': 'UNKNOWN',
  'accountExists': false,
  'invalidPin': false,
  'patientSearchTerm': null,
  'hasCompletedEnteringOTP': false,
  'isResendingOTP': false,
  'initialRoute': AppRoutes.loginPage,
  'profileFAQsContentState': <String, dynamic>{
    'profileFAQs': <dynamic>[],
    'errorFetchingFAQs': false,
    'timeoutFetchingFAQs': false
  },
  'groupState': groupStateMock,
  'searchUserResponseState': mockSearchUserResponseState,
};

final Map<String, dynamic> mockSearchUserResponseState = <String, dynamic>{
  'searchUserResponses': <dynamic>[],
  'selectedSearchUserResponse': <String, dynamic>{
    'ID': core.UNKNOWN,
    'CCCNumber': core.UNKNOWN,
    'StaffNumber': core.UNKNOWN,
    'Active': true,
    'rolesList': <String, dynamic>{'getUserRoles': <dynamic>[]},
    'User': <String, dynamic>{
      'ID': core.UNKNOWN,
      'Username': core.UNKNOWN,
      'TermsAccepted': false,
      'Active': false,
      'Contacts': <String, dynamic>{
        'ID': core.UNKNOWN,
        'Active': false,
        'ContactType': 'PHONE',
        'ContactValue': core.UNKNOWN,
        'OptedIn': false
      },
    }
  },
  'errorSearchingUser': false,
  'timeoutSearchingUser': false,
  'noUserFound': null,
};

final Map<String, dynamic> mockOnboardingState = <String, dynamic>{
  'termsAndConditions': <String, dynamic>{'termsID': 0, 'text': 'UNKNOWN'},
  'pin': 'UNKNOWN',
  'confirmPIN': 'UNKNOWN',
  'securityQuestions': <dynamic>[],
  'securityQuestionResponses': <dynamic>[],
  'invalidOTP': false,
  'otp': 'UNKNOWN',
  'failedToSendOTP': false,
  'canResendOTP': false,
  'invalidCredentials': false,
  'phoneNumber': 'UNKNOWN',
  'isPhoneVerified': false,
  'hasSetPin': false,
  'hasAcceptedTerms': false,
  'hasSetSecurityQuestions': false,
  'hasVerifiedSecurityQuestions': false,
  'hasSetNickName': false,
  'failedLoginCount': 0,
};

final Map<String, dynamic> appStateMock = <String, dynamic>{
  'credentials': <String, dynamic>{
    'expiresIn': 'UNKNOWN',
    'idToken': 'UNKNOWN',
    'refreshToken': 'UNKNOWN',
    'tokenExpiryTimestamp': 'UNKNOWN',
    'isSignedIn': false,
    'signedInTime': 'UNKNOWN',
  },
  'homeState': <String, dynamic>{},
  'onboardingState': mockOnboardingState,
  'bottomNavigationState': <String, dynamic>{'currentBottomNavIndex': 0},
  'miscState': mockMiscState,
  'userProfileState': mockUserProfile,
  'surveyState': <String, dynamic>{},
  'serviceRequestState': <String, dynamic>{
    'ServiceRequest': <String, dynamic>{},
    'pendingServiceRequests': <String, dynamic>{
      'total': 0,
      'requestsTypeCount': <dynamic>[]
    },
    'errorFetchingServiceRequests': false,
  },
  'connectivityState': <String, dynamic>{'isConnected': false},
};

final Map<String, dynamic> joinedMembersResponseMock = <String, dynamic>{
  'joined': <String, dynamic>{
    '@abiudrn:chat.savannahghi.org': loginResponseMock,
  }
};

final Map<String, dynamic> powerLevelsResponseMock = <String, dynamic>{
  'users': <String, dynamic>{
    '@abiudrn:chat.savannahghi.org': 100,
    '@salaton:chat.savannahghi.org': 100,
    '@kowalski:chat.savannahghi.org': 0,
  }
};

final Map<String, dynamic> mockLoginResponse = <String, dynamic>{
  'code': 0,
  'message': 'success',
  'response': <String, dynamic>{
    'credentials': <String, dynamic>{
      'expiresIn': '3600',
      'idToken': 'some id token',
      'refreshToken': 'some-refresh-token',
      'tokenExpiryTimestamp': 'UNKNOWN',
      'isSignedIn': false,
      'signedInTime': 'UNKNOWN',
    },
    'staffProfile': <String, dynamic>{
      'id': 'UNKNOWN',
      'user_id': 'UNKNOWN',
      'active': false,
      'staff_number': 'UNKNOWN',
      'facilities': <dynamic>[],
      'default_facility': 'UNKNOWN',
      'user': mockLoginUser,
    },
    'userProfile': <String, dynamic>{
      'id': 'testID',
      'name': 'test Username',
      'userID': 'UNKNOWN',
      'username': 'UNKNOWN',
      'firstName': 'firstName',
      'lastName': 'lastName',
      'userType': 'UNKNOWN',
      'gender': core.Gender.unknown.name,
      'active': false,
      'primaryContact': <String, dynamic>{
        'contactType': 'PHONE',
        'contactValue': 'UNKNOWN',
        'active': false,
        'optedIn': false,
      },
      'lastSuccessfulLogin': 'UNKNOWN',
      'lastFailedLogin': 'UNKNOWN',
      'failedLoginCount': 0,
      'nextAllowedLogin': 'UNKNOWN',
      'pinChangeRequired': false,
      'hasSetPin': false,
      'isPhoneVerified': false,
      'hasSetSecurityQuestions': false,
      'termsAccepted': false,
      'acceptedTermsID': 0,
      'suspended': false,
      'avatar': 'UNKNOWN'
    },
  }
};

final Map<String, dynamic> pinChangeRequiredMock = <String, dynamic>{
  'code': 0,
  'message': 'success',
  'response': <String, dynamic>{
    'credentials': <String, dynamic>{
      'expiresIn': '3600',
      'idToken': 'some id token',
      'refreshToken': 'some-refresh-token',
      'tokenExpiryTimestamp': 'UNKNOWN',
      'isSignedIn': false,
      'signedInTime': 'UNKNOWN',
    },
    'userProfile': <String, dynamic>{
      'id': 'UNKNOWN',
      'user_id': 'UNKNOWN',
      'active': false,
      'staff_number': 'UNKNOWN',
      'facilities': <dynamic>[],
      'default_facility': 'UNKNOWN',
      'userID': 'UNKNOWN',
      'userName': 'UNKNOWN',
      'firstName': 'John',
      'lastName': 'Doe',
      'name': 'John Doe',
      'userType': 'UNKNOWN',
      'gender': core.Gender.unknown.name,
      'primaryContact': <String, dynamic>{
        'contactType': 'PHONE',
        'contactValue': 'UNKNOWN',
        'active': false,
        'optedIn': false,
      },
      'lastSuccessfulLogin': 'UNKNOWN',
      'lastFailedLogin': 'UNKNOWN',
      'failedLoginCount': 0,
      'nextAllowedLogin': 'UNKNOWN',
      'pinChangeRequired': true,
      'pinUpdateRequired': true,
      'hasSetPin': false,
      'isPhoneVerified': false,
      'hasSetSecurityQuestions': false,
      'termsAccepted': false,
      'acceptedTermsID': 0,
      'suspended': false,
      'avatar': 'UNKNOWN'
    }
  }
};

final Map<String, dynamic> mockAuthCredentials = <String, dynamic>{
  'expiresIn': '3600',
  'idToken': 'some id token',
  'refreshToken': 'some refresh token'
};

final List<dynamic> securityQuestionsMock = <dynamic>[
  <String, dynamic>{
    'securityQuestionID': 'id1',
    'questionStem': 'What are the last 4 digits of your CCC number?',
    'description': 'Please provide the last 4 digits of your clinic number',
    'responseType': core.SecurityQuestionResponseType.UNKNOWN.name,
    'active': true,
  },
  <String, dynamic>{
    'securityQuestionID': 'id2',
    'questionStem': 'Which month did you start your treatment?',
    'description': 'Enter the month you started your treatment',
    'responseType': core.SecurityQuestionResponseType.DATE.name,
    'active': true,
  },
  <String, dynamic>{
    'securityQuestionID': 'id3',
    'questionStem': 'Which county is your clinic located?',
    'description': 'nter the name of the county in small letters',
    'responseType': core.SecurityQuestionResponseType.UNKNOWN.name,
    'active': true,
  },
];

Map<String, dynamic> mockRecordSecurityQuestionResponseData = <String, dynamic>{
  'recordSecurityQuestionResponses': recordSecurityQuestionResponseMock
};

final List<dynamic> recordSecurityQuestionResponseMock = <dynamic>[
  <String, dynamic>{
    'securityQuestionID': 'id1',
    'isCorrect': true,
  },
  <String, dynamic>{
    'securityQuestionID': 'id2',
    'isCorrect': true,
  },
  <String, dynamic>{
    'securityQuestionID': 'id3',
    'isCorrect': true,
  },
];

final List<dynamic> listMembersMock = <dynamic>[
  <String, dynamic>{
    'id': 'id1',
    'userID': 'some-user-id',
    'role': 'user',
    'userType': 'CLIENT',
    'username': 'Sam',
    'gender': core.Gender.male.name,
  },
  <String, dynamic>{
    'id': 'id1',
    'userID': 'some-user-id',
    'role': 'user',
    'userType': 'STAFF',
    'username': 'Jane',
    'gender': core.Gender.male.name,
    'extraData': <String, dynamic>{
      'bannedInCommunity': false,
      'userType': 'STAFF',
    }
  },
  <String, dynamic>{
    'id': 'id1',
    'userID': 'some-user-id',
    'role': 'user',
    'userType': 'STAFF',
    'username': 'Julian',
    'gender': core.Gender.male.name,
  },
];

final Map<String, dynamic> groupInfoPagePayloadMock = <String, dynamic>{
  'channelId': testString,
  'memberCount': 1,
  'channelName': 'Ruaraka Group'
};

final Map<String, dynamic> mockInvitedCommunities = <String, dynamic>{
  'invitedCommunities': <dynamic>[
    <String, dynamic>{
      'id': core.UNKNOWN,
      'name': core.UNKNOWN,
      'memberCount': 0,
      'description': core.UNKNOWN,
      'createdBy': <String, dynamic>{
        'id': core.UNKNOWN,
        'userID': core.UNKNOWN,
        'role': core.UNKNOWN,
        'username': core.UNKNOWN,
        'gender': core.Gender.unknown.name,
        'userType': core.UserType.CLIENT.name,
      },
    },
  ]
};

final Map<String, dynamic> mockCommunity = <String, dynamic>{
  'id': core.UNKNOWN,
  'name': core.UNKNOWN,
  'memberCount': 0,
  'description': core.UNKNOWN,
  'ageRange': <String, dynamic>{
    'lowerBound': 14,
    'upperBound': 20,
  },
  'createdBy': <String, dynamic>{
    'id': core.UNKNOWN,
    'userID': core.UNKNOWN,
    'role': core.UNKNOWN,
    'username': core.UNKNOWN,
    'gender': core.Gender.unknown.name,
    'userType': core.UserType.CLIENT.name,
  },
  'clientType': <String>['PMTCT']
};

final Map<String, dynamic> mockCommunitiesState = <String, dynamic>{
  'invitedCommunities': <dynamic>[],
  'flaggedMessages': <dynamic>[],
};

final Map<String, dynamic> mockPendingInvites = <String, dynamic>{
  'listPendingInvites': <dynamic>[
    <String, dynamic>{
      'id': '12345',
      'name': 'Test',
      'memberCount': 3,
      'gender': <dynamic>[],
      'description': '',
      'createdBy': null
    }
  ]
};

final Map<String, dynamic> mockDiaryEntry = <String, dynamic>{
  'getSharedHealthDiaryEntries': <dynamic>[
    <String, dynamic>{
      'id': 'some-id',
      'mood': 'HAPPY',
      'note': 'I am healthy',
      'sharedAt': '2021-11-30T16:17:57Z',
      'active': true,
    }
  ]
};

final List<Map<String, dynamic>> mockDiaryEntries = <Map<String, dynamic>>[
  <String, dynamic>{
    'id': 'some-id',
    'active': true,
    'mood': 'HAPPY',
    'note': 'I am healthy',
    'sharedAt': '2021-11-30T16:17:57Z'
  },
  <String, dynamic>{
    'id': 'some-id',
    'active': true,
    'mood': 'HAPPY',
    'note': 'I am very healthy',
    'sharedAt': '2021-11-30T16:17:53Z'
  },
];

final MockFirebaseMessaging kMockMessagingPlatform = MockFirebaseMessaging();

void setupFirebaseMessagingMocks() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setupFirebaseCoreMocks();

  // // Mock Platform Interface Methods
  // // ignore: invalid_use_of_protected_member
  when(kMockMessagingPlatform.delegateFor(app: anyNamed('app')))
      .thenReturn(kMockMessagingPlatform);
  // ignore: invalid_use_of_protected_member
  when(
    kMockMessagingPlatform.setInitialValues(
      isAutoInitEnabled: anyNamed('isAutoInitEnabled'),
    ),
  ).thenReturn(kMockMessagingPlatform);
}

Future<T> neverEndingFuture<T>() async {
  // ignore: literal_only_boolean_expressions
  while (true) {
    await Future<T>.delayed(const Duration(minutes: 5));
  }
}

class MockFirebaseMessaging extends Mock
    with MockPlatformInterfaceMixin
    implements FirebaseMessagingPlatform {
  MockFirebaseMessaging() {
    TestFirebaseMessagingPlatform();
  }

  @override
  bool get isAutoInitEnabled {
    return super.noSuchMethod(
      Invocation.getter(#isAutoInitEnabled),
      returnValue: true,
      returnValueForMissingStub: true,
    ) as bool;
  }

  @override
  FirebaseMessagingPlatform delegateFor({FirebaseApp? app}) {
    return super.noSuchMethod(
      Invocation.method(
        #delegateFor,
        <Object?>[],
        <Symbol, Object?>{#app: app},
      ),
      returnValue: TestFirebaseMessagingPlatform(),
      returnValueForMissingStub: TestFirebaseMessagingPlatform(),
    ) as FirebaseMessagingPlatform;
  }

  @override
  FirebaseMessagingPlatform setInitialValues({bool? isAutoInitEnabled}) {
    return super.noSuchMethod(
      Invocation.method(
        #setInitialValues,
        <Object?>[],
        <Symbol, Object?>{#isAutoInitEnabled: isAutoInitEnabled},
      ),
      returnValue: TestFirebaseMessagingPlatform(),
      returnValueForMissingStub: TestFirebaseMessagingPlatform(),
    ) as FirebaseMessagingPlatform;
  }

  @override
  Future<RemoteMessage?> getInitialMessage() {
    return super.noSuchMethod(
      Invocation.method(#getInitialMessage, <Object?>[]),
      returnValue: neverEndingFuture<RemoteMessage>(),
      returnValueForMissingStub: neverEndingFuture<RemoteMessage>(),
    ) as Future<RemoteMessage?>;
  }

  @override
  Future<void> deleteToken() {
    return super.noSuchMethod(
      Invocation.method(#deleteToken, <Object?>[]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Future<String?> getAPNSToken() {
    return super.noSuchMethod(
      Invocation.method(#getAPNSToken, <Object?>[]),
      returnValue: Future<String>.value(''),
      returnValueForMissingStub: Future<String>.value(''),
    ) as Future<String?>;
  }

  @override
  Future<String> getToken({String? vapidKey}) {
    return super.noSuchMethod(
      Invocation.method(
        #getToken,
        <Object?>[],
        <Symbol, Object?>{#vapidKey: vapidKey},
      ),
      returnValue: Future<String>.value(''),
      returnValueForMissingStub: Future<String>.value(''),
    ) as Future<String>;
  }

  @override
  Future<void> setAutoInitEnabled(bool? enabled) {
    return super.noSuchMethod(
      Invocation.method(#setAutoInitEnabled, <Object?>[enabled]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Stream<String> get onTokenRefresh {
    return super.noSuchMethod(
      Invocation.getter(#onTokenRefresh),
      returnValue: const Stream<String>.empty(),
      returnValueForMissingStub: const Stream<String>.empty(),
    ) as Stream<String>;
  }

  @override
  Future<NotificationSettings> requestPermission({
    bool? alert = true,
    bool? announcement = false,
    bool? badge = true,
    bool? carPlay = false,
    bool? criticalAlert = false,
    bool? provisional = false,
    bool? sound = true,
  }) {
    return super.noSuchMethod(
      Invocation.method(#requestPermission, <Object?>[], <Symbol, Object?>{
        #alert: alert,
        #announcement: announcement,
        #badge: badge,
        #carPlay: carPlay,
        #criticalAlert: criticalAlert,
        #provisional: provisional,
        #sound: sound
      }),
      returnValue: neverEndingFuture<NotificationSettings>(),
      returnValueForMissingStub: neverEndingFuture<NotificationSettings>(),
    ) as Future<NotificationSettings>;
  }

  @override
  Future<void> subscribeToTopic(String? topic) {
    return super.noSuchMethod(
      Invocation.method(#subscribeToTopic, <Object?>[topic]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Future<void> unsubscribeFromTopic(String? topic) {
    return super.noSuchMethod(
      Invocation.method(#unsubscribeFromTopic, <Object?>[topic]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }
}

class TestFirebaseMessagingPlatform extends FirebaseMessagingPlatform {
  TestFirebaseMessagingPlatform() : super();
}

final List<Map<String, dynamic>> contentMock = <Map<String, dynamic>>[
  <String, dynamic>{
    'ID': 1,
    'title': 'Tips on how to keep yourself healthy',
    'date': '2021-08-23T06:42:05.085216Z',
    'intro': 'Keep yourself healthy',
    'authorName': 'Abiud Orina',
    'authorAvatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
    'author': <String, dynamic>{'ID': 'some-id'},
    'itemType': 'ARTICLE',
    'timeEstimateSeconds': 180,
    'body':
        'The coronavirus pandemic has affected our lives, our economy, and nearly every corner of the globe. Almost 4 billion vaccine doses have been administered worldwide; 53 for every 100 people. But the worldwide numbers of infections continue to rise, driven by the Delta variant with highly vaccinated regions like Western Europe and the United States, where cases are relatively low but climbing fast. As cases continue to surge, you can take some steps to keep yourself and your family safe. Here are some tips from our trusted science team.',
    'heroImageRendition': <String, dynamic>{
      'url': 'https://i.postimg.cc/zvW46yxk/wellness.jpg',
    },
    'likeCount': 180,
    'bookmarkCount': 180,
    'viewCount': 180,
    'shareCount': 180,
    'hasSaved': false,
    'hasLiked': false,
    'documents': <dynamic>[],
    'isNew': true,
    'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    'meta': <String, dynamic>{
      'contentHTMLURL': 'https://mycarehub.co.ke/',
      'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    },
    'tagNames': <String>['Recommended', 'Health', 'Fitness'],
    'featuredMedia': <Map<String, dynamic>>[
      <String, dynamic>{
        'ID': 7,
        'url':
            'https://storage.googleapis.com/mycarehub-test/media/media/Background_Music_Soft_Piano_Music.aac',
        'title': 'Background',
        'type': 'audio',
        'width': 0,
        'duration': 6,
        'height': 0,
        'thumbnail': ''
      }
    ]
  },
  <String, dynamic>{
    'ID': 12,
    'title': 'Test article',
    'date': '2022-01-06',
    'intro': 'This is a test article',
    'authorName': 'John Ngugi',
    'tagNames': <String>['test'],
    'meta': <String, dynamic>{
      'contentType': 'content.ContentItem',
      'contentHTMLURL':
          'http://mycarehub-stage.savannahghi.org/health-education/test-article/',
      'slug': 'test-article',
      'showInMenus': false,
      'seoTitle': '',
      'searchDescription': '',
      'firstPublishedAt': '2022-01-06T09:18:42.024393+03:00',
      'locale': 'en'
    },
    'itemType': 'AUDIO_VIDEO',
    'timeEstimateSeconds': 6,
    'body': '<p data-block-key="9gd2w">Test article</p>',
    'heroImage': <String, dynamic>{'ID': 10, 'title': 'sunbeds3'},
    'heroImageRendition': <String, dynamic>{
      'url':
          'https://storage.googleapis.com/mycarehub-test/media/images/sunbeds3_VNXQPgI.2e16d0ba.fill-800x1200.jpegquality-60.jpg',
      'width': 800,
      'height': 1200,
      'alt': 'sunbeds3'
    },
    'likeCount': 6,
    'bookmarkCount': 2,
    'viewCount': 0,
    'shareCount': 1,
    'author': <String, dynamic>{'ID': 'cd92a709-c397-4b04-a963-709eb7e08486'},
    'categoryDetails': <Map<String, dynamic>>[
      <String, dynamic>{
        'ID': 6,
        'categoryName': 'recommended',
        'categoryIcon': ''
      }
    ],
    'featuredMedia': <Map<String, dynamic>>[
      <String, dynamic>{
        'ID': 2,
        'url':
            'https://storage.googleapis.com/mycarehub-test/media/media/Background_Music_Soft_Piano_Music_ppKS2s4.aac',
        'title': 'soft_piano_music',
        'type': 'audio',
        'duration': 141,
        'width': 0,
        'height': 0,
        'thumbnail': ''
      }
    ],
    'galleryImages': <Map<String, dynamic>>[
      <String, dynamic>{
        'ID': 1,
        'image': <String, dynamic>{
          'ID': 8,
          'title': 'Contrail',
          'meta': <String, dynamic>{
            'imageDownloadUrl':
                'https://storage.googleapis.com/mycarehub-test/media/original_images/jake-nackos-zAeD6Gug2PY-unsplash_IXYJr4K.jpg'
          }
        }
      },
      <String, dynamic>{
        'ID': 2,
        'image': <String, dynamic>{
          'ID': 7,
          'title': 'Plane_with_background',
          'meta': <String, dynamic>{
            'imageDownloadUrl':
                'https://storage.googleapis.com/mycarehub-test/media/original_images/vino-li-kpcJgsvpY3Q-unsplash_9w4CILs.jpg'
          }
        }
      },
      <String, dynamic>{
        'ID': 3,
        'image': <String, dynamic>{
          'ID': 9,
          'title': 'sunbeds3',
          'meta': <String, dynamic>{
            'imageDownloadUrl':
                'https://storage.googleapis.com/mycarehub-test/media/original_images/valentin-b-kremer-icXbm3QDw2w-unsplash_YNcTzbk.jpg'
          }
        }
      },
      <String, dynamic>{
        'ID': 4,
        'image': <String, dynamic>{
          'ID': 11,
          'title': 'syringe',
          'meta': <String, dynamic>{
            'imageDownloadUrl':
                'https://storage.googleapis.com/mycarehub-test/media/original_images/mika-baumeister-fPE_qTJu3Ws-unsplash_4NqBMVN.jpg'
          }
        }
      }
    ],
  },
  <String, dynamic>{
    'ID': 1,
    'title': 'Tips on how to keep yourself healthy',
    'date': '2021-08-23T06:42:05.085216Z',
    'intro': 'Keep yourself healthy',
    'authorName': 'Abiud Orina',
    'authorAvatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
    'author': <String, dynamic>{'ID': 'some-id'},
    'itemType': 'ARTICLE',
    'timeEstimateSeconds': 180,
    'body':
        'The coronavirus pandemic has affected our lives, our economy, and nearly every corner of the globe. Almost 4 billion vaccine doses have been administered worldwide; 53 for every 100 people. But the worldwide numbers of infections continue to rise, driven by the Delta variant with highly vaccinated regions like Western Europe and the United States, where cases are relatively low but climbing fast. As cases continue to surge, you can take some steps to keep yourself and your family safe. Here are some tips from our trusted science team.',
    'heroImageRendition': <String, dynamic>{
      'url': 'https://i.postimg.cc/zvW46yxk/wellness.jpg',
    },
    'likeCount': 180,
    'bookmarkCount': 180,
    'viewCount': 180,
    'shareCount': 180,
    'hasSaved': false,
    'hasLiked': false,
    'documents': <dynamic>[],
    'isNew': true,
    'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    'meta': <String, dynamic>{
      'contentHTMLURL': 'https://mycarehub.co.ke/',
      'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    },
    'tagNames': <String>['Recommended', 'Health', 'Fitness'],
    'featuredMedia': <Map<String, dynamic>>[
      <String, dynamic>{
        'ID': 7,
        'url':
            'https://storage.googleapis.com/mycarehub-test/media/media/Background_Music_Soft_Piano_Music.aac',
        'title': 'Background',
        'type': 'audio',
        'width': 0,
        'duration': 6,
        'height': 0,
        'thumbnail': ''
      }
    ],
    'galleryImages': <Map<String, dynamic>>[
      mockGalleryImage,
      mockGalleryImage,
      mockGalleryImage,
      mockGalleryImage,
      mockGalleryImage,
    ],
  },
];

final Map<String, dynamic> documentContentMock = <String, dynamic>{
  'id': 16,
  'title': 'Test Document',
  'date': '2022-01-13',
  'intro': 'This is a test document',
  'authorName': 'Test',
  'tagNames': <String>['test'],
  'meta': <String, dynamic>{
    'contentType': 'content.ContentItem',
    'contentHTMLURL': 'http://test-document/',
    'slug': 'test-document',
    'showInMenus': false,
    'seoTitle': '',
    'searchDescription': '',
    'firstPublishedAt': '2022-01-13T11:36:56.749531+03:00',
    'locale': 'en'
  },
  'itemType': 'PDF_DOCUMENT',
  'timeEstimateSeconds': 10,
  'body': '''
<p data-block-key="sg8u8">Test document</p>''',
  'heroImage': <String, dynamic>{'ID': 14, 'title': 'document'},
  'heroImageRendition': <String, dynamic>{
    'url': 'https://test.jpg',
    'width': 720,
    'height': 1080,
    'alt': 'document'
  },
  'likeCount': 0,
  'bookmarkCount': 0,
  'viewCount': 0,
  'shareCount': 0,
  'author': <String, dynamic>{'id': 'test-id-001'},
  'documents': <Map<String, dynamic>>[
    <String, dynamic>{
      'id': 10001,
      'document': <String, dynamic>{
        'id': 10001,
        'title': 'myCareHub Requirements',
        'meta': <String, dynamic>{
          'documentDetailUrl':
              'http://www.africau.edu/images/default/sample.pdf',
          'documentDownloadUrl':
              'http://www.africau.edu/images/default/sample.pdf'
        }
      }
    }
  ],
  'categoryDetails': <Map<String, dynamic>>[
    <String, dynamic>{
      'id': 6,
      'categoryName': 'recommended',
      'categoryIcon': 'https://test.png'
    }
  ],
};

final core.Content mockVideoContent =
    core.Content.fromJson(videoContentMock.first);

final List<Map<String, dynamic>> videoContentMock = <Map<String, dynamic>>[
  <String, dynamic>{
    'ID': 1,
    'title': 'Tips on how to keep yourself healthy',
    'date': '2021-08-23T06:42:05.085216Z',
    'intro': 'Keep yourself healthy',
    'authorName': 'Abiud Orina',
    'authorAvatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
    'author': <String, dynamic>{'ID': 'some-id'},
    'itemType': 'AUDIO_VIDEO',
    'timeEstimateSeconds': 180,
    'body':
        'The coronavirus pandemic has affected our lives, our economy, and nearly every corner of the globe. Almost 4 billion vaccine doses have been administered worldwide; 53 for every 100 people. But the worldwide numbers of infections continue to rise, driven by the Delta variant with highly vaccinated regions like Western Europe and the United States, where cases are relatively low but climbing fast. As cases continue to surge, you can take some steps to keep yourself and your family safe. Here are some tips from our trusted science team.',
    'heroImageRendition': <String, dynamic>{
      'url': 'https://i.postimg.cc/zvW46yxk/wellness.jpg',
    },
    'likeCount': 180,
    'bookmarkCount': 180,
    'viewCount': 180,
    'shareCount': 180,
    'hasSaved': false,
    'hasLiked': false,
    'documents': <dynamic>[],
    'isNew': true,
    'featuredMedia': <dynamic>[
      <String, dynamic>{
        'ID': 1,
        'url':
            'https://storage.googleapis.com/mycarehub-test/media/media/production_ID_4473012.mp4',
        'title': 'Awesome diet video',
        'type': 'video',
        'duration': 165,
        'width': 100,
        'height': 0,
        'thumbnail':
            'https://storage.googleapis.com/mycarehub-test/media/media_thumbnails/vitalii-pavlyshynets-kcRFW-Hje8Y-unsplash_1.jpg',
      }
    ],
    'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    'meta': <String, dynamic>{
      'contentHTMLURL': 'https://mycarehub.co.ke/',
      'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    },
    'tagNames': <String>['Recommended', 'Health', 'Fitness'],
  },
];

final Map<String, dynamic> mockGalleryImage = <String, dynamic>{
  'id': 2,
  'image': <String, dynamic>{
    'title': 'mockImage',
    'meta': <String, String>{'imageDownloadUrl': 'testImage'}
  }
};

final List<MethodCall> methodCallLog = <MethodCall>[];

void setupFirebaseAnalyticsMocks([Callback? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  setupFirebaseCoreMocks();

  MethodChannelFirebaseAnalytics.channel
      .setMockMethodCallHandler((MethodCall methodCall) async {
    methodCallLog.add(methodCall);
    switch (methodCall.method) {
      default:
        return false;
    }
  });
}

Map<String, dynamic> mockCreateProgramPayload = <String, dynamic>{
  'name': 'mycarehub',
  'description': 'Test',
  'organisationID': '9ec6e794-9e5c-4a40-8fa5-6d84f05c0eda',
};

final Map<String, dynamic> messageEventMock = <String, dynamic>{
  'type': 'm.room.message',
  'sender': '@abiudrn:chat.savannahghi.org',
  'content': <String, dynamic>{
    'org.matrix.msc1767.text': 'ala!',
    'body': 'ala!',
    'msgtype': 'm.text'
  },
  'event_id': '166896610153WDxHa:chat.savannahghi.org',
  'origin_server_ts': 1668966101714,
  'unsigned': <String, dynamic>{'age': 5484013963}
};
final Map<String, dynamic> syncResponseMock = <String, dynamic>{
  'next_batch': 'sample-next-batch',
  'presence': <String, dynamic>{
    'events': <Map<String, dynamic>>[
      <String, dynamic>{
        'type': 'm.presence',
        'sender': '@abiudrn:chat.savannahghi.org',
        'content': <String, dynamic>{
          'presence': 'online',
          'last_active_ago': 56,
          'currently_active': true
        }
      }
    ],
  },
  'rooms': <String, dynamic>{
    'join': <String, dynamic>{
      '!testRoom:chat.savannahghi.org': <String, dynamic>{
        'timeline': <String, dynamic>{
          'events': <Map<String, dynamic>>[
            <String, dynamic>{
              'type': 'm.room.message',
              'sender': '@test:chat.savannahghi.org',
              'content': <String, dynamic>{
                'org.matrix.msc1767.text': 'ala!',
                'body': 'ala!',
                'msgtype': 'm.text'
              },
              'event_id': 'test:chat.savannahghi.org',
              'origin_server_ts': 1668966101714,
            },
          ],
        },
        'state': <String, dynamic>{
          'events': <Map<String, dynamic>>[
            <String, dynamic>{
              'type': 'm.room.name',
              'sender': '@test:chat.savannahghi.org',
              'content': <String, dynamic>{'name': 'The Grand Gaming Squad'},
              'state_key': '',
              'event_id': 'test-event-id:chat.savannahghi.org',
              'origin_server_ts': 1668712693930,
              'unsigned': <String, dynamic>{'age': 5737421747}
            },
          ],
        },
        'unread_notifications': <String, dynamic>{
          'notification_count': 0,
          'highlight_count': 0
        },
        'summary': <String, dynamic>{
          'm.joined_member_count': 3,
          'm.invited_member_count': 0
        },
      }
    },
    'invite': <String, dynamic>{
      '!NvYSqaASzlfRpFCMtr:chat.savannahghi.org': <String, dynamic>{
        'invite_state': <String, dynamic>{
          'events': <Map<String, dynamic>>[
            <String, dynamic>{
              'type': 'm.room.topic',
              'state_key': '',
              'content': <String, dynamic>{
                'topic':
                    "A group about Arsenal's thrashing of Manchester United (3-2)"
              },
              'sender': '@test:chat.savannahghi.org'
            },
          ],
        }
      }
    },
    'knock': <String, dynamic>{},
    'leave': <String, dynamic>{},
  }
};

final Map<String, dynamic> loginResponseMock = <String, dynamic>{
  'user_id': '@abiudrn:chat.savannahghi.org',
  'device_id': 'some-device-id',
  'display_name': 'Abiud Orina',
  'access_token': 'some-sample-token',
  'avatar_url': 'some-avatar-url',
  'isSignedIn': true,
};

final Map<String, dynamic> roomMock = <String, dynamic>{
  'room_id': '!testRoom:chat.savannahghi.org',
  'topic': 'test topic',
  'timeline': <String, dynamic>{
    'events': <Map<String, dynamic>>[
      <String, dynamic>{
        'type': 'm.room.message',
        'sender': '@test:chat.savannahghi.org',
        'content': <String, dynamic>{
          'org.matrix.msc1767.text': 'ala!',
          'body': 'ala!',
          'msgtype': 'm.text'
        },
        'event_id': 'test:chat.savannahghi.org',
        'origin_server_ts': 1668966101714,
      },
    ],
  },
  'state': <String, dynamic>{
    'events': <Map<String, dynamic>>[
      <String, dynamic>{
        'type': 'm.room.name',
        'sender': '@test:chat.savannahghi.org',
        'content': <String, dynamic>{'name': 'The Grand Gaming Squad'},
        'state_key': '',
        'event_id': 'test-event-id:chat.savannahghi.org',
        'origin_server_ts': 1668712693930,
        'unsigned': <String, dynamic>{'age': 5737421747}
      },
    ],
  },
  'unread_notifications': <String, dynamic>{
    'notification_count': 0,
    'highlight_count': 0
  },
  'summary': <String, dynamic>{
    'm.joined_member_count': 3,
    'm.invited_member_count': 0
  },
};

final Map<String, dynamic> redactionEventMock = <String, dynamic>{
  'type': 'm.room.redaction',
  'sender': '!testRoom:chat.savannahghi.org',
  'room_id': '!testRoom:chat.savannahghi.org',
  'content': <String, dynamic>{},
  'redacts': 'test:chat.savannahghi.org',
  'event_id': 'test:chat.savannahghi.org',
  'origin_server_ts': 1674118003585,
};

final Map<String, dynamic> memberEventMock = <String, dynamic>{
  'type': 'm.room.member',
  'sender': '@abiudrn:chat.savannahghi.org',
  'content': <String, dynamic>{'membership': 'join', 'displayname': 'abiudrn'},
  'state_key': '@salaton:chat.savannahghi.org',
  'event_id': '16687126931TgVrw:chat.savannahghi.org',
  'origin_server_ts': 1668712693799,
};

final Map<String, dynamic> topicEventMock = <String, dynamic>{
  'type': 'm.room.topic',
  'sender': '@salaton:chat.savannahghi.org',
  'content': <String, dynamic>{'topic': 'All about gaming'},
  'state_key': '',
  'event_id': '16687126937jDnoh:chat.savannahghi.org',
  'origin_server_ts': 1668712693976,
};
final Map<String, dynamic> createEventMock = <String, dynamic>{
  'type': 'm.room.create',
  'sender': '@abiudrn:chat.savannahghi.org',
  'content': <String, dynamic>{
    'room_version': '1',
    'creator': '@abiudrn:chat.savannahghi.org'
  },
  'state_key': '',
  'event_id': '16687126930gHYFh:chat.savannahghi.org',
  'origin_server_ts': 1668712693753,
};
