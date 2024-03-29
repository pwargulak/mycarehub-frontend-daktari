import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';

const String appName = 'myCareHub Professional';
const String consumerAppName = 'myCareHub';
const String adminEmail = 'feedback@prohealth360.org';
const String adminString = 'Admin';

//Create New Pin Page
const String confirmPinString = 'Confirm PIN';
const String createNewPINTitleString = 'Create new PIN';
const String resetPINTitleString = 'Reset PIN';
const String createNewPINSubTitleString =
    'Please update your PIN to make it personal';
const String phoneNumberString = 'Phone Number';
const String newPinString = 'New PIN';
const String pinMustMatchString = 'PIN must match';
const String acceptTermsAndConditionsString = 'I accept Terms and Conditions';
const String acceptTermsString =
    'Kindly accept terms and conditions to continue';
const String pinSuccessString = 'PIN created successfully';

//Forgot PIN Page
const String resetPassword = 'Reset password?';
const String resetPasswordDescription = 'Enter your phone number';
const String sendOTPString = 'Send OTP';
const String emailOrPhone = 'Email/Phone';

//Verify phone number page
const String verifyPhoneNumberTitle = 'Verify phone number';
const String verifyPhoneNumberDescription =
    'A six digit verification code has been sent to your phone';
const String enterOTPString = 'Enter verification code to proceed';
const String confirmOTPButtonString = 'Confirm OTP';
const String invalidOTPString = 'Invalid OTP *';
String anOtpHasBeenSentText(String phoneNumber) {
  return 'An OTP has been sent to $phoneNumber';
}

const String verifyCode = 'Verifying Code';

const String resendOTP = 'Resend code';

const String verifyOTPState = 'verifyOTPState';
const String didNotReceiveOTP = 'Did not receive a verification code?';

//Content Page
const String contentPageDescription =
    'To publish new content, please log in to ghost below, create your content and publish';
const String contentManagementString = 'Content management';
const String contentPageTitle = 'Create content';
const String rejectChatDialogTitle = 'Reject message';
const String rejectChatDialogDescription =
    'Are you sure you want to reject these message ?';
const String banUserText = 'Ban user';
const String unBanUserText = 'UnBan user';
const String reportSpamText = 'Report spam';
const String cancelText = '';

//Community Page
const String conversationsTitle = 'Conversations';
const String emptyConversationTitle =
    'Oops! We are unable to load your conversations';
const String emptyConversationBody =
    'Relax and enjoy a cup of coffee as we get your conversations up and running.';
const String conversationsInvitesTitle = 'Conversations invites';
const String groupInvitesString = 'Group Invites';
const String groupsYouHaveBeenInvited = 'Groups you have been invited to';
const String youHaveNoInvites = 'You have no invites';
const String facilityContactsString = 'Facility contacts';
const String addFacilityContactString = 'Add facility contact';
const String facilityPhoneNumberString = 'Facility phone number';
const String enterPhoneNumberString = 'Enter phone number';
const String updateContactString = 'Update Contact';
const String saveContactString = 'Save Contact';
const String createContactString = 'Create Contact';
const String facilityContactsDescriptionString =
    'Here is the contact information for your facility. Clients will use this information to contact';
const String addFacilityContactDescriptionString =
    'Add contact information about your facility. Clients will be able to contact your facility using this phone number';
const String noContactForFacilityDescriptionString =
    'Your facility does not have a contact added. Tap below to add it';
const String noInvitesDescription =
    'There seems to be no group invites for you at the moment. We will notify you the moment you get more invites. Enjoy your day!';
const String invitationAcceptedSuccessfully =
    'Invitation accepted successfully';
const String invitationDeclinedSuccessfully =
    'Invitation declined successfully';
const String communitiesRejectionSuccessful = 'Invite rejection successful';
const String okThanksText = 'Ok, thanks';
const String joinGroup = 'Join Group';
const String declineInvite = 'Decline Invite';
const String leaveGroupString = 'Leave Group';

//Phone Login
const String phoneLoginPageTitle = 'Welcome to ';
const String usernameString = 'Username';
const String phoneLoginPageDescription = 'Enter your provided PIN to continue';
const String selectOrganisationDescription =
    'Please select your organisation to proceed';
const String loginPageDescription = 'Enter your provided PIN to continue';
const String pinString = 'PIN';

const String userNameHint = 'Enter your username...';
const String forgotPinString = 'Forgot Pin';

//Security Questions
const String setSecurityQuestionsString = 'Set your security questions';
const String securityQuestionsDescriptionString =
    'Please answer all the security questions below. Please make sure you remember the responses.';
const String whereWereYouBornString = 'Where were you born?';
const String whatsTheNameOfYourPetString = 'What is the name of your pet?';
const String whatsYourFavoriteFoodString = 'What is your favorite food?';
const String whereDidYouFirstLiveString = 'Where did you first live?';
const String answerHereString = 'Answer here';

const String verifySecurityQuestionsString = 'Verify your security questions';
const String verifyQuestionsDescriptionString =
    'Please answer all the following security questions about yourself. You provided the answers to these questions when you first signed up.';

const String informationRequired =
    'Please provide all the required information';
const String successMessage = 'Information saved successfully';
const String addEmail = 'Add Email Address';
const String thanksText = 'Okay, Thank You';
const String okay = 'Okay';
const String continueText = 'Continue';
const String proceedText = 'Proceed';
const String doItLater = 'Do it later';

// User Profile
const String correctionRequestString = 'Request for correction';
const String myProfileString = 'My Profile';
const String profession = 'Doctor';
const String clinicName = 'myCareHub Medical Center';
const String dummyPhoneNumber = '0712345678';
const String emailAddress = 'admin@mycarehub.com';
const String licenseNumber = 'PF 14509';
const String gender = 'Male';

// Home Page
const String searchUser = 'Search user';
const String firstName = 'John';
const String time = '09:56 pm';
const String comingSoonText = 'Coming Soon';
const String addNewClientText = 'Add New Client';
const String serviceRequestsText = 'Service Requests';
const String profileUpdateText = 'Profile Update';
const String contactRequestText = 'Contact Request';
const String contentString = 'Content';
const String surveysString = 'Surveys';
const String noResultsFoundText = 'Oops!... no results found';
const String addNewPatientText = 'Add new patient';
const String createGroupText = 'Create Group';
const String addNewStaffText = 'Add New Staff';
const String addCaregiverText = 'Add Caregiver';
const String caregiversString = 'Caregivers';
const String addCaregiverString = 'Add Caregiver';

