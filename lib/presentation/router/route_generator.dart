// Flutter imports:
import 'package:prohealth360_daktari/domain/core/entities/core/screening_tool.dart';
import 'package:prohealth360_daktari/presentation/admin/admin_page.dart';
import 'package:prohealth360_daktari/presentation/caregiver/assign_caregiver_page.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/accept_group_invites_page.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/create_room_page.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/invite_users_page.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/invited_groups_page.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/room_list_page.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/room_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/search_organization_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/pages/login_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/program_selection/program_selection_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/create_organization_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/create_program_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/manage_organization_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/manage_programs_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/organization_detail_page.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/program_detail_page.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/survey_service_request_item.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/caregiver.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_respondent.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';
import 'package:prohealth360_daktari/presentation/onboarding/facility_selection/facility_selection_page.dart';
import 'package:prohealth360_daktari/presentation/search/pages/search_details_view_page.dart';
import 'package:prohealth360_daktari/presentation/roles/role_created_success_page.dart';
import 'package:prohealth360_daktari/presentation/roles/role_details_page.dart';
import 'package:prohealth360_daktari/presentation/roles/create_role_page.dart';
import 'package:prohealth360_daktari/presentation/roles/search_role_page.dart';
import 'package:prohealth360_daktari/presentation/caregiver/search_caregiver_details_page.dart';
import 'package:prohealth360_daktari/presentation/caregiver/search_caregiver_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/caregiver/register_caregiver_page.dart';
// Project imports:
import 'package:prohealth360_daktari/presentation/client_details/pages/search_client_page.dart';
import 'package:prohealth360_daktari/presentation/client_details/pages/search_staff_member_page.dart';
import 'package:prohealth360_daktari/presentation/contact_admin/pages/contact_admin_page.dart';
import 'package:prohealth360_daktari/presentation/core/widgets/handle_deep_link.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/pages/home_page.dart';
import 'package:prohealth360_daktari/presentation/notifications/notifications_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/search_facilities_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/create_pin/pages/create_new_pin_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/pages/forgot_pin_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/pages/login_counter_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/pages/pending_pin_request_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/login/pages/pin_request_sent_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/register_client_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/pin_expired/pages/pin_expired_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/security_questions/security_questions_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/staff/add_new_staff_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/terms/terms_and_conditions_page.dart';
import 'package:prohealth360_daktari/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import 'package:prohealth360_daktari/presentation/organization_selection/pages/organization_selection_page.dart';
import 'package:prohealth360_daktari/presentation/profile/faqs/pages/content_details_page.dart';
import 'package:prohealth360_daktari/presentation/profile/faqs/pages/document_content_widget.dart';
import 'package:prohealth360_daktari/presentation/profile/faqs/pages/gallery_images_page.dart';
import 'package:prohealth360_daktari/presentation/profile/faqs/pages/profile_faqs_page.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/add_facility_contact_page.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/edit_information_page.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/facility_contacts_page.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/settings_page.dart';
import 'package:prohealth360_daktari/presentation/profile/pages/user_profile_page.dart';
import 'package:prohealth360_daktari/presentation/profile/widgets/edit_information_item.dart';
import 'package:prohealth360_daktari/presentation/resume_with_pin/resume_pin_connector.dart';
import 'package:prohealth360_daktari/presentation/roles/manage_roles_page.dart';
import 'package:prohealth360_daktari/presentation/roles/update_role_page.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:prohealth360_daktari/presentation/search/pages/search_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/screening_tool_answers_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/screening_tool_respondents_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/pin_reset_requests_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/red_flag_actions_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/red_flags_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/resolved_service_requests_list_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/resolved_service_requests_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/screening_tools_list_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/service_requests_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/staff_pin_reset_requests_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/surveys/survey_service_request_actions_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/surveys/survey_service_request_responses_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/surveys/survey_service_requests_page.dart';
import 'package:prohealth360_daktari/presentation/service_requests/pages/verify_security_questions_help_page.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/successful_survey_submission.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_page.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_respondents_page.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_responses_preview_page.dart';
import 'package:prohealth360_daktari/presentation/surveys/pages/surveys_send_configuration_page.dart';
import 'package:sghi_core/communities/models/room.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.deepLink:
        return MaterialPageRoute<HandleDeepLink>(
          builder: (BuildContext context) => const HandleDeepLink(),
          settings: const RouteSettings(name: 'Handle deep link page'),
        );

      case AppRoutes.homePage:
        return MaterialPageRoute<HomePage>(
          builder: (BuildContext context) {
            return const HomePage();
          },
          settings: const RouteSettings(name: 'Home page'),
        );

      case AppRoutes.termsAndConditions:
        return MaterialPageRoute<TermsAndConditionsPage>(
          builder: (_) => const TermsAndConditionsPage(),
          settings: const RouteSettings(name: 'Terms and conditions page'),
        );

      case AppRoutes.setPinPage:
        return MaterialPageRoute<CreateNewPINPage>(
          builder: (_) => const CreateNewPINPage(),
          settings: const RouteSettings(name: 'Create new pin page'),
        );

      case AppRoutes.loginPage:
        return MaterialPageRoute<LoginPage>(
          builder: (_) => LoginPage(),
          settings: const RouteSettings(name: 'Login page'),
        );

      case AppRoutes.notificationsPage:
        return MaterialPageRoute<NotificationsPage>(
          builder: (_) {
            /// Log as a navigation event
            AnalyticsService()
                .logEvent(
                  name: viewNotificationsEvent,
                  eventType: AnalyticsEventType.NAVIGATION,
                )
                .then((_) => null);
            return NotificationsPage();
          },
          settings: const RouteSettings(name: 'Notifications page'),
        );

      case AppRoutes.securityQuestionsPage:
        return MaterialPageRoute<SecurityQuestionsPage>(
          builder: (_) => const SecurityQuestionsPage(),
          settings: const RouteSettings(name: 'Security questions page'),
        );

      case AppRoutes.forgotPinPage:
        return MaterialPageRoute<ForgotPinPage>(
          builder: (_) => ForgotPinPage(),
          settings: const RouteSettings(name: 'Forgot pin page'),
        );

      case AppRoutes.registerClientPage:
        return MaterialPageRoute<RegisterClientPage>(
          builder: (_) {
            /// Log as a navigation event
            AnalyticsService()
                .logEvent(
                  name: addNewClient,
                  eventType: AnalyticsEventType.NAVIGATION,
                )
                .then((_) => null);
            return const RegisterClientPage();
          },
          settings: const RouteSettings(name: 'Register client page'),
        );

      case AppRoutes.addNewStaffPage:
        return MaterialPageRoute<AddNewStaffPage>(
          builder: (_) {
            /// Log as a navigation event
            AnalyticsService()
                .logEvent(
                  name: addNewStaff,
                  eventType: AnalyticsEventType.NAVIGATION,
                )
                .then((_) => null);
            return const AddNewStaffPage();
          },
          settings: const RouteSettings(name: 'Add new staff page'),
        );

      case AppRoutes.serviceRequestsPage:
        return MaterialPageRoute<ServiceRequestsPage>(
          builder: (_) {
            /// Log as a navigation event
            AnalyticsService()
                .logEvent(
                  name: viewServiceRequests,
                  eventType: AnalyticsEventType.NAVIGATION,
                )
                .then((_) => null);
            return const ServiceRequestsPage();
          },
          settings: const RouteSettings(name: 'Service requests page'),
        );

      case AppRoutes.surveysPage:
        return MaterialPageRoute<SurveysPage>(
          builder: (_) => const SurveysPage(),
          settings: const RouteSettings(name: 'Surveys page'),
        );

      case AppRoutes.surveysSendConfigurationsPage:
        return MaterialPageRoute<SurveysSendConfigurationsPage>(
          builder: (_) => SurveysSendConfigurationsPage(survey: args as Survey),
          settings:
              const RouteSettings(name: 'Surveys send configurations page'),
        );

      case AppRoutes.successfulSurveySubmission:
        return MaterialPageRoute<SuccessfulSurveySubmission>(
          builder: (_) => const SuccessfulSurveySubmission(),
          settings: const RouteSettings(name: 'Successful survey submission'),
        );

      case AppRoutes.verifyPhonePage:
        return MaterialPageRoute<VerifyPhonePage>(
          builder: (_) => const VerifyPhonePage(),
          settings: const RouteSettings(name: 'Verify phone page'),
        );

      case AppRoutes.profilePage:
        return MaterialPageRoute<UserProfilePage>(
          builder: (_) {
            /// Log as a navigation event
            AnalyticsService()
                .logEvent(
                  name: viewProfile,
                  eventType: AnalyticsEventType.NAVIGATION,
                )
                .then((_) => null);
            return UserProfilePage();
          },
          settings: const RouteSettings(name: 'User profile page'),
        );

      case AppRoutes.settingsPage:
        return MaterialPageRoute<SettingsPage>(
          builder: (_) => SettingsPage(),
          settings: const RouteSettings(name: 'Settings page'),
        );

      case AppRoutes.editInformationPage:
        final EditInformationItem editInformationItem =
            (args as Map<String, dynamic>)['editInformationItem']
                as EditInformationItem;

        void Function(EditInformationItem editInformationItem) submitFunction;

        ///Sanity checks
        if (args['onSubmit'] != null) {
          submitFunction = args['onSubmit'] as void Function(
            EditInformationItem editInformationItem,
          );
        } else {
          submitFunction = (EditInformationItem editInformationItem) {};
        }

        return MaterialPageRoute<EditInformationPage>(
          builder: (_) => EditInformationPage(
            editInformationItem: editInformationItem,
            onSubmit: submitFunction,
          ),
          settings: const RouteSettings(name: 'Edit information page'),
        );

      case AppRoutes.pinResetRequestsPage:
        return MaterialPageRoute<PinResetRequestsPage>(
          builder: (_) => const PinResetRequestsPage(),
          settings: const RouteSettings(name: 'Pin reset requests page'),
        );

      case AppRoutes.redFlagsPage:
        return MaterialPageRoute<RedFlagsPage>(
          builder: (_) => RedFlagsPage(),
          settings: const RouteSettings(name: 'Red flags page'),
        );

      case AppRoutes.searchPage:
        return MaterialPageRoute<SearchPage>(
          builder: (_) => const SearchPage(),
          settings: const RouteSettings(name: 'Search page'),
        );

      case AppRoutes.contactAdminPage:
        return MaterialPageRoute<ContactAdminPage>(
          builder: (_) => const ContactAdminPage(),
          settings: const RouteSettings(name: 'Contact admin page'),
        );

      case AppRoutes.facilityContactsPage:
        return MaterialPageRoute<FacilityContactsPage>(
          builder: (_) => FacilityContactsPage(),
          settings: const RouteSettings(name: 'Facility Contacts Page'),
        );

      case AppRoutes.addFacilityContactPage:
        return MaterialPageRoute<AddFacilityContactPage>(
          builder: (_) => AddFacilityContactPage(
            phoneNumber: args as String,
          ),
          settings: const RouteSettings(name: 'AddFacility Contact Page'),
        );

      case AppRoutes.contentDetailsPage:
        return MaterialPageRoute<ContentDetailPage>(
          builder: (_) => ContentDetailPage(payload: args as ContentDetails),
          settings: const RouteSettings(name: 'Content details page'),
        );

      case AppRoutes.profileFaqsPage:
        return MaterialPageRoute<ProfileFaqsPage>(
          builder: (_) => const ProfileFaqsPage(),
          settings: const RouteSettings(name: 'Profile faqs page'),
        );

      case AppRoutes.resolvedServiceRequestsPage:
        return MaterialPageRoute<ResolvedServiceRequestsPage>(
          builder: (_) {
            /// Log as a navigation event
            AnalyticsService()
                .logEvent(
                  name: viewResolvedServiceRequests,
                  eventType: AnalyticsEventType.NAVIGATION,
                )
                .then((_) => null);
            return const ResolvedServiceRequestsPage();
          },
          settings: const RouteSettings(name: 'Resolved service requests page'),
        );

      case AppRoutes.searchClientPage:
        return MaterialPageRoute<SearchClientPage>(
          builder: (_) => SearchClientPage(
            selectMultiple: args as bool?,
          ),
          settings: const RouteSettings(name: 'Search client page'),
        );

      case AppRoutes.searchDetailViewPage:
        return MaterialPageRoute<SearchPageDetailView>(
          builder: (_) => SearchPageDetailView(
            searchUserResponse:
                (args as Map<String, dynamic>)['searchUserResponse']
                    as SearchUserResponse,
            isClient: args['isClient'] as bool,
          ),
          settings: const RouteSettings(name: 'Search page detail view'),
        );
      case AppRoutes.searchCaregiverDetailsPage:
        return MaterialPageRoute<SearchCaregiverDetailsPage>(
          builder: (_) => SearchCaregiverDetailsPage(
            caregiver: args as Caregiver,
          ),
          settings: const RouteSettings(name: 'Search page detail view'),
        );

      case AppRoutes.pinRequestSentPage:
        return MaterialPageRoute<PinRequestSentPage>(
          builder: (_) => const PinRequestSentPage(),
          settings: const RouteSettings(name: 'Pin request sent page'),
        );

      case AppRoutes.pendingPINRequestPage:
        return MaterialPageRoute<PendingPINRequestPage>(
          builder: (_) => const PendingPINRequestPage(),
          settings: const RouteSettings(name: 'Pending PIN request page'),
        );

      case AppRoutes.searchStaffMemberPage:
        return MaterialPageRoute<SearchStaffMemberPage>(
          builder: (_) => const SearchStaffMemberPage(),
          settings: const RouteSettings(name: 'Search staff member page'),
        );

      case AppRoutes.loginCounterPage:
        return MaterialPageRoute<LoginCounterPage>(
          builder: (_) => LoginCounterPage(
            retryTime: args as int?,
          ),
          settings: const RouteSettings(name: 'login counter page'),
        );

      case AppRoutes.verifySecurityQuestionsHelpPage:
        return MaterialPageRoute<VerifySecurityQuestionsHelpPage>(
          builder: (_) => VerifySecurityQuestionsHelpPage(),
          settings: const RouteSettings(name: 'Verify security questions page'),
        );

      case AppRoutes.pinExpiredPage:
        return MaterialPageRoute<PinExpiredPage>(
          builder: (_) => const PinExpiredPage(),
          settings: const RouteSettings(name: 'Pin expired page'),
        );

      case AppRoutes.groupInvitesPage:
        return MaterialPageRoute<InvitedGroupsPage>(
          builder: (_) => const InvitedGroupsPage(),
          settings: const RouteSettings(name: 'Invited groups page'),
        );

      case AppRoutes.staffPinResetRequestsPage:
        return MaterialPageRoute<StaffPinResetRequestsPage>(
          builder: (_) => const StaffPinResetRequestsPage(),
          settings: const RouteSettings(name: 'Staff pin reset requests page'),
        );
      case AppRoutes.redFlagActionsPage:
        return MaterialPageRoute<RedFlagActionsPage>(
          builder: (_) => RedFlagActionsPage(
            serviceRequest: args as ServiceRequest?,
          ),
          settings: const RouteSettings(name: 'Red flag actions page'),
        );
      case AppRoutes.surveyServiceRequestActionsPage:
        return MaterialPageRoute<SurveyServiceRequestActionsPage>(
          builder: (_) => SurveyServiceRequestActionsPage(
            surveyRespondent: args as SurveyRespondent?,
          ),
          settings:
              const RouteSettings(name: 'Survey Service Request Actions Page'),
        );

      case AppRoutes.surveyResponsesPreviewPage:
        return MaterialPageRoute<SurveyResponsesPreviewPage>(
          builder: (_) => SurveyResponsesPreviewPage(
            surveyRespondent: (args as Map<String, dynamic>)['surveyRespondent']
                as SurveyRespondent?,
            surveyName: args['surveyName'] as String?,
          ),
          settings: const RouteSettings(name: 'Survey Responses Preview Page'),
        );

      case AppRoutes.screeningToolsListPage:
        return MaterialPageRoute<ScreeningToolsListPage>(
          builder: (_) => const ScreeningToolsListPage(),
          settings: const RouteSettings(name: 'Screening tools list page'),
        );
      case AppRoutes.assessmentToolResponsesPage:
        return MaterialPageRoute<ScreeningToolRespondentsPage>(
          builder: (_) => ScreeningToolRespondentsPage(
            screeningTool: args as ScreeningTool,
          ),
          settings: const RouteSettings(name: 'AssessmentTool responses page'),
        );

      case AppRoutes.assessmentCardAnswersPage:
        return MaterialPageRoute<ScreeningToolAnswersPage>(
          builder: (_) => ScreeningToolAnswersPage(
            payload: args as Map<String, dynamic>,
          ),
          settings: const RouteSettings(name: 'Assessment card answers page'),
        );

      case AppRoutes.resolvedServiceRequestsListPage:
        return MaterialPageRoute<ResolvedServiceRequestsListPage>(
          builder: (_) => ResolvedServiceRequestsListPage(
            flavour: args as Flavour,
          ),
          settings:
              const RouteSettings(name: 'Resolved service requests list page'),
        );

      case AppRoutes.surveyServiceRequestsPage:
        return MaterialPageRoute<SurveyServiceRequestsPage>(
          builder: (_) => const SurveyServiceRequestsPage(),
          settings:
              const RouteSettings(name: 'Resolved service requests list page'),
        );

      case AppRoutes.viewDocumentPage:
        final String pdfTitle =
            (args as Map<String, dynamic>)['pdfTitle'] as String;
        final String pdfUrl = args['pdfUrl'] as String;

        return MaterialPageRoute<DocumentContentPage>(
          builder: (_) => DocumentContentPage(
            pdfTitle: pdfTitle,
            pdfUrl: pdfUrl,
          ),
          settings: const RouteSettings(name: 'Document content page'),
        );
      case AppRoutes.galleryImagesPage:
        return MaterialPageRoute<ContentDetailPage>(
          builder: (_) => GalleryImagesPage(
            images: args as List<GalleryImage>,
          ),
          settings: const RouteSettings(name: 'Gallery images page'),
        );
      case AppRoutes.surveyServiceRequestResponsesPage:
        return MaterialPageRoute<SurveyServiceRequestResponsesPage>(
          builder: (_) => SurveyServiceRequestResponsesPage(
            selectedSurvey: args as SurveyServiceRequestItem?,
          ),
          settings: const RouteSettings(
            name: 'Survey Service Request Responses Page',
          ),
        );

      case AppRoutes.acceptGroupInvitesPage:
        return MaterialPageRoute<AcceptGroupInvitesPage>(
          builder: (_) => const AcceptGroupInvitesPage(),
          settings: const RouteSettings(name: 'Accepted group invites page'),
        );

      case AppRoutes.resumeWithPin:
        return MaterialPageRoute<ResumePinConnector>(
          builder: (_) => const ResumePinConnector(),
          settings: const RouteSettings(name: 'Resume with pin page'),
        );

      case AppRoutes.searchFacilitiesPage:
        return MaterialPageRoute<SearchFacilitiesPage>(
          builder: (_) => SearchFacilitiesPage(
            userID: (args as Map<String, dynamic>?)?['userID'] as String?,
            isClient: args?['isClient'] as bool?,
            programId: args?['programId'] as String?,
            searchFromProgram: (args?['searchFromProgram'] ?? true) as bool,
          ),
          settings: const RouteSettings(name: 'Search facilities page'),
        );

      case AppRoutes.searchOrganisationsPage:
        return MaterialPageRoute<SearchOrganisationsPage>(
          builder: (_) => const SearchOrganisationsPage(),
          settings: const RouteSettings(name: 'Search organisations page'),
        );

      case AppRoutes.surveyRespondentsPage:
        return MaterialPageRoute<SurveyRespondentsPage>(
          builder: (_) => SurveyRespondentsPage(
            selectedSurvey: args as Survey,
          ),
          settings: const RouteSettings(name: 'Survey responses page'),
        );
      case AppRoutes.registerCaregiverPage:
        return MaterialPageRoute<RegisterCaregiverPage>(
          builder: (_) => const RegisterCaregiverPage(),
          settings: const RouteSettings(name: 'Register caregiver page'),
        );

      case AppRoutes.searchCaregiverPage:
        return MaterialPageRoute<SearchCaregiverPage>(
          builder: (_) => const SearchCaregiverPage(),
          settings: const RouteSettings(name: 'Search caregiver page'),
        );
      case AppRoutes.assignCaregiverPage:
        return MaterialPageRoute<AssignCaregiverPage>(
          builder: (_) => AssignCaregiverPage(
            clientId: args as String,
          ),
          settings: const RouteSettings(name: 'assign caregiver page'),
        );

      case AppRoutes.facilitySelectionPage:
        return MaterialPageRoute<FacilitySelectionPage>(
          builder: (_) => FacilitySelectionPage(),
          settings: const RouteSettings(name: 'Facility selection page'),
        );
      case AppRoutes.organizationSelectionPage:
        return MaterialPageRoute<OrganizationSelectionPage>(
          builder: (_) => const OrganizationSelectionPage(),
          settings: const RouteSettings(name: 'Organization Selection Page'),
        );
      case AppRoutes.manageRolesPage:
        return MaterialPageRoute<ManageRolesPage>(
          builder: (_) => const ManageRolesPage(),
          settings: const RouteSettings(name: 'Manage Roles Page'),
        );

      case AppRoutes.updateRolePage:
        return MaterialPageRoute<UpdateRolePage>(
          builder: (_) => const UpdateRolePage(),
          settings: const RouteSettings(name: 'Update Role Page'),
        );

      case AppRoutes.searchRolePage:
        return MaterialPageRoute<SearchRolePage>(
          builder: (_) => const SearchRolePage(),
          settings: const RouteSettings(name: 'Search Role Page'),
        );

      case AppRoutes.createRolePage:
        return MaterialPageRoute<CreateRolePage>(
          builder: (_) => const CreateRolePage(),
          settings: const RouteSettings(name: 'Create Role Page'),
        );

      case AppRoutes.roleDetailsPage:
        return MaterialPageRoute<RoleDetailsPage>(
          builder: (_) => const RoleDetailsPage(),
          settings: const RouteSettings(name: 'Role Details Page'),
        );

      case AppRoutes.roleCreateSuccessPage:
        return MaterialPageRoute<RoleCreatedSuccessPage>(
          builder: (_) => const RoleCreatedSuccessPage(),
          settings: const RouteSettings(name: 'Role create success Page'),
        );

      case AppRoutes.adminPage:
        return MaterialPageRoute<AdminPage>(
          builder: (_) => const AdminPage(),
          settings: const RouteSettings(name: 'Admin Page'),
        );

      case AppRoutes.programSelectionPage:
        return MaterialPageRoute<ProgramSelectionPage>(
          builder: (_) => const ProgramSelectionPage(),
          settings: const RouteSettings(name: 'Program Selection Page'),
        );

      case AppRoutes.manageOrganizationsPageRoute:
        return MaterialPageRoute<ManageOrganizationPage>(
          builder: (_) => const ManageOrganizationPage(),
          settings: const RouteSettings(name: 'Manage Organization Page'),
        );

      case AppRoutes.organizationDetailPageRoute:
        return MaterialPageRoute<OrganizationDetailPage>(
          builder: (_) => const OrganizationDetailPage(),
          settings: const RouteSettings(name: 'Organization Detail Page'),
        );

      case AppRoutes.createOrganizationRoute:
        return MaterialPageRoute<CreateOrganizationPage>(
          builder: (_) => CreateOrganizationPage(),
          settings: const RouteSettings(name: 'Create Organization Page'),
        );

      case AppRoutes.programDetailPageRoute:
        return MaterialPageRoute<ProgramDetailPage>(
          builder: (_) => const ProgramDetailPage(),
          settings: const RouteSettings(name: 'Program Detail Page'),
        );

      case AppRoutes.manageProgramsPageRoute:
        return MaterialPageRoute<ManageProgramsPage>(
          builder: (_) => const ManageProgramsPage(),
          settings: const RouteSettings(name: 'Manage Programs Page'),
        );

      case AppRoutes.createProgramRoute:
        return MaterialPageRoute<CreateProgramPage>(
          builder: (_) => CreateProgramPage(
            addToOrganisation: args as bool?,
          ),
          settings: const RouteSettings(name: 'Create Program Page'),
        );

      // Communities
      case AppRoutes.roomListPage:
        return MaterialPageRoute<RoomListPage>(
          builder: (_) => RoomListPage(),
          settings: const RouteSettings(name: 'Room List Page'),
        );
      case AppRoutes.roomPage:
        return MaterialPageRoute<RoomPage>(
          builder: (_) => RoomPage(room: args as Room),
          settings: const RouteSettings(name: 'Room Page'),
        );
      case AppRoutes.createRoomPage:
        return MaterialPageRoute<CreateRoomPage>(
          builder: (_) => const CreateRoomPage(),
          settings: const RouteSettings(name: 'Create Room Page'),
        );
      case AppRoutes.inviteUsersPage:
        return MaterialPageRoute<InviteUsersPage>(
          builder: (_) => InviteUsersPage(
            room: args as Room,
          ),
          settings: const RouteSettings(name: 'Invite Users Page'),
        );

      default:
        return MaterialPageRoute<LoginPage>(
          builder: (_) => LoginPage(),
          settings: const RouteSettings(name: 'Login page'),
        );
    }
  }
}
