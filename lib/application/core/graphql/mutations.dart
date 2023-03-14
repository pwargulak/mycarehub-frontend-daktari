import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

const String acceptTermsAndConditionsMutation = r'''
mutation acceptTerms($userID: String!, $termsID: Int!){
  acceptTerms(userID: $userID, termsID: $termsID)
}
 ''';

Map<String, dynamic> getTermsVariables({String? userId, int? termsId}) {
  return <String, dynamic>{
    'userID': userId,
    'termsID': termsId,
    'flavour': Flavour.pro.name,
  };
}

const String setNickNameMutation = r'''
mutation setNickName($userID: String!, $nickname: String!) {
  setNickName(userID: $userID, nickname: $nickname)
}
 ''';

const String completeOnboardingTourMutation = r'''
mutation completeOnboardingTour($userID: String!, $flavour: Flavour!){
  completeOnboardingTour(userID: $userID, flavour: $flavour)
}
 ''';

const String recordSecurityQuestionResponsesMutation = r'''
mutation recordSecurityQuestionResponses($input: [SecurityQuestionResponseInput!]!){
  recordSecurityQuestionResponses(input: $input){
    securityQuestionID,
    isCorrect
  }
}
 ''';

const String setUserPINMutation = r'''
mutation setUserPin($input: PINInput!){
  setUserPIN(input: $input)
}
 ''';

Map<String, dynamic> setUserPINMutationVariables(
  Map<String, dynamic> setUserPINVariables,
) {
  return <String, dynamic>{'input': setUserPINVariables};
}

const String registerClientMutation = r'''
mutation registerClient($input: ClientRegistrationInput){
  registerClient(input:$input){
    id
    active
    clientTypes
    enrollmentDate
    fhirPatientID
    emrHealthRecordID
    treatmentBuddy
    counselled
    organisation
    userID
    currentFacilityID
    chv
    caregiver
  }
}
 ''';

const String registerStaffMutation = r'''
mutation registerStaff($input: StaffRegistrationInput!){
  registerStaff(input:$input){
    id
    active
    staffNumber
    userID
    defaultFacility
  }
}
 ''';

const String inviteUser = r'''
mutation inviteUser($userID: String!, $phoneNumber: String!, $flavour: Flavour!){
  inviteUser(userID:$userID, phoneNumber: $phoneNumber, flavour:  $flavour)
}
 ''';

const String verifyClientPinResetServiceRequestQuery = r'''
mutation verifyClientPinResetServiceRequest(
  $clientID: String!
  $serviceRequestID: String!
  $cccNumber: String!
  $phoneNumber: String!
  $physicalIdentityVerified: Boolean!
  $state:String!
) {
  verifyClientPinResetServiceRequest(
    clientID: $clientID
    serviceRequestID: $serviceRequestID
    cccNumber: $cccNumber
    phoneNumber: $phoneNumber
    physicalIdentityVerified: $physicalIdentityVerified
    state: $state
  )
}
''';

const String verifyStaffPinResetServiceRequestQuery = r'''
mutation verifyStaffPinResetServiceRequest($phoneNumber: String!, $serviceRequestID: String!, $verificationStatus: String!){
  verifyStaffPinResetServiceRequest(phoneNumber: $phoneNumber, serviceRequestID: $serviceRequestID, verificationStatus: $verificationStatus)
}
''';

const String inviteUserMutation = r'''
mutation inviteUser($userID: String!, $phoneNumber: String!, $flavour: Flavour!, $reinvite: Boolean!) {
  inviteUser(userID: $userID, phoneNumber: $phoneNumber, flavour: $flavour, reinvite: $reinvite)
}
''';

const String assignOrRevokeRolesMutation = r'''
mutation assignOrRevokeRoles($userID: String!, $roles: [UserRoleType!]!){
  assignOrRevokeRoles(userID: $userID, roles: $roles)
}
''';

const String resolveServiceRequestMutation = r'''
mutation ResolveServiceRequest($staffID: String!, $requestID: String!, $action: [String!]!, $comment: String){
  resolveServiceRequest(staffID: $staffID, requestID: $requestID, action: $action, comment: $comment)
}
''';

const String setPushTokenMutation = r'''
mutation setPushToken($token: String!){
  setPushToken(token: $token)
}
''';

const String sendClientSurveyLinksMutation = r'''
mutation sendClientSurveyLinks(
  $facilityID: String!, 
  $formID: String!, 
  $projectID: Int!, 
  $filterParams: ClientFilterParamsInput ){
  sendClientSurveyLinks(
    facilityID: $facilityID,
    formID: $formID,
    projectID: $projectID,
    filterParams: $filterParams
    )
}
''';

const String readNotificationsMutation = r'''
mutation readNotifications($ids: [ID!]!){
  readNotifications(ids: $ids)
}
''';

const String addFacilityContactMutation = r'''
mutation addFacilityContact($facilityID: ID!, $contact: String!) {
  addFacilityContact(facilityID: $facilityID, contact: $contact)
}
''';

const String registerCaregiverMutation = r'''
mutation registerCaregiver($input: CaregiverInput!) {
  registerCaregiver(input: $input) {
    id
    caregiverNumber
    user {
      id
      name
    }
  }
}
''';
const String addFacilitiesToClientProfileMutation = r'''
mutation addFacilitiesToClientProfile(
  $clientID: ID! ,
  $facilities: [ID!]!
) {
  addFacilitiesToClientProfile(
    clientID: $clientID,
    facilities: $facilities
  )
}
''';

const String addFacilitiesToStaffProfileMutation = r'''
mutation addFacilitiesToStaffProfile(
  $staffID: ID! ,
  $facilities: [ID!]!
) {
  addFacilitiesToStaffProfile(
    staffID: $staffID,
    facilities: $facilities
  )
}
''';

const String removeFacilitiesFromClientProfileMutation = r'''
mutation removeFacilitiesFromClientProfile(
  $clientID: ID! ,
  $facilities: [ID!]!
) {
  removeFacilitiesFromClientProfile(
    clientID: $clientID,
    facilities: $facilities
  )
}
''';

const String removeFacilitiesFromStaffProfileMutation = r'''
mutation removeFacilitiesFromStaffProfile(
  $staffID: ID! ,
  $facilities: [ID!]!
) {
  removeFacilitiesFromStaffProfile(
    staffID: $staffID,
    facilities: $facilities
  )
}
''';

const String setStaffDefaultFacilityMutation = r'''
mutation setStaffDefaultFacility(
  $staffID: ID!,
  $facilityID: ID!
){
  setStaffDefaultFacility(staffID: $staffID, facilityID: $facilityID){
    id
    name
  }
}
''';
const String setStaffProgramMutation = r'''
mutation setStaffProgram($programID: ID!) {
  setStaffProgram(programID: $programID) {
    staffProfile {
     id
      user{
        id
        username
        name
        gender
        active
        contacts{
          id
          contactType
          contactValue
        }
      }
      staffNumber
      defaultFacility{
        id
        name
      }
    }
    communityToken
  }
}
''';
const String createOrganisationMutation = r'''
mutation createOrganisation($organisationInput: OrganisationInput!, $programInput: [ProgramInput]) {
  createOrganisation(organisationInput: $organisationInput, programInput: $programInput)
}
''';

const String createProgramMutation = r'''
mutation createProgram($input: ProgramInput!) {
  createProgram(input: $input)
}''';

const String assignCaregiverMutation = r'''
mutation assignCaregiver($input: ClientCaregiverInput!) {
  assignCaregiver(input: $input)
}''';