//Service Requests
const String serviceRequestString = 'Service requests';
const String approveString = 'Approve';
const String searchString = 'Search';
const String needsAttentionString = ' needs attention';
const String redFlagString = 'Red Flag';
const String reachOutString = 'Reach out?';
const String resolveString = 'Resolve';
const String callString = 'Call';
const String whatsappString = 'Whatsapp';
const String forString = 'for';
const String reviewString = 'Review';
const String wantProfiledUpdatedString = ' wants to update their profile';
const String reachOutDescriptionPart1String = 'Use their phone number ';
const String reachOutDescriptionPart2String =
    ' or tap the button below to call them directly';
const String profileUpdateString = 'Profile Update';
const String clientPINResetString = 'Client PIN resets';
const String staffPINResetString = 'Staff PIN resets';
const String ifYouHaveReachedOutString = 'If you have reached out to ';
const String tapTapBelowToResolveString =
    ', please tap the button below to resolve this service request.\n\nYou can also describe any action you took below';
const String actionTakenString = 'Action taken';
const String notesString = 'Notes';

const String serviceRequestsNoDataBodyString =
    'Great job! You have handled all your service requests. Take a coffee and enjoy your day.';
const String resolvedServiceRequestsNoDataBodyString =
    'No Worries. Resolved service requests will show up here once you have handled them';
const String resolvedServiceRequestString = 'Resolved service requests';
const String resolvedString = 'Resolved';
const String spacedByString = ' by ';
const String spacedOnString = ' on ';
const String staffString = 'Staff';

// Surveys
const String createSurveyString = 'Create Survey';
const String toCreateNewSurveyDescriptionString =
    'To create a new survey, log in to survey monkey, create your survey and share your survey to a targeted audience';
const String alreadyHaveYourSurveyLinkString = 'Already have your survey link?';
const String shareSurveyString = 'Share Survey';
const String surveyLinkString = 'Survey Link';
const String shareToString = 'Share to';
const String bandString = 'Band';
const String chooseOneString = 'Choose One';
const String ageString = 'Age';
const String locationString = 'Location';
const String clinicString = 'Clinic';
const String confirmString = 'Confirm';
const String surveysInvitedToString =
    'Surveys you have been invited to respond to';
const String sendOutString = 'Send Out';
const String fetchingSurveysString = 'fetching surveys';
const String surveyServiceRequestsLeadingString =
    'Surveys that have service requests';
const String surveyServiceRequestsString = 'Survey service requests';

const String noSurveysTitle = 'No Surveys available';
const String noSurveysDescription =
    'No worries though, check back in later and we will have them ready for you';
const String usabilitySurveyString = 'Usability survey';
const String surveyDescriptionString =
    'A simple Yes or No question set about your mental health';
const String surveySenderListDescriptionString =
    'Please select where you want to send the survey';
const String sendToAllClientsString = 'Send to all clients';
const String sendToClientsString = 'Send to clients';
const String sendToAllStaffString = 'Send to all Staff';
const String sendToClientsDescriptionString =
    'Tap to tailor your survey before sending it to clients. You will be able to choose from a set of configurations ';
const String sendToAllStaffMembersString =
    'Tap to send your survey to all the staff members in your facility';
const String setClientConfigurationsString =
    'Set the configurations for your survey before sending it. Your survey will be sent out to clients that meet the criteria you have selected above';
const String allClientsString = 'All clients';
const String tapToSendToAllClientsString =
    'Tap the button below if you wish to send your survey to all clients on myCareHub';
const String clientTypeText = 'Client Type';
const String ageGroupText = 'Age Group';
const String genderText = 'Gender';
const String allText = 'ALL';
const String sendSurveyText = 'Send Survey';
const String surveySentText = 'Survey sent';
const String surveySentDescriptionText =
    'Your survey has been sent to the clients you selected. They will receive notification prompts to fill in the surveys.';
const String takeACupOfCoffeeText =
    ' Take a cup of coffee as we prepare your responses';

// Notifications
const String notificationsText = 'Notifications';
const String customDate = 'July 12 2021';
const String noNotificationsTitle = 'You have no notifications';
const String noNotificationsDescription =
    'You have no notifications at this time. We will notify you when we have more';

// Add patient page
const String CCCNumberLabel = 'CCC Number *';
const String usernameLabel = 'Username *';
const String cccNumberHint = 'Enter CCC Number...';
const String usernameHint = 'Enter your username...';
const String facilityLabel = 'Facility *';
const String organisationString = 'Organisation';
const String firstNameLabel = 'First Name *';
const String lastNameLabel = 'Last Name *';
const String birthDateLabel = 'Birth Date *';
const String genderLabel = 'Gender *';
const String phoneNumberLabel = 'Phone Number *';
const String appInviteText = 'Invite to $consumerAppName';
const String appReInviteText = 'Reinvite to $consumerAppName';
const String appAlternateInvite = 'Resend $consumerAppName invite';
const String proAppInviteText = 'Invite to $appName';
const String registerBtnText = 'Register';
const String addNewPatientTitleText = 'Add new patient';
const String enrollmentDateLabel = 'Enrollment Date *';
const String clientTypeLabel = 'Client Type *';
const String registerClientSuccess = 'Successfully registered client';
const String registerOrganisationSuccess = 'Successfully created organisation';
const String registerCaregiverSuccess = 'Successfully registered caregiver';
const String assignCaregiverSuccess = 'Successfully assigned caregiver';
const String cccExists =
    'a client with this identifier type and value already exists';
const String identifierString = 'identifier';
const String alreadyExistsString = 'already exists';
const String clientCccExists = 'A client with that CCC number already exists';
const String clientPhoneExists =
    'A client with that phone number already exists';
const String clientUsernameExists =
    'A client with that username already exists';
const String contactExists =
    'a contact with this value and flavour already exists';
