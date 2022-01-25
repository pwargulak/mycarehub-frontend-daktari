// Flutter imports:
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_graphql_client/graph_sqlite.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/states/home/bottom_nav_state.dart';
import 'package:healthcloud/application/redux/states/home_state.dart';
import 'package:healthcloud/application/redux/states/misc_state.dart';
import 'package:healthcloud/application/redux/states/onboarding_state.dart';
import 'package:healthcloud/application/redux/states/survey_requests_state.dart';
import 'package:healthcloud/application/redux/states/survey_state.dart';
import 'package:healthcloud/domain/core/entities/core/staff_state.dart';
import 'package:healthcloud/infrastructure/repository/database_base.dart';
import 'package:healthcloud/infrastructure/repository/database_mobile.dart';
import 'package:healthcloud/infrastructure/repository/initialize_db.dart';

/// [AfyaMojaStateDatabase] is the middleware that interacts with the database
/// on behalf of the application. From the app's perspective, it doesn't care
/// which database its saving its state on. HCStateDatabase therefore offers
/// different implementations
/// for its method.
class AfyaMojaStateDatabase implements PersistorPrinterDecorator<AppState> {
  AfyaMojaStateDatabase({
    Duration throttle = const Duration(seconds: 2),
    Duration saveDuration = Duration.zero,
    required this.dataBaseName,
  })  : _throttle = throttle,
        _saveDuration = saveDuration;

  final Duration? _saveDuration;
  final Duration? _throttle;
  final String dataBaseName;

  @override
  Duration? get throttle => _throttle;

  Duration? get saveDuration => _saveDuration;

  @override
  Future<void> deleteState() async {
    await AfyaMojaDatabaseMobile<Database>(
      initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
    ).clearDatabase();
  }

  @override
  Future<void> persistDifference({
    AppState? lastPersistedState,
    required AppState newState,
  }) async {
    await Future<dynamic>.delayed(saveDuration!);

    if (lastPersistedState == null ||
        lastPersistedState.homeState != newState.homeState ||
        lastPersistedState.onboardingState != newState.onboardingState ||
        lastPersistedState.miscState != newState.miscState ||
        lastPersistedState.staffState != newState.staffState ||
        lastPersistedState.surveyState != newState.surveyState ||
        lastPersistedState.serviceRequestState !=
            newState.serviceRequestState) {
      await persistState(
        newState,
        AfyaMojaDatabaseMobile<Database>(
          initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
        ),
      );
    }
  }

  /// we first check whether the database is empty
  ///
  /// - if the database is empty, we return null
  /// - else, we retrieve the state from the database
  @override
  Future<AppState> readState() async {
    if (await AfyaMojaDatabaseMobile<Database>(
      initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
    ).isDatabaseEmpty()) {
      return AppState.initial();
    } else {
      return retrieveState(
        AfyaMojaDatabaseMobile<Database>(
          initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
        ),
      );
    }
  }

  @override
  Future<void> saveInitialState(AppState state) async {
    return persistDifference(newState: state);
  }

  /// initialize the database
  Future<void> init() async {
    await AfyaMojaDatabaseMobile<Database>(
      initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
    ).database;
  }

  @visibleForTesting
  Future<void> persistState(
    AppState newState,
    AfyaMojaDatabaseBase<dynamic> database,
  ) async {
    // save home state
    await database.saveState(
      data: newState.homeState!.toJson(),
      table: Tables.HomeState,
    );

    // save onboarding state
    await database.saveState(
      data: newState.onboardingState!.toJson(),
      table: Tables.OnboardingState,
    );

    // save bottom navigation state
    await database.saveState(
      data: newState.bottomNavigationState!.toJson(),
      table: Tables.BottomNavigationState,
    );

    // save MISC state
    await database.saveState(
      data: newState.miscState!.toJson(),
      table: Tables.MiscState,
    );

    // save staff state
    await database.saveState(
      data: newState.staffState!.toJson(),
      table: Tables.StaffState,
    );

    // save survey state
    await database.saveState(
      data: newState.surveyState!.toJson(),
      table: Tables.SurveyState,
    );

    // save service request state
    await database.saveState(
      data: newState.serviceRequestState!.toJson(),
      table: Tables.ServiceRequestState,
    );
  }

  @visibleForTesting
  Future<AppState> retrieveState(AfyaMojaDatabaseBase<dynamic> database) async {
    return AppState().copyWith(
      // retrieve home state
      homeState: HomeState.fromJson(
        await database.retrieveState(Tables.HomeState),
      ),

      // retrieve onboarding state
      onboardingState: OnboardingState.fromJson(
        await database.retrieveState(Tables.OnboardingState),
      ),

      // retrieve bottom navigation state
      bottomNavigationState: BottomNavigationState.fromJson(
        await database.retrieveState(Tables.BottomNavigationState),
      ),

      // retrieve MISC state
      miscState:
          MiscState.fromJson(await database.retrieveState(Tables.MiscState)),

      // retrieve staff state
      staffState: StaffState.fromJson(
        await database.retrieveState(Tables.StaffState),
      ),

      // retrieve survey state
      surveyState: SurveyState.fromJson(
        await database.retrieveState(Tables.SurveyState),
      ),

      // retrieve service request state
      serviceRequestState: ServiceRequestState.fromJson(
        await database.retrieveState(Tables.ServiceRequestState),
      ),

      wait: Wait(),
    );
  }
}
