import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/phase_two/presentation/facility_selection_page.dart';
import 'package:prohealth360_daktari/phase_two/presentation/widgets/general_workstation_widget.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/test_helpers.dart';

void main() {
  group('Facility Selection Page', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockTestGraphQlClient(),
        widget: FacilitySelectionPage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(GeneralWorkstationWidget), findsNWidgets(2));
    });

    testWidgets('displays snackbar incase of an error',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        graphQlClient: MockShortGraphQlClient.withResponse(
          '',
          '',
          Response(
            jsonEncode(<String, String>{'error': 'error occurred'}),
            500,
          ),
        ),
        widget: FacilitySelectionPage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