const String searchFacilitiesString = 'Search facilities';
const String searchOrganisationsString = 'Search organisations';
const String userAlreadyExistsString = 'User already exists';
const String selectedProgramDescriptionString =
    'The client will be added to this program and organization';
const String userPhoneAlreadyExistsDescriptionString =
    'There is an already existing user with that phone number. Do you still want to continue';

// add new staff page
const String registerStaffSuccess = 'Successfully registered staff';
const String userWithPhoneExists =
    'A staff member with that phone already exists';
const String phoneExists =
    'a contact with this value and flavour already exists';
const String staffCccExists =
    'A staff member with that ID or Staff number already exists';
const String userWithUserNameExists =
    'A staff member with that username already exists';

// add new group page
const String enterGroupNameText = 'Enter Group name';
const String groupNameHintText = 'Name your new group...';
const String aboutGroupText = 'About Group';
const String groupDescriptionHintText = 'Describe your new group...';
const String bandLabelText = 'Band';
const String ageLabelText = 'Age';
const String locationLabelText = 'Location';
const String clinicLabelText = 'Clinic';
const String activeModerationLabelText = 'Active Moderation';
const String chooseOneHintText = 'choose one';
const String approvalNoteText =
    'All messages have to be approved to be seen by the group members';
const String maleText = 'Male';
const String femaleText = 'Female';
const String inviteOnlyText = 'Invite only';
const String genders = 'Genders';
const String groupName = 'Group name';
const String clientTypes = 'Client Types';
const String createGroup = 'Create group';
const String ageGroup = 'Age group';
const String groupDescription = 'Group description';
const String registerGroupSuccess = 'Successfully created group';

// new broadcast page
const String newBroadcastText = 'New Broadcast';
const String broadcastToText = 'Broadcast to';
const String broadcastNameText = 'Broadcast Name';
//Client Health Page
const String myHealthPageTitle = 'My Health';
const String initials = 'WJ';
const String myHealthViralLoad = 'Viral load';
const String myHealthViralLoadReading = '600';
const String myHealthViralLoadReadingUnit = '/ml';
const String myHealthNextRefill = 'Next refill';
const String myHealthNextRefillDate = '19';
const String myHealthNextRefillMonth = 'Aug';
const String myHealthPageHealthDiary = 'My Health Diary';
const String myHealthPageAppointments = 'Appointments';
const String newEntryString = 'New Entry';
const String transferOut = 'Transfer out';

//Client Details Card
const String viewProfileString = 'View profile';
const String userInitialsStrings = 'WJ';
const String userCCCNumberString = '12345678';
const String ageExampleString = '18';
const String homeExampleString = 'Karen';

const String noAccount =
    'No account with that phone number. Use the number you registered with or ';
const String checkConnectionText =
    'Slow internet connection. Please check your connection and try again';
const String userPhoneExistsText = 'User with that phone number exists.';
const String userEmailExistsText = 'User with that email address exists.';
const String usernameExistsText = 'That username is already in use.';
const String noUserFoundText = 'We could not find a user with those details.';
const String wrongCredentialsText = 'Wrong login details provided';
const String noPINFoundText = 'No PIN found for this user.';

const String errorPhoneLogin = 'Error: Unable to login by phone';

const String errorNoUserFound = 'Error: no user found';

const String connectionLostText = 'Internet connection lost';

const String fieldCannotBeEmptyText = 'Field cannot be empty';
const String validEmailAddressText = 'Enter a valid email address';
const String enterAValidCCCNumberText = 'Enter a valid CCC number';

// PhoneNumberFormConstants
const String phoneNumberInputLabelText = 'Phone number';

const String wrongLoginCredentials = 'Your phone number or PIN do not match.';

const String wrongCredentials =
    'Sorry, the credentials you entered are incorrect. Please try again or '
    'contact support';
const String resetPin = 'reset your PIN';
const String phoneLoginCreateAccountText = 'create an account';

const String confirmPinPrompt = 'A 4 digit PIN is required';
const String enterUsernamePrompt = 'Username is required';
const String chooseOrganisationPrompt = 'Organisation is required';
const String confirmPinMatch = 'PINs do not match';
const String loginPinDigits = 'Only numbers are allowed, 0-9';
const String loginPinLength = 'Enter a four digit PIN';
const String phoneLoginText = 'Sign In';
const String pinResetSuccessString =
    'PIN successfully reset. Please log in with your new PIN';
const String pinChangeSuccessString =
    'PIN successfully changed. Please log in with your new PIN';

const String drawerTestRootText = 'You have closed the drawer';

const String somethingWentWrongText =
    'Sorry, an unknown error occurred, please try again or get help from '
    'our help center.';

const String noUserFound =
    'Sorry, we could not find a user with those details. Please make sure that '
    'the credentials you provided are correct and try again';

// Terms and conditions
const String portalTermsText = 'Portal terms and conditions';
const String noTermsAvailableString = 'No terms available';
const String readAndAcceptText =
    'Please review the terms of service below and accept them';
const String acceptTermsText = 'I agree with the terms and conditions';
const String acceptTermsErrorString =
    'Sorry, we were unable to load your terms and conditions at the moment. Tap the button below to fetch them again';

const String closeString = 'Close';

// HTTP requests
const String httpPOST = 'POST';
const String httpGET = 'GET';

// Errors
const String genericErrorOccurred = 'Sorry, an error occurred';
const String noInternetConnection = 'No Internet Connection';

// set nickname page
const String setNicknameDescription =
    'Please create a nickname (Visible to conversation members)';
const String nickNameString = 'Nickname';
const String nameInputValidateString = 'Kindly input a nickname';
const String errorNicknameInputString =
    'Please enter letters, numbers or underscores only';
const String nicknameSuccessString = 'Nickname created successfully';
const String logoutButtonText = 'Logout';
const String usernameTakenText = 'Username has already been taken.';

const String copyrightDescriptionString =
    'myCareHub™ is a platform developed by Johnson & Johnson Global public Health, used under license';
const String poweredByMyCareHubString = 'Powered by myCareHub™';
const String appVersionString = 'Current Version:';
const String setNicknameString = 'Set Your Nickname';

