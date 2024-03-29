import 'package:flutter/foundation.dart';

enum ChatStatus { Unknown, Accept, Reject }

enum SetPinStatus { IsChangingPin, IsSettingPin, IsResettingPin }

enum AuthTokenStatus { okay, requiresLogin, requiresPin }

enum ClientType {
  PMTCT,
  OVC,
  OTZ,
  OTZ_PLUS,
  HVL,
  DREAMS,
  HIGH_RISK,
  SPOUSES,
  YOUTH
}

extension ClientTypeEx on ClientType {
  String get name {
    return describeEnum(this).replaceAll('_', ' ');
  }
}

enum ServiceRequestType {
  RED_FLAG,
  PIN_RESET,
  STAFF_PIN_RESET,
  SCREENING_TOOLS_RED_FLAG,
  HOME_PAGE_HEALTH_DIARY_ENTRY,
  SURVEY_RED_FLAG,
  APPOINTMENTS,
  UNKNOWN
}

extension ServiceRequestTypeEx on ServiceRequestType {
  String get name {
    return describeEnum(this);
  }
}

enum RequestStatus { PENDING, RESOLVED, IN_PROGRESS, UNKNOWN }

extension RequestStatusEx on RequestStatus {
  String get name {
    return describeEnum(this);
  }
}

enum PinResetState { APPROVED, REJECTED }

extension PinResetStateExtension on PinResetState {
  String get name {
    return describeEnum(this);
  }
}

/// The current onboarding workflow that is running
///
/// [Login] stage is when a user is signing up normally. It was combined and
///  tweaked to handle signup as well because once a user has been invited they
///  will still have to login
///
/// [ChangePin] is used when the user's PIN has been changed by someone else
///  like their HCW or an admin
///
/// [PINExpired] is used when a user's PIN has expired
///
/// The [CurrentOnboardingStage] is stored in the [onboardingState] and must be
///  changed at the end of each workflow
enum CurrentOnboardingStage { Login, ResetPIN, PINExpired, PINUpdate }

enum ScreeningToolsType {
  VIOLENCE_ASSESSMENT,
  CONTRACEPTIVE_ASSESSMENT,
  TB_ASSESSMENT,
  ALCOHOL_SUBSTANCE_ASSESSMENT,
}

enum StreamUserType { STAFF, CLIENT }

/// The types of events that we will collect on myCareHub
enum AnalyticsEventType {
  // Navigation events
  NAVIGATION,

  // General app interactions i.e resolving service request
  INTERACTION,

  // Used for all authentication events e.g login, logout
  AUTH,

  // Connectivity events
  CONNECTIVITY,

  /// Events used in the onboarding workflow
  ONBOARDING
}

enum QuestionType { OPEN_ENDED, CLOSE_ENDED }

enum ConsentStatus { ACCEPTED, REJECTED, PENDING, UNKNOWN }
