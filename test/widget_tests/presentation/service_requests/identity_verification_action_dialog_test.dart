// Package imports:
import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/presentation/service_requests/widgets/identity_verification_action_dialog.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('Appointments', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    final MockShortGraphQlClient mockLoadingShortGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{'loading': true}
        }),
        201,
      ),
    );

    testWidgets('should show a loading indicator when rescheduling',
        (WidgetTester tester) async {
      store.dispatch(
        WaitAction<AppState>.add(
          '${pinResetRequestFlag}_test_${PinResetState.APPROVED}',
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: mockLoadingShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const IdentityVerificationActionDialog(
                    cccNumber: 'test',
                    clientId: 'test',
                    phoneNumber: 'test',
                    pinResetState: PinResetState.APPROVED,
                    serviceRequestId: 'test',
                  );
                },
              ),
            );
          },
        ),
      );
      expect(find.byType(GestureDetector), findsOneWidget);
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