// this is the version of the currently running app.
// it has to be defined as a const otherwise the compiler will return the default
const String APPVERSION =
    String.fromEnvironment('APPVERSION', defaultValue: 'dev-build');

const String saveAndContinueButtonText = 'Save & Continue';
const String kindlyAnswerAllQuestionsString = 'Kindly answer all questions';

// user friendly messages
const String defaultUserFriendlyMessage =
    'Sorry, an unknown error occurred, please try again or contact your admin.';
const String invalidCode =
    'You have entered a wrong code. Kindly verify the code sent or resend the code to your phone number';
const String sendOTPError =
    'There was an error while sending your verification code. Let’s get you a fresh verification code';

const String fetchingRedFlagsString = 'fetching red flags';
const String describeActionTakenString = 'Describe the action taken...';
String fetchingResolvedRequestsString =
    'fetching ${resolvedRequestsString.toLowerCase()}';
String fetchingResolvedRedFlagsString =
    'fetching ${redFlagString.toLowerCase()}';
String fetchingPINResetRequestsString = 'fetching $pinResetRequestsTitle';
String fetchingStaffPINResetRequestsString =
    'fetching $staffPinResetRequestsTitle';
String redFlagsSearchBarString = 'Search using their name or phone number...';
String redFlagsDescString =
    "These are responses captured in the client's health diary entries";

String fetchingPendingServiceString = 'fetching pending service requests';

// generic widget
const String actionTextGenericNoData = 'Ok, thanks';
const String retryString = 'Retry';
String getNoDataTile(String? message) {
  return message != null ? 'You have no $message' : 'You have no data';
}

// User profile items
const String helpContactAdminString = 'Help/Contact Admin';
const String resolvedRequestsString = 'Resolved Requests';
const String resolvedServiceRequestsString = 'Resolved service requests';
String getResolvedServiceRequestsListTitle(Flavour flavour) {
  return 'Resolved ${flavour == Flavour.consumer ? 'client' : 'staff'} service requests';
}

String getResolvedServiceRequestsListBodyString(Flavour flavour) {
  return '${flavour == Flavour.consumer ? 'Client' : 'Staff'} service requests that have already been handled';
}

const String resolvedServiceRequestsBodyString =
    'Select the type of service requests you want to view';

const String settingsString = 'Settings';
const String genericVerifyPhoneNumber = 'Verify Phone number';

// profile FAQs
const String faqsText = 'FAQs';
const String noFAQsTitle = 'No FAQs available';
const String noFAQsDescription =
    'No worries though, check back in later and we will have them ready for you';
const String fetchingFAQsSting = 'fetching FAQs';

// contact admin
const String contactAdmin = 'Contact Admin';
const String doYouNeedHelpString = 'Do you need help?';
const String contactOurAdmins =
    'Contact one of our admins using the methods below';
const String callYourAdmin = 'Call your admin';
const String tapBelowToCallAdmin = 'Tap below to call your admin on the number';
const String emailYourAdmin = 'Email your admin';
const String tapBelowToEmailAdmin = 'Tap below to email your admin on';
const String emailString = 'Email';

// Profile FAQs
const String loremIpsumText =
    'A detailed description for this question will be available soon';
const String fetchingFAQsFlagString = 'fetching FAQs';

const String tapToLearnMoreText = 'Tap to learn more';
const String settingsPageTitle = 'Settings';
const String editString = 'Edit';
const String nickNameFieldName = 'Enter your new nickname';

//Personal Information
const String myProfileCaregiverText = 'Caregiver information';
const String myProfileCaregiverDescriptionText =
    'Could be a parent, guardian or nurse';
const String janeDoe = 'Jane Doe';
const String father = 'Father';
const String lastName = 'Last Name';
const String relationText = 'How are you related';
const String preferredLanguage = 'Preferred Language';
const String english = 'English';
const String preferredClinic = 'Preferred Clinic';
const String clinic = 'Equity Afia Ruaka';
const String preferredCommunication = 'Preferred way of Communication';
const String inApp = 'in app';
const String hotlineNumberString = '0712345678';
String editInfoTitle(String title) => 'Edit $title';

//settings page
const String saveString = 'Save';
const String savedString = 'Saved';

// invite members
const String inviteMembersTitle = 'Invite Members';
const String inviteMembersDescription =
    'Invite members to this group by searching for them using their name';
const String searchMembersString = 'Search members ...';
const String fetchingMemberFlagText = 'fetching members';
const String availableMembersText = 'available members';
const String noAvailableFacilitiesText = 'There are no available facilities';
const String noAvailableProgramsText = 'There are no available programs';
const String noAvailableMemberDescription =
    'Please try again or contact support';
const String inviteMembersSuccessfulText = 'Members invited successfully';
const String noMemberFoundText = 'No member found with that name';
const String noFacilityFoundText = 'No facility found with that code';
const String noProgramFoundText = 'No program found with that name';
const String noOrganizationFoundText = 'No organisation found with that name';
const String noRecordFoundText = 'No record found with that keyword';
const String couldNotFindAMemberText =
    'It seems like we could not find a member by the name ';
const String couldNotFindFacilityText =
    'It seems like we could not find a facility by the code ';
const String couldNotFindProgramText =
    'It seems like we could not find a program by the name ';
const String couldNotFindOrganizationText =
    'It seems like we could not find an organisation by the name ';
const String couldNotFindRedFlagsText =
    'It seems like we could not find any red flags by the keyword ';
const String confirmTheNamesAreCorrectText =
    '. Confirm that the names are correct before searching again, or use different names.';
const String confirmTheCodeIsCorrectText =
    '. Confirm that the code is correct before searching again.';
const String confirmTheNameIsCorrectText =
    '. Confirm that the name is correct before searching again.';
const String confirmTheKeywordIsCorrectText =
    '. Confirm that the keyword is correct before searching again';
const String staffMemberText = 'Staff member';

// group info
const String groupInfoText = 'Group Info';
const String groupInformationText = 'Group Information';
const String clientTypesText = 'Client types';
const String ageGroupsText = 'Age groups';
const String flaggedMessagesText = 'Flagged messages';
const String tapToViewFlaggedMessagesText = 'Tap to view flagged messages';
const String moderatorText = 'Moderator';

