import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/staff_search_widget.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/search_details_information_widget.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  group('StaffSearchWidget', () {
    setUp(() async {
      setupFirebaseMessagingMocks();
      await Firebase.initializeApp();
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: StaffSearchWidget(),
      );

      await tester.pumpAndSettle();
      expect(find.byType(SearchDetailsInformationWidget), findsWidgets);
      expect(find.text(appReInviteText), findsOneWidget);
    });
  });
  testWidgets('handle errors correctly', (WidgetTester tester) async {
    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint ',
      Response(
        json.encode(
          <String, dynamic>{'errors': 'an error occurred'},
        ),
        200,
      ),
    );

    await buildTestWidget(
      tester: tester,
      store: store,
      graphQlClient: mockShortSILGraphQlClient,
      widget: StaffSearchWidget(),
    );
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text(getErrorMessage('facilities linked to this user')), findsOneWidget);
  });
}
