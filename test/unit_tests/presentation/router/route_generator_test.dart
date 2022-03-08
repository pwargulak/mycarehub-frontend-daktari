// Flutter imports:
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myharehubpro/application/core/services/utils.dart';
import 'package:myharehubpro/domain/core/entities/notification/notification_details.dart';
// Project imports:
import 'package:myharehubpro/presentation/client_details/pages/client_health_page.dart';
import 'package:myharehubpro/presentation/communities/pages/community_list_page.dart';
import 'package:myharehubpro/presentation/community/group_info/pages/group_info_page.dart';
import 'package:myharehubpro/presentation/contact_admin/pages/contact_admin_page.dart';
import 'package:myharehubpro/presentation/create_group/create_group.dart';
import 'package:myharehubpro/presentation/create_group/invite_members/invite_members_page.dart';
import 'package:myharehubpro/presentation/engagement/home/pages/content_page.dart';
import 'package:myharehubpro/presentation/engagement/home/pages/home_page.dart';
import 'package:myharehubpro/presentation/engagement/home/pages/search_page.dart';
import 'package:myharehubpro/presentation/notifications/notifications_page.dart';
import 'package:myharehubpro/presentation/onboarding/create_pin/pages/create_new_pin_page.dart';
import 'package:myharehubpro/presentation/onboarding/login/pages/forgot_pin_page.dart';
import 'package:myharehubpro/presentation/onboarding/patient/add_new_patient_page.dart';
import 'package:myharehubpro/presentation/onboarding/security_questions/security_questions_page.dart';
import 'package:myharehubpro/presentation/onboarding/set_nickname/set_nickname_page.dart';
import 'package:myharehubpro/presentation/onboarding/terms/terms_and_conditions_page.dart';
import 'package:myharehubpro/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import 'package:myharehubpro/presentation/profile/pages/edit_information_page.dart';
import 'package:myharehubpro/presentation/profile/pages/settings_page.dart';
import 'package:myharehubpro/presentation/profile/pages/user_profile_page.dart';
import 'package:myharehubpro/presentation/router/route_generator.dart';
import 'package:myharehubpro/presentation/router/routes.dart';
import 'package:myharehubpro/presentation/service_requests/pages/pin_reset_requests_page.dart';
import 'package:myharehubpro/presentation/service_requests/pages/profile_update_requests_page.dart';
import 'package:myharehubpro/presentation/service_requests/pages/red_flags_page.dart';
import 'package:myharehubpro/presentation/service_requests/pages/resolved_service_requests_page.dart';
import 'package:myharehubpro/presentation/surveys/pages/surveys_page.dart';

import '../../../mocks/mocks.dart';