const String groupMembersText = 'Group Members';
const String inviteMembersString = 'Invite members';
const String noMembersString = 'No members';

const String datePickerFormat = 'dd MMM, yyyy';

const String defaultStreamUserID = 'myCareHub';

const String kindlyLogOutText = 'Kindly log out and back in to continue';

String getGroupMembersNumber(int numberOfMembers) {
  return '$numberOfMembers ${numberOfMembers == 1 ? 'member' : 'members'}';
}

const String actionsText = 'Actions';
const String promoteToModeratorText = 'Promote to moderator';
const String errorPromotingAdminText = 'Error promoting user to admin';
const String errorDemotingAdminText = 'Error demoting user';

const String removeFromGroupText = 'Remove user from group';

// pin reset requests
const String pinResetRequestsLeading =
    'These are clients who are having trouble signing in and have'
    ' requested your assistance';
const String approveText = 'Approve';
const String rejectText = 'Reject';
const String pinResetRequestsTitle = 'PIN reset requests';
const String pinApprovedSuccessText = 'Pin Approved Successfully';
const String pinRejectedSuccessText = 'Pin Rejected Successfully';
const String requestResolvedSuccessText =
    'Service request resolved Successfully';
const String cccNoShortText = 'CCC #:';
const String cccNumberVerifiedText = 'CCC number verified';
const String cccNumberUnverifiedText =
    'The client provided the wrong CCC number. Please physically verify their '
    'identity before approving this request';
const String staffPinResetRequestsMessage =
    'These are staff who are having trouble signing in and have requested your assistance';
const String staffPinResetRequestsTitle = 'Staff PIN reset requests';

// search page
const String searchPageTitle = 'Please select who you want to search below';
const String clients = 'Clients';
const String staffMembers = 'Staff Members';
const String noNumberAvailable = 'No number available';

// search client
const String searchClientsTitle = 'Search clients';
const String searchClientsDescription =
    'Search clients using their CCC number, phone number or username';
const String searchClientsHintString = 'Search using CCC number...';
const String noClientFoundString = 'No client found';
const String couldNotFindClientString =
    'We could not find a client with the number ';
const String confirmCCCNumberIsCorrectString =
    '. Confirm that the CCC number is correct, or tap the button below to register them';
const String registerClientString = 'Register Client';
const String actions = 'Actions';
String tapBelowToInvite(String names) =>
    'Tap the button below to invite $names to $consumerAppName. They will receive and SMS with instructions on how to sign up';

String tapToResendInvite(String names) =>
    'If $names did not receive the $consumerAppName invite, tap the button below to resend them another invite using an alternative channel';

const String shareDiaryEntry = 'Shared diary entry';
const String youDoNotHavePermission =
    'Failed to assign roles, you are not authorized to assign roles';

// search client
const String searchStaffMembersTitle = 'Search staff members';
const String searchStaffMembersDescription =
    'Search staff members using their phone number, username, or staff number';
const String searchStaffMembersHintString =
    'Search using their name, username or phone number...';
const String noStaffMemberFoundString = 'No staff member found';
const String couldNotFindStaffMemberString =
    'We could not find a staff member ';
const String confirmStaffMemberIsCorrectString =
    '. Confirm that the staff number is correct, or tap the button below to register them';
const String registerStaffMemberString = 'Register Staff Member';
const String userRoles = 'User roles';
const String clientManagement = 'Client management';
const String contentManagement = 'Content management';
const String systemAdminstration = 'System administration';
const String communityManagement = 'Community management';
const String addRoleString = 'Add role';

const String authenticationErrorText = 'Authentication error';

// pin request
const String pinResetRequestSent = 'PIN reset request sent';
const String weHaveNotifiedAdmin =
    'Hey, we have notified your admin about your difficulty while signing in. '
    'They will reset your PIN once they verify your information';
const String oncePinRest =
    'Once your PIN has been reset, you will receive an SMS with a new PIN that'
    ' you will be required to change in your next login';
const String pendingPINRequestTitleString =
    'You have a pending PIN reset request';
const String pendingPINRequestMessageString =
    'Please be patient while an admin approves your request. If you signed in with the wrong phone number, tap the button below to try again';
const String signInWithAnotherNumberString = 'Sign in with another number';
const String verifySecurityQuestionHelpMessageString =
    'You seem to be having trouble verifying your security questions. If you need help, you can make a request for an admin to reset your PIN by tapping below';
const String noQuestionsLoadedString = 'No questions loaded';
const String noQuestionsLoadedDescription =
    'We were unable to load your security questions. Tap below load them again';

const String askForHelpString = 'Ask for help';
const String tryAgainString = 'Try Again';
const String cccNumberString = 'CCC number';
const String successfulPINResetRequestString =
    'PIN reset requested successfully';
const String sendingPINResetRequestSting = 'sending your pin reset request';
const String forgotYourPINString = 'Forgot your PIN?';
const String forgotPINPageMessageString =
    'Tap below to reset your PIN. You will be required to perform the following steps:\n\n1. Verify your phone number\n2. Verify your security questions\n3. Change your PIN';
const String resetMyPINString = 'Reset my PIN';
const String haveYouVerifiedQuestionString =
    'Have you verified their identity?';
const String identityConfirmationDialogMessageString =
    'You are required to verify this user’s identity physically before approving their request. Tap below to confirm';
const String identityVerified = 'Identity verified';

// PIN expired page strings
const String pinExpiredTitle = 'Your PIN has expired';
const String pinExpiredDescription =
    'It seems that your PIN has expired. No worries though. We expire PINs so as to enhance security of your data on myCareHub.\n\nTap the button below to change your PIN';
const String changePinCTA = 'Change my PIN';
const String inviteSent = 'An invite to join myCareHub has been sent to';
const String unableToSendInvite = 'An invite was not sent due to an error';
const String rolesAssigned = 'Roles have been successfully assigned to';

// remove user from group
const String removedFromGroup = 'removed from the group successfully';
const String unableToRemove = 'was not removed from group due to an error';
const String bannedString = 'Banned';

