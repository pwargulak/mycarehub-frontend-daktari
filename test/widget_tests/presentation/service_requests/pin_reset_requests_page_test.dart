import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/pin_reset_requests_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/identity_verification_action_dialog.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('PinResetRequestsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('accepting service request shows success message',
        (WidgetTester tester) async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'verifyClientPinResetServiceRequest': true,
              'getServiceRequests': <Map<String, dynamic>>[
                <String, dynamic>{
                  'id': 'some-id',
                  'requestType': 'PIN_RESET',
                  'clientName': 'John Doe',
                  'clientContact': '+254798000000',
                  'status': 'PENDING',
                  'meta': <String, dynamic>{
                    'ccc_number': '12345678',
                    'is_ccc_number_valid': true,
                  }
                },
                <String, dynamic>{
                  'id': 'some-id-2',
                  'requestType': 'PIN_RESET',
                  'clientName': 'Jane Doe',
                  'clientContact': '+254798123456',
                  'status': 'PENDING',
                  'meta': <String, dynamic>{
                    'ccc_number': '98745612',
                    'is_ccc_number_valid': true,
                  }
                }
              ],
              'searchServiceRequests': <Map<String, dynamic>>[
                <String, dynamic>{
                  'id': 'some-id',
                  'requestType': 'PIN_RESET',
                  'clientName': 'John Doe',
                  'clientContact': '+254798000000',
                  'status': 'PENDING',
                  'meta': <String, dynamic>{
                    'ccc_number': '12345678',
                    'is_ccc_number_valid': true,
                  }
                },
              ],
            }
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: client,
        widget: const PinResetRequestsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PinResetRequestsPage), findsOneWidget);

      final Finder acceptFinder =
          find.byKey(const ValueKey<String>('accept_key_some-id'));

      expect(acceptFinder, findsOneWidget);

      await tester.tap(acceptFinder);
      await tester.pumpAndSettle();
      expect(find.text(pinApprovedSuccessText), findsOneWidget);

      final Finder searchNameFinder = find.byType(CustomTextField);
      final Finder searchIconButton = find.byKey(searchIconButtonKey);
      expect(searchNameFinder, findsOneWidget);
      await tester.tap(searchNameFinder);
      await tester.enterText(searchNameFinder, 'test');

      await tester.tap(searchIconButton);
      await tester.pumpAndSettle();
      expect(find.text(pinApprovedSuccessText), findsOneWidget);
    });

    testWidgets(
        'accepting service request shows dialog when cccNumber is not valid',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'verifyClientPinResetServiceRequest': true,
              'getServiceRequests': <Map<String, dynamic>>[
                <String, dynamic>{
                  'id': 'some-id',
                  'requestType': 'PIN_RESET',
                  'clientName': 'John Doe',
                  'clientContact': '+254798000000',
                  'status': 'PENDING',
                  'meta': <String, dynamic>{
                    'ccc_number': '12345678',
                    'is_ccc_number_valid': false,
                  }
                },
                <String, dynamic>{
                  'id': 'some-id2',
                  'requestType': 'PIN_RESET',
                  'clientName': 'John Doe',
                  'clientContact': '+254798000000',
                  'status': 'PENDING',
                  'meta': <String, dynamic>{
                    'ccc_number': '12345678',
                    'is_ccc_number_valid': false,
                  }
                },
              ],
            }
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockShortGraphQlClient,
        widget: const PinResetRequestsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PinResetRequestsPage), findsOneWidget);

      final Finder acceptFinder =
          find.byKey(const ValueKey<String>('accept_key_some-id'));

      expect(acceptFinder, findsOneWidget);

      await tester.tap(acceptFinder);
      await tester.pumpAndSettle();
      expect(find.byType(IdentityVerificationActionDialog), findsOneWidget);

      final Finder checkbox = find.byKey(verifyPhysicalIdentityCheckboxKey);

      Checkbox checkboxFinder = tester.firstWidget(checkbox) as Checkbox;
      expect(checkboxFinder.value, false);

      await tester.tap(checkbox);
      await tester.pump();

      checkboxFinder = tester.firstWidget(checkbox) as Checkbox;
      expect(checkboxFinder.value, true);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pump(const Duration(seconds: 4));
      expect(find.text(pinApprovedSuccessText), findsOneWidget);
    });

    testWidgets('rejecting shows reject success message',
        (WidgetTester tester) async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'verifyClientPinResetServiceRequest': true,
              'getServiceRequests': <Map<String, dynamic>>[
                <String, dynamic>{
                  'id': 'some-id',
                  'requestType': 'PIN_RESET',
                  'clientName': 'John Doe',
                  'clientContact': '+254798000000',
                  'status': 'PENDING',
                },
                <String, dynamic>{
                  'id': 'some-id-2',
                  'requestType': 'PIN_RESET',
                  'clientName': 'Jane Doe',
                  'clientContact': '+254798123456',
                  'status': 'PENDING',
                }
              ],
            }
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: client,
        widget: const PinResetRequestsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PinResetRequestsPage), findsOneWidget);

      final Finder rejectFinder =
          find.byKey(const ValueKey<String>('reject_key_some-id'));

      expect(rejectFinder, findsOneWidget);

      await tester.tap(rejectFinder);
      await tester.pumpAndSettle();
      expect(find.text(pinRejectedSuccessText), findsOneWidget);
    });

    testWidgets('should show zero state if no more requests',
        (WidgetTester tester) async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getServiceRequests': <Map<String, dynamic>>[],
            }
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: client,
        widget: const PinResetRequestsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GenericErrorWidget), findsOneWidget);
      final Finder buttonTextFinder = find.text(actionTextGenericNoData);
      expect(buttonTextFinder, findsOneWidget);

      await tester.tap(buttonTextFinder);
      await tester.pumpAndSettle();
      expect(find.byType(PinResetRequestsPage), findsNothing);
    });

    testWidgets('tapping call button launches dialler',
        (WidgetTester tester) async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'verifyClientPinResetServiceRequest': true,
              'getServiceRequests': <Map<String, dynamic>>[
                <String, dynamic>{
                  'id': 'some-id',
                  'requestType': 'PIN_RESET',
                  'clientName': 'John Doe',
                  'clientContact': '+254798000000',
                  'status': 'PENDING',
                  'meta': <String, dynamic>{
                    'ccc_number': '12345678',
                    'is_ccc_number_valid': true,
                  }
                },
              ],
            }
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        graphQlClient: client,
        widget: const PinResetRequestsPage(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PinResetRequestsPage), findsOneWidget);

      final Finder phoneIcon = find.byIcon(Icons.phone_outlined);
      expect(phoneIcon, findsOneWidget);

      await tester.tap(phoneIcon);
      await tester.pumpAndSettle();
    });

    testWidgets(
      'should show GenericErrorWidget when there is no PIN resets when searching',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'getServiceRequests': <Map<String, dynamic>>[
                  <String, dynamic>{
                    'id': 'some-id',
                    'requestType': 'PIN_RESET',
                    'clientName': 'John Doe',
                    'clientContact': '+254798000000',
                    'status': 'PENDING',
                    'meta': <String, dynamic>{
                      'ccc_number': '12345678',
                      'is_ccc_number_valid': true,
                    }
                  }
                ],
                'searchServiceRequests': <dynamic>[]
              }
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          store: store,
          widget: const PinResetRequestsPage(),
        );
        await tester.pumpAndSettle();

        expect(find.byType(PinResetRequestsPage), findsOneWidget);

        final Finder acceptFinder =
            find.byKey(const ValueKey<String>('accept_key_some-id'));

        expect(acceptFinder, findsOneWidget);

        final Finder searchNameFinder = find.byType(CustomTextField);
        final Finder searchIconButton = find.byKey(searchIconButtonKey);
        expect(searchNameFinder, findsOneWidget);
        await tester.tap(searchNameFinder);
        await tester.enterText(searchNameFinder, 'test');

        await tester.tap(searchIconButton);
        await tester.pumpAndSettle();

        expect(acceptFinder, findsNothing);
        expect(find.byType(GenericErrorWidget), findsOneWidget);
      },
    );
    testWidgets(
      'should show an error widget when fetching PIN reset requests',
      (WidgetTester tester) async {
        final MockShortGraphQlClient mockShortGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{'error': 'some error occurred'}),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          graphQlClient: mockShortGraphQlClient,
          store: store,
          widget: const PinResetRequestsPage(),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);

        /// Refresh and expect the same thing
        await tester.ensureVisible(genericNoDataButton);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(helpNoDataWidgetKey));

        await tester.pumpAndSettle();
        expect(genericNoDataButton, findsOneWidget);
      },
    );
  });
}