void main() {
  const Route<dynamic>? Function(RouteSettings settings) routeGenerator =
      RouteGenerator.generateRoute;

  final BuildContext context = MockBuildContext();

  test('Test router returns HomePage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.homePage);

    final MaterialPageRoute<HomePage> route =
        routeGenerator(settings)! as MaterialPageRoute<HomePage>;

    expect(route, isA<MaterialPageRoute<HomePage>>());
    expect(route.builder(context), isA<HomePage>());
  });

  test('Test router returns CreateNewPinPage', () {
    final MockConnectivityPlatform fakePlatform = MockConnectivityPlatform();
    ConnectivityPlatform.instance = fakePlatform;

    const RouteSettings settings = RouteSettings(name: AppRoutes.setPinPage);

    final MaterialPageRoute<CreateNewPINPage> route =
        routeGenerator(settings)! as MaterialPageRoute<CreateNewPINPage>;

    expect(route, isA<MaterialPageRoute<CreateNewPINPage>>());
    expect(route.builder(context), isA<CreateNewPINPage>());
  });

  test('Test router returns set nickname page', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.setNicknamePage);

    final MaterialPageRoute<SetNickNamePage> route =
        routeGenerator(settings)! as MaterialPageRoute<SetNickNamePage>;

    expect(route, isA<MaterialPageRoute<SetNickNamePage>>());
    expect(route.builder(context), isA<SetNickNamePage>());
  });

  test('Test router returns ContentPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.contentPage);

    final MaterialPageRoute<ContentPage> route =
        routeGenerator(settings)! as MaterialPageRoute<ContentPage>;

    expect(route, isA<MaterialPageRoute<ContentPage>>());
    expect(route.builder(context), isA<ContentPage>());
  });

  test('Test router returns CommunityListView', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.communityPage);

    final MaterialPageRoute<CommunityListPage>? route =
        routeGenerator(settings) as MaterialPageRoute<CommunityListPage>?;
    expect(route, isA<MaterialPageRoute<CommunityListPage>>());
    expect(route?.builder(context), isA<CommunityListPage>());
  });

  test('Test router returns NotificationsPage', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.notificationsPage,
      arguments: <NotificationDetails>[],
    );

    final MaterialPageRoute<NotificationsPage>? route =
        routeGenerator(settings) as MaterialPageRoute<NotificationsPage>?;
    expect(route, isA<MaterialPageRoute<NotificationsPage>>());
    expect(route?.builder(context), isA<NotificationsPage>());
  });

  test('Test router returns SecurityQuestionsPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.securityQuestionsPage);

    final MaterialPageRoute<SecurityQuestionsPage>? route =
        routeGenerator(settings) as MaterialPageRoute<SecurityQuestionsPage>?;
    expect(route, isA<MaterialPageRoute<SecurityQuestionsPage>>());
    expect(route?.builder(context), isA<SecurityQuestionsPage>());
  });

  test('Test router returns UserProfilePage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.profilePage);

    final MaterialPageRoute<UserProfilePage>? route =
        routeGenerator(settings) as MaterialPageRoute<UserProfilePage>?;
    expect(route, isA<MaterialPageRoute<UserProfilePage>>());
    expect(route?.builder(context), isA<UserProfilePage>());
  });

  test('Test router returns PINResetRequestsPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.pinResetRequestsPage);

    final MaterialPageRoute<PINResetRequestsPage>? route =
        routeGenerator(settings) as MaterialPageRoute<PINResetRequestsPage>?;
    expect(route, isA<MaterialPageRoute<PINResetRequestsPage>>());
    expect(route?.builder(context), isA<PINResetRequestsPage>());
  });

  test('Test router returns ForgotPinPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.forgotPinPage);

    final MaterialPageRoute<ForgotPinPage>? route =
        routeGenerator(settings) as MaterialPageRoute<ForgotPinPage>?;
    expect(route, isA<MaterialPageRoute<ForgotPinPage>>());
    expect(route?.builder(context), isA<ForgotPinPage>());
  });

  test('Test router returns AddNewPatientPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.addNewPatientPage);

    final MaterialPageRoute<AddNewPatientPage>? route =
        routeGenerator(settings) as MaterialPageRoute<AddNewPatientPage>?;
    expect(route, isA<MaterialPageRoute<AddNewPatientPage>>());
    expect(route?.builder(context), isA<AddNewPatientPage>());
  });

  test('Test router returns InviteMembersPage', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.inviteMembersPage,
      arguments: 'some-channel-id',
    );

    final MaterialPageRoute<InviteMembersPage>? route =
        routeGenerator(settings) as MaterialPageRoute<InviteMembersPage>?;
    expect(route, isA<MaterialPageRoute<InviteMembersPage>>());
    expect(route?.builder(context), isA<InviteMembersPage>());
  });

  test('Test router returns CreateGroupPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.addNewGroupPage);

    final MaterialPageRoute<CreateGroupPage>? route =
        routeGenerator(settings) as MaterialPageRoute<CreateGroupPage>?;
    expect(route, isA<MaterialPageRoute<CreateGroupPage>>());
    expect(route?.builder(context), isA<CreateGroupPage>());
  });

  test('Test router returns RedFlagsPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.redFlagsPage);

    final MaterialPageRoute<RedFlagsPage>? route =
        routeGenerator(settings) as MaterialPageRoute<RedFlagsPage>?;
    expect(route, isA<MaterialPageRoute<RedFlagsPage>>());
    expect(route?.builder(context), isA<RedFlagsPage>());
  });

  test('Test router returns  verify Phone page', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.verifyPhonePage,
      arguments: '0700111222',
    );

    final MaterialPageRoute<VerifyPhonePage>? route =
        routeGenerator(settings) as MaterialPageRoute<VerifyPhonePage>?;

    expect(route, isA<MaterialPageRoute<VerifyPhonePage>>());
    expect(route?.builder(context), isA<VerifyPhonePage>());
  });

  test('Test router returns ProfileUpdateRequestsPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.profileUpdateRequestsPage);

    final MaterialPageRoute<ProfileUpdateRequestsPage>? route =
        routeGenerator(settings)
            as MaterialPageRoute<ProfileUpdateRequestsPage>?;
    expect(route, isA<MaterialPageRoute<ProfileUpdateRequestsPage>>());
    expect(route?.builder(context), isA<ProfileUpdateRequestsPage>());
  });

  test('Test router returns SearchPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.searchPage);

    final MaterialPageRoute<SearchPage>? route =
        routeGenerator(settings) as MaterialPageRoute<SearchPage>?;
    expect(route, isA<MaterialPageRoute<SearchPage>>());
    expect(route?.builder(context), isA<SearchPage>());
  });

  test('Test router returns ClientHealthPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.clientHealthPage);

    final MaterialPageRoute<ClientHealthPage>? route =
        routeGenerator(settings) as MaterialPageRoute<ClientHealthPage>?;
    expect(route, isA<MaterialPageRoute<ClientHealthPage>>());
    expect(route?.builder(context), isA<ClientHealthPage>());
  });

  test('Test router returns TermsAndConditionsPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.termsAndConditions);

    final MaterialPageRoute<TermsAndConditionsPage>? route =
        routeGenerator(settings) as MaterialPageRoute<TermsAndConditionsPage>?;

    expect(route, isA<MaterialPageRoute<TermsAndConditionsPage>>());
    expect(route?.builder(context), isA<TermsAndConditionsPage>());
  });

  test('Test router returns SetNickNamePage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.setNicknamePage);

    final MaterialPageRoute<SetNickNamePage>? route =
        routeGenerator(settings) as MaterialPageRoute<SetNickNamePage>?;

    expect(route, isA<MaterialPageRoute<SetNickNamePage>>());
    expect(route?.builder(context), isA<SetNickNamePage>());
  });
  test('Test router returns SurveysPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.surveysPage);

    final MaterialPageRoute<SurveysPage>? route =
        routeGenerator(settings) as MaterialPageRoute<SurveysPage>?;

    expect(route, isA<MaterialPageRoute<SurveysPage>>());
    expect(route?.builder(context), isA<SurveysPage>());
  });

  test('Test router returns ContactAdminPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.contactAdminPage);

    final MaterialPageRoute<ContactAdminPage>? route =
        routeGenerator(settings) as MaterialPageRoute<ContactAdminPage>?;

    expect(route, isA<MaterialPageRoute<ContactAdminPage>>());
    expect(route?.builder(context), isA<ContactAdminPage>());
  });

  test('Test router returns SettingsPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.settingsPage);
    final MaterialPageRoute<SettingsPage> route =
        routeGenerator(settings)! as MaterialPageRoute<SettingsPage>;
    expect(route, isA<MaterialPageRoute<SettingsPage>>());
    expect(route.builder(context), isA<SettingsPage>());
  });

  test('Test router returns EditInformationPage', () {
    final RouteSettings settings = RouteSettings(
      name: AppRoutes.editInformationPage,
      arguments: <String, dynamic>{
        'editInformationItem': nickNameEditInfo('Test')
      },
    );
    final MaterialPageRoute<EditInformationPage> route =
        routeGenerator(settings)! as MaterialPageRoute<EditInformationPage>;
    expect(route, isA<MaterialPageRoute<EditInformationPage>>());
    expect(route.builder(context), isA<EditInformationPage>());
  });
  test('Test router returns ResolvedServiceRequestsPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.resolvedServiceRequestsPage);

    final MaterialPageRoute<ResolvedServiceRequestsPage>? route =
        routeGenerator(settings)
            as MaterialPageRoute<ResolvedServiceRequestsPage>?;

    expect(route, isA<MaterialPageRoute<ResolvedServiceRequestsPage>>());
    expect(route?.builder(context), isA<ResolvedServiceRequestsPage>());
  });

  test('Test router returns successful group info page', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.groupInfoPage, arguments: '');

    final MaterialPageRoute<GroupInfoPage>? route =
        routeGenerator(settings) as MaterialPageRoute<GroupInfoPage>?;

    expect(route, isA<MaterialPageRoute<GroupInfoPage>>());
    expect(route?.builder(context), isA<GroupInfoPage>());
  });
}