String userBannedMessage({
  bool isBanned = false,
  String? userName,
  String? communityName,
}) {
  if (userName != null &&
      userName.isNotEmpty &&
      communityName != null &&
      communityName.isNotEmpty) {
    return 'You have ${isBanned ? 'unbanned' : 'banned'} $userName from $communityName';
  } else if (userName != null && userName.isNotEmpty) {
    return 'You have ${isBanned ? 'unbanned' : 'banned'} $userName';
  } else {
    return 'User ${isBanned ? 'unbanned' : 'banned'} successfully';
  }
}

//Login error widget
const String invalidCredentialsErrorMsg =
    'Sorry, the credentials you provided are incorrect. Please try again \n\nYou can also tap the button below to reset your PIN\n';
const String invalidCredentialSting = 'Invalid credentials';
const String resetPINString = 'Reset your PIN';

const String responseNotMatchingText = 'One or more responses do not match';

// Flagged messages
const String flaggedMessagesString = 'Flagged messages';
const String flaggedMessagesDescription =
    'Here are messages that have been marked as inappropriate or offensive by this group’s members';
const String deleteMessageString = 'Delete Message';
const String muteUserString = 'Mute User';
const String noAvailableFlaggedMessagesDescription =
    'Please try again or contact support';
const String availableFlaggedMessagesText = 'flagged messages';
const String messageDeletedText = 'Message deleted successfully';
const String flaggedMessageText = 'I don’t like this group. Delete';
const String noFlaggedMessagesTitle = 'No flagged messages';
const String messagesDisplayedHereText =
    'When users flag messages, they will be displayed here for your intervention.';
const String canDeleteOrBanText =
    'You can choose to delete the message or ban a user from this group';

String redFlagSMSTemplate({
  required String clientName,
  required String staffFirstName,
  required String staffLastName,
  required String facilityName,
}) {
  return 'Hi $clientName, my name is $staffFirstName $staffLastName working at $facilityName for $consumerAppName.';
}

const String spacedIsFeelingString = ' is feeling ';

const String hereIsEntryString = ' here is their diary entry';
const String methodsToReachOutString =
    'Use the methods below to reach out to them';

// Screening tools
const String screeningToolsTitle = 'Screening tools';
final String screeningToolsPageLongDescription =
    'Responses from the various ${screeningToolsTitle.toLowerCase()}';
const String assessmentToolsResponsesPageDescription =
    "These are responses captured in the client's screening tools";

String fetchingScreeningToolsString = 'fetching screening tools';
String fetchingAssessmentResponsesString =
    'fetching this assessment tool responses';

const String assessmentCardTitle = 'Assessment card';
String hereIsWhatString = 'Here is what ';
String respondedInString = ' responded in their ';
String assessmentToolOnString = ' assessment tool on ';
const String assessmentCardString = 'Assessment card';
const String yesString = 'Yes';
const String noString = 'No';

// Assessment tools category page
String getAssessmentScorePageTitle({
  required ScreeningToolsType screeningToolsType,
}) {
  const String assessmentScoreString = 'assessment scores';
  switch (screeningToolsType) {
    case ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT:
      return 'Contraceptives $assessmentScoreString';
    case ScreeningToolsType.TB_ASSESSMENT:
      return 'Tuberculosis $assessmentScoreString';
    case ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT:
      return 'Alcohol use $assessmentScoreString';
    default:
      return 'Violence $assessmentScoreString';
  }
}

String getAssessmentScoreNoDatBodyText({
  required ScreeningToolsType screeningToolsType,
}) {
  return 'No Worries. ${getAssessmentScorePageTitle(screeningToolsType: screeningToolsType)} will show up here once clients have answered them';
}

String screeningToolsNoDatBodyText =
    'No Worries. Screening tools will show up here once clients have answered them';

String getAssessmentScoreName({
  required ScreeningToolsType screeningToolsType,
}) {
  switch (screeningToolsType) {
    case ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT:
      return 'contraceptives';
    case ScreeningToolsType.TB_ASSESSMENT:
      return 'tuberculosis';
    case ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT:
      return 'alcohol use';
    default:
      return 'violence';
  }
}

const String assessmentRequestItemDescriptionString =
    'Tap to view their full assessment card and reach out to them';
// resume with pin
String welcomeBackUserText(String? user) => 'Welcome back, ${user ?? ''}';
const String resumeWithPinText =
    'Let’s get you authenticated to access your account. Please enter your '
    'PIN to continue';
const String wrongPINText = 'Wrong PIN supplied. Please try again';

// Deactivated user
const String errorWhileReactivatingString =
    'An error ocurred while reactivating';
const String reactivatedSuccessfullyString =
    'has been reactivated successfully';
const String reactivateUserString = 'Reactivate User';
const String deactivatedUserPageDescriptionString =
    'is deactivated on myCareHub because they chose to opt-out of the platform.' +
        '\n\nIf you wish to reactivate them, tap the button to send them an invite with a new PIN';
const String deactivatedUserString = 'Deactivated user';

// Mood Selection
const String veryHappyString = 'Very Happy';
const String happyString = 'Happy';
const String neutralString = 'Meh';
const String sadString = 'Sad';
const String verySadString = 'Very Sad';

const String newText = 'New';

const String galleryImagesTitle = 'Gallery Images';

const String noTitleText = 'No title';

const String deleteGroupWarning =
    'Deleting the group will remove all members from this '
    'group and all messages will be deleted. You will need'
    ' to confirm this action before deletion';

const String getEditTitle = 'Edit group info';

const String emptyFieldErrorText = 'Please enter some text';
const String nameOfGroupText = 'Name of the group';
const String describeGroupText = 'Describe the group';
const String deleteGroupText = 'Delete group';

const String tooManyAttemptsString = 'Too many login attempts';
const String tooManyAttemptsMessageString =
    'You have made too many login attempts. No worries though, you can try again in ';
const String requestForAssistanceMessageString =
    'You can also request for assistance from your doctor or admin by tapping on the button below';

const String moderationHelpText =
    'Long press on a member to promote them to a moderator, '
    'remove or ban them from this group';
const String noConversationsAvailable = 'No conversations available';
const String noConversationsDescription =
    'You have not been added to any conversation yet. Tap below to view your conversation invites or start a conversation';
const String viewInvites = 'View Invites';
const String orString = 'or';

const String contactUpdateSuccessfulString =
    'Facility contact updated successfully';

const String enterAgeFromString = 'Please enter an age range from';
const String ageConstraintsString = ' 14 to 25';
const String fromString = 'From';
const String toString = 'To';
const String ageMustBeWithinRange = 'Age is invalid';
const String checkInternetText = 'Check your internet connection and try again';
const String searchFacilityActionString = 'Tap to search for a facility...';
const String searchOrganisationActionString =
    'Tap to search for an organisation...';
const String searchFacilityPageDescription =
    'Search for a facility using its MFL code or name';
const String searchOrganisationPageDescription =
    'Search for an organization using its name';
const String invalidPhoneNumber = 'Invalid phone number';

// service request actions
const String noFurtherActionRequiredString = 'No further action required';
const String followUpVisitBookedString = 'Follow up visit booked';
const String referredToCommunityString = 'Referred to community services';

//Facility contacts zero state
const String noFacilityContactsTitle = 'No facility contacts available';
const String noFacilityContactsDescription =
    'No Worries though. They will show up here once they have been added';
const String all = 'All';
const String unread = 'Unread';
const String viewResponses = 'View responses';
const String noResponsesTitle = 'Oops! no responses';
const String noResponsesDescription =
    'There seems to be no responses for this survey. We will notify you when new responses are available';
const String tapToViewTheirResponse = 'Tap to view their response';
const String responsesForTheSurvey = 'Responses for the survey';

//Survey service requests
const String responseString = 'response';
const String mentalHealthSurveyString = 'Mental health survey';
String getSurveyServiceRequestActionString(String surveyName) {
  return 'Tap to view service requests for the $surveyName';
}

const String tapToViewResponseString = 'Tap to view their response';
String getSurveyResponsesAppBarTitle(String surveyTitle) {
  return '$surveyTitle responses';
}

String getSurveyResponsesPageDescString(String surveyTitle) {
  return 'Responses from the $surveyTitle survey';
}

String getSurveyActionCardMessageString(String clientName) {
  return "Tap below to preview $clientName's response to this survey";
}

const String surveyResponsesSearchHintText =
    'Search for a client using their name...';
const String surveyResponseString = 'Survey response';
const String previewResponsesString = 'Preview Response';
const String fetchingSurveyResponsesString = 'fetching survey responses';
//Phase 2 strings
const String addFacilityString = 'Add Facility';
const String facilitiesString = 'Facilities';
const String clientConsentedString = 'Client consented';
const String clientNotConsentedString =
    'Client has not given consent for this caregiver';

String getFacilitiesDescriptionString(String name) {
  return 'Tap below to add facilities in which $name works at';
}

String getCaregiverDescriptionString(String name) {
  return "Here are $name's caregivers";
}

String getLinkedClientsDescriptionString(String name) {
  return "Here are the clients that $name's is managing";
}

String welcomeFacilitySelectionDescription(int count) =>
    "We've noticed that you're part of $count facilities. Choose which facility you would like to log into. Here are the details";

const String selectFacilityString = 'Please select your facility';

// User Programs
const String selectProgramString = 'Please choose your program';
const String fetchingProgramString = 'fetching your programs';
const String fetchingProgramFacilitiesString =
    "fetching your program's facilities";
const String noProgramsString = 'There are no programs linked to your account';
const String noProgramFacilitiesString =
    'There are no facilities linked to this program';

const String continueString = 'Continue';

const String addCaregiverDescriptionString =
    'As a caregiver, this user will be able to view medical information on behalf of another client.\n\nTo set this user as a caregiver, indicate the client that they will be managing';

const String addClientsString = 'Add Clients';

// search caregiver
const String searchCaregiversString = 'Search caregivers';
const String searchCaregiverDescriptionString =
    'Search caregivers using their phone number or username';
const String searchCaregiverString = 'Search caregivers';
const String noCaregiverFoundString = 'No caregiver found';
const String couldNotFindCaregiverString =
    'We could not find a caregiver with the keyword ';
const String confirmSearchTermIsCorrectString =
    '. Confirm that the search term is correct and try again';

const String addFacilitySuccessString = 'Facility added successfully';
const String removedFacilitySuccessString = 'Facility removed successfully';
const String caregiverNumberString = 'Caregiver number: ';
const String userNameLabel = 'Username: ';
const String userNameString = 'Username';
const String switchingYourFacility = 'Switching your facility';

// Organization selection
String getOrganizationDescriptionString(String userName) {
  return 'Hi $userName! Please select your organization';
}

const String optionalString = 'optional';

// Roles
const String rolesString = 'Roles';
const String organizations = 'Organizations';
const String programs = 'Programs';
const String manageRolesString = 'Manage roles';
const String searchRoleString = 'Search for a role using its name';
const String searchRoleHintString = 'Enter role name...';
const String mostUsedRolesString = 'Most used roles';
const String createRoleString = 'Create Role';
const String tapToViewMoreInfoString = 'Tap to view more info';
const String permissionsString = 'Permissions';
const String updateRoleString = 'Update role';
const String listOfThingsString =
    'Here is a list for the things someone with the ';
const String reviewAndAddString =
    ' role can perform. Please review and add or remove permissions as you wish';
const String saveChangesString = 'Save Changes';
const String deleteRoleString = 'Delete role';
const String deleteRoleDescriptionString =
    'This will revoke all permission sets for all users with this role';
const String manageTenantString = 'Manage Tenants';
const String manageProgramsString = 'Manage Program';
const String areYouReallySureTitle = 'Are you really sure?';
const String leaveGroupTitle = 'Leave group?';
const String leaveGroupDescriptionText =
    'Please confirm that you want to leave the group';
const String confirmDeletionSting =
    'Please confirm that you want to delete the ';
const String confirmRevokeSting = 'Please confirm that you want to revoke the';
const String pleaseTypeWordSting = ' Please type the word';
const String deleteSting = 'DELETE';
const String revokeSting = 'REVOKE';
const String belowSting = 'below';
const String searchRoles = 'Search roles';
const String cancelString = 'Cancel';
const String manageRolesDescription = 'Search for a role using its name';
const String assignRole = 'Assign role';
const String revokeRole = 'Revoke role';
const String revokeRoleDescriptionString =
    'This will remove all permission sets for this user and unassign them this role. They will not be able to manage clients after you perform this action';
const String userAssignedString = 'This user has been assigned the';
const String whatUserCanPerformString =
    'role. Here is what they can perform on the platform';
const String createANewRole = 'Create a new role';
const String createRoleDescription = 'Add details about your new role';
const String titleString = 'Title';
const String description = 'Description';

// TODO (Eugene)
///------------PLACEHOLDER STRINGS-----------
/// The are temporary strings used on the UI and are to be removed once the
/// APIs have been hooked up.
const String universityOfNairobiString = 'University of Nairobi';
const String worldClassHealthString = 'The world class healthcare facility';
const String myCareHubProgramString = 'The myCareHub program';
const String manageClientsString = 'Manage clients';
const String clientManagementString = 'Client management';
const String systemAdministratorString = 'System administrator';
const String everythingAvailableString =
    'Everything on the platform is available';
const String staffManagementString = 'Staff management';
const String viewAndManageMembersString = 'View and manage staff members';
const String superAdminString = 'Survey admin';
const String manageAndSendOutSurveysString =
    'Manage and send out surveys on the platform';
const String noRoleFound = 'No role found';
const String noRoleFoundDescription =
    'We could not find a role with that name. Please confirm that the search criteria you entered is correct or tap the button below to create a role';
const String roleCreatedTitle = 'Role created successfully';
const String roleCreatedDescription =
    'The role was created successfully. Tap the button below to assign permissions to your role';
const String assignPermissions = 'Assign permissions';
final List<Map<String, String>> permissions = <Map<String, String>>[
  <String, String>{
    'title': 'Client search',
    'description':
        'Search for all clients on the platform using their phone number, nickname or CCC number',
  },
  <String, String>{
    'title': 'Invite to myCareHub',
    'description':
        'Invite clients onto the platform. This includes being able to resend client invites ',
  },
  <String, String>{
    'title': 'Deactivate clients',
    'description':
        'Deactivate clients so that they are not able to access the platform. The deactivated users will not be able to sign in to the platform',
  },
  <String, String>{
    'title': 'Ban clients',
    'description':
        'This allows the user to ban clients on the platform for moderation purposes. A banned user will not be allowed to access the platform',
  },
];

const String manageOrganizationString = 'Manage organizations';
const String searchOrganizationTextString =
    'Search for an Organization using its name';
const String searchOrganizationHintString = 'Search organizations';
const String mostViewedOrganizationString = 'Most viewed organizations';

const String createOrganizationString = 'Create Organization';

String orgName(String name) {
  return '$name Organization';
}

const String programsString = 'Programs';
const String programString = 'Program';
const String runningProgramString =
    'Programs that the organization is currently running';
const String addProgramString = 'Add Program';
const String deactivateOrgString = 'Deactivate Organization';
const String deactivateOrgInfoString =
    'This will deactivate this organization on myCareHub';

String programName(String name) {
  return '$name Program';
}

const String deactivateProgramString = 'Deactivate Program';
const String deactivateProgramInfoString =
    'This will deactivate this program on myCareHub';
const String organizationString = 'Organization';
const String diseaseAreasString = 'Disease Areas';
const String diseaseAreasDescriptionString =
    'Disease areas that this program is running on';
const String runningFacilitiesString =
    'Facilities that this program is running on';
const String addOrganizationDetailsString =
    'Add details about your new organization';
const String nameString = 'Name';
const String descriptionString = 'Description';

const String searchProgramTextString = 'Search for a program using its name';
const String searchProgramHintString = 'Search programs';
const String searchResultsString = 'Search results';
const String createProgramString = 'Create Program';
const String addProgramDetailString = 'Add details about your new program';

const String registrationNumberString = 'Registration Number';
const String countryString = 'Country';

const String physicalAddressString = 'Physical Address';
const String createProgramSuccess = 'Successfully created program';

const String defaultString = 'Default';
const String acceptGroupInvites = 'Accept group invites';
const String invitedGroups = 'Invited groups';
const String createARoom = 'Create a room';
const String createRoomString = 'Create Room';
const String leaveRoomString = 'Leave room';
const String welcomeAndEnterYourRoomDetailsString =
    'Welcome, enter your room details below';
const String enterNameString = 'Enter name';
const String topicString = 'Topic';
const String enterTopicString = 'Enter topic';
const String noNameString = 'No Name';
const String hasBeenInvitedSuccessfullyString = 'has been invited successfully';
const String noUserIdString = 'No User ID';
const String noRoomNameString = 'No room name';
const String theTopicHasBeenSetToString = 'The topic was set to';
const String groupMembersString = 'Group members';
const String createdTheGroupOnString = 'created the group on';
const String groupString = 'group';
const String thisMessageHasBeenDeletedString = 'This message was deleted';
const String youHaveBeenInvitedToJoinString =
    'You have been invite to join the';
const String tapTheOptionsBelowToDeclineText =
    'Tap the options below to accept or decline the group invite';
const String groupMembersInstructionString =
    'Long press on a member to promote them to a moderator, '
    'remove or ban them from this group';
const String searchMembersInstructionString =
    'Search for members to invite to the group';
const String optionsToBeAvailableSoonString =
    'Options for this media item will be available soon';
const String messageOptionsString = 'Message options';
const String replyInThreadString = 'Reply in thread';
const String fetchingYourMessagesString = 'Fetching your messages...';
const String noMessagesHereString = 'No messages here';
const String removeFromGroupString = 'Remove from group';
const String banThisUserString = 'Ban this user';
const String youWereInvitedInstructionText =
    'You were invited. Tap for more info';
const String userRemovedSuccessText = 'User removed from group successfully!';
const String permissionErrorMessageText =
    'Sorry, you do not have permissions to delete their message';
const String membersString = 'members';
const String sendATextMessageString = 'Send a text message...';
const String typeYourTextMessageString = 'Type your text message...';
const String roomsZeroStateDescriptionText =
    'Sorry, You have no rooms yet. No worries though, tap the button below to create your first group';
