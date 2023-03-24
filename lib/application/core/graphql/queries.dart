const String getTermsQuery = '''
query getCurrentTerms {
  getCurrentTerms {
    termsID
    text
  }
}
''';

const String getSecurityQuestionsQuery = r'''
query getSecurityQuestions($flavour: Flavour!) {
  getSecurityQuestions(flavour: $flavour) {
    securityQuestionID
    questionStem
    description
    active
    responseType
  }
}
''';
const String searchFacilityQuery = r'''
query searchFacility($searchParameter: String) {
  searchFacility(searchParameter: $searchParameter) {
    id
    name
    identifier{
      id
      value
      type
    }
  }
}
''';

const String getServiceRequestsQuery = r'''
query getServiceRequests($type: String, $status: String, $facilityID: String!, $flavour: Flavour!){
  getServiceRequests(requestType: $type, requestStatus: $status, facilityID: $facilityID, flavour: $flavour){
    id
    requestType
    request
    clientID
    facilityID
    clientName
    clientContact
    staffContact
    staffID
    staffName
    status
    createdAt
    meta
  }
}
''';

const String searchServiceRequestsQuery = r'''
query searchServiceRequests($searchTerm: String!, $flavour: Flavour!, $requestType: String!, $facilityID: String!){
  searchServiceRequests(searchTerm: $searchTerm, flavour: $flavour, requestType: $requestType, facilityID: $facilityID){
    id
    requestType
    clientName
    staffName
    status
    clientID
    createdAt
    staffContact
    clientContact
    meta
    clientContact
    staffContact
  }
}
''';

const String getResolvedServiceRequestsQuery = r'''
query getServiceRequests($type: String, $status: String, $facilityID: String!, $flavour: Flavour!){
  getServiceRequests(requestType: $type, requestStatus: $status, facilityID: $facilityID, flavour: $flavour){
    id
    requestType
    request
    clientID
    facilityID
    clientName
    clientContact
    status
    resolvedAt
    resolvedBy
    resolvedByName
    createdAt
    meta
    staffID
    staffName
    staffContact
  }
}
''';

const String getPendingServiceRequestsCountQuery = r'''
query getPendingServiceRequestsCount($facilityID: String!){
  getPendingServiceRequestsCount(facilityID: $facilityID){
    clientsServiceRequestCount {
      requestsTypeCount {
        requestType
        total
      }
    }
    staffServiceRequestCount {
      requestsTypeCount {
        requestType
        total
      }
    }
  }
}
''';

const String listMembersQuery = r'''
query listMembers($input: QueryOption){
  listMembers(input: $input){
    id
    userID
    role
    userType
    username
  }
}
''';

const String searchClientQuery = r'''
query searchClientUser($searchParameter: String!) {
  searchClientUser(searchParameter: $searchParameter){
    id
    cccNumber
    active 
    user{
      id
      username
      name
      active
      contacts{
        id
        contactValue
        active
        optedIn
      }
      termsAccepted
    }
      defaultFacility{
      id
      name
      phone
      active
      description
    }
  }
}
''';

const String searchStaffMemberQuery = r'''
query searchStaffUser($searchParameter: String!) {
  searchStaffUser(searchParameter: $searchParameter) {
    id
    staffNumber
    user{
      id
      username
      name
      active
      contacts{
        id
        contactType
        contactValue
        active
        optedIn
      }
      termsAccepted
      isPhoneVerified
      acceptedTermsID
      suspended
      currentProgramID
      currentOrganizationID
    }
    defaultFacility{
      id
      name
      phone
      active
      description
    }
  }
}
''';

const String getUserRolesQuery = r'''
query getUserRoles($userID: String!, $organisationID: String!){
  getUserRoles(userID: $userID, organisationID: $organisationID){
    authorityRoleID
    name
    active
  }
}
''';

const String getAvailableFacilityScreeningToolsQuery = r'''
query getAvailableFacilityScreeningTools($facilityID: String!){
  getAvailableFacilityScreeningTools(facilityID: $facilityID){
    toolType
  }
}
''';

const String verifyPinQuery = r'''
query verifyPin($userID: String!, $flavour:Flavour!, $pin: String!){
  verifyPIN(userID: $userID, flavour: $flavour, pin: $pin)
}
''';

const String getAssessmentResponsesByToolTypeQuery = r'''
query getAssessmentResponsesByToolType(
  $facilityID: String!
  $toolType: String!
) {
  getAssessmentResponsesByToolType(
    facilityID: $facilityID
    toolType: $toolType
  ) {
    clientName
    dateAnswered
    clientID
  }
}
''';

const String recentlySharedHealthDiaryQuery = r'''
query getSharedHealthDiaryEntries($clientID: String!, $facilityID: String!){
  getSharedHealthDiaryEntries(clientID:$clientID, facilityID: $facilityID){
    id
    active
    mood
    note
    sharedAt
  }
}
''';

const String getScreeningToolServiceRequestResponsesQuery = r'''
query getScreeningToolServiceRequestResponses($clientID: String!, $toolType: ScreeningToolType!) {
  getScreeningToolServiceRequestResponses(
    clientID: $clientID,
    toolType: $toolType
  ) {
    serviceRequestID
    clientContact
    screeningToolResponses {
      toolIndex
      tool
      response
    }
  }
}
''';

const String listNotificationsQuery = r'''
query listNotifications(
  $flavour: Flavour!
  $userID: ID!
  $paginationInput: PaginationsInput!
  $filters: NotificationFilters
) {
  fetchNotifications(
    flavour: $flavour
    userID: $userID
    paginationInput: $paginationInput
    filters: $filters
  ) {
    notifications {
      id
      title
      body
      type
      isRead
      createdAt
    }
  }
}
''';

const String listSurveysQuery = r'''
query listSurveys($projectID: Int!){
  listSurveys(projectID: $projectID) {
    projectID
    xmlFormID
    name
  }
}
''';

const String getSurveyWithServiceRequestQuery = r'''
query getSurveyWithServiceRequest($facilityID: String!) {
  getSurveyWithServiceRequest(facilityID: $facilityID) {
    title
    projectID
    formID
    linkID
  }
}
''';

const String getSurveyServiceRequestUserQuery = r'''
query getSurveyServiceRequestUser(
    $facilityID: String!
    $projectID: Int!
    $formID: String!
    $paginationInput: PaginationsInput!
){
  getSurveyServiceRequestUser(
    facilityID: $facilityID
    projectID: $projectID
    formID: $formID
    paginationInput: $paginationInput
  ){
    users{
      name
      formID
      projectID
      submitterID
      serviceRequestID
      phoneNumber
      surveyName
    }
    pagination{
      Limit
      CurrentPage
    }
  }
}
''';

const String getCategoriesQuery = '''
query listContentCategories{
  listContentCategories{
   id
   name
   iconUrl
  }
}
''';

const String getFAQsQuery = r'''
query getFAQs($flavour: Flavour!){
  getFAQs(flavour: $flavour){
    items {
      id
      title
      date
      intro
      authorName
      tagNames
      meta{
        contentType
        slug
        showInMenus
        seoTitle
        searchDescription
        firstPublishedAt
        locale
      }
      itemType
      timeEstimateSeconds
      body
      heroImageRendition{
        url
        width
        height
        alt
      }
      documents {
        id
        document {
          id
          title
          meta {
            documentDetailUrl
            documentDownloadUrl
          }
        }
      }
      featuredMedia{
        id
        url
        title
        type
        duration
        width
        height
        thumbnail
        duration
      }
      galleryImages{
        id
        image{
          id
          title
          meta{
            imageDownloadUrl
          }
        }
      }
    }
  }
}
''';

const String retrieveFacilityQuery = r'''
query retrieveFacility($id: String!, $active: Boolean!){
  retrieveFacility(id: $id, active: $active) {
    id
    name
    code
    phone
  }
}
''';

const String fetchNotificationFilters = r'''
query fetchNotificationTypeFilters($flavour: Flavour!) {
  fetchNotificationTypeFilters(flavour: $flavour) {
  name,
  enum  
  }
}
''';
const String listSurveyRespondentsQuery = r'''
query listSurveyRespondents(
  $projectID: Int!,
  $formID: String!,
  $paginationInput: PaginationsInput!,
){
  listSurveyRespondents(
    projectID: $projectID,
    formID: $formID,
    paginationInput: $paginationInput,
  ){
    surveyRespondents{
      id
      name
      projectID
      submitterID
      submittedAt
      formID
    }
    pagination{
      limit
      currentPage
      count
      totalPages
      nextPage
      previousPage
    }
  }
}''';

const String surveyResponseQuery = r'''
query surveyResponse($input: SurveyResponseInput!) {
  getSurveyResponse(input: $input) {
    question
    questionType
    answer
  }
}
''';

const String searchCaregiverUserQuery = r'''
query searchCaregiverUser($searchParameter: String!){
  searchCaregiverUser(searchParameter: $searchParameter){
    id
    user{
      id
      username
      name
      contacts{
        contactType
        contactValue
      }
    }
    caregiverNumber
    isClient
  }
}
''';

const String getClientFacilitiesQuery = r'''
query getClientFacilities($clientID: ID! $paginationInput: PaginationsInput!){
  getClientFacilities(clientID: $clientID, paginationInput: $paginationInput){
    facilities{
      id
      name
      phone
      active
      description
      fhirOrganisationID
      workStationDetails{
        notifications
        surveys
        articles
        messages
      }
    }
  }
}
''';

const String getCaregiverManagedClientsQuery = r'''
query getCaregiverManagedClients(
  $caregiverID: ID!, 
  $paginationInput: PaginationsInput!
){
  getCaregiverManagedClients(
    caregiverID: $caregiverID
    paginationInput: $paginationInput
  ){
    managedClients{
      caregiverConsent
			clientConsent
      clientProfile{
        id
        user{
          id
          username
          name
          contacts{
            id
            contactType
            contactValue
          }
        }
      }
      workStationDetails{
        notifications
        surveys
      }
    }
  }
}
''';

const String listClientsCaregiversQuery = r'''
query listClientsCaregivers($clientID: String!, $paginationInput: PaginationsInput) {
  listClientsCaregivers(clientID: $clientID, paginationInput: $paginationInput) {
    caregivers {
      id
      user {
        id
        username
        name
        contacts {
          contactValue
        }
      }
      consent{
        consentStatus
      }
    }
  }
}
''';

const String listUserProgramsQuery = r'''
query listUserPrograms($userID: ID!, $flavour: Flavour!) {
  listUserPrograms(userID: $userID, flavour: $flavour) {
    count
    programs{
      id
      name
      active
      organisation{
        id
        description
        description
      }
    }
  }
}
''';

const String getStaffFacilitiesQuery = r'''
query getStaffFacilities($staffID: ID!, $paginationInput: PaginationsInput!){
  getStaffFacilities(staffID: $staffID, paginationInput: $paginationInput){
    facilities{
    id
    name
    phone
    active
    description
    fhirOrganisationID
    workStationDetails{
      notifications
      messages
      surveys
      articles
      serviceRequests
      }
    }   
  }
}
''';

const String listOrganizationsQuery = r'''
query listOrganisations($paginationInput: PaginationsInput!){
  listOrganisations(paginationInput: $paginationInput){
    organisations{
      id
      name
      description
      programs {
        id
        name
        description
        facilities {
          id
          name
          phone
          country
          description
          fhirOrganisationID
          identifier {
            id
            active
            type
            value
          }
        }
      }
    }
  }
}
''';

const String searchOrganizationQuery = r'''
query searchOrganisations($searchParameter: String!){
 searchOrganisations(searchParameter: $searchParameter){
  id
  name
  description
  programs{
    id
    active
    name
    description
  }
} 
}
''';

const String searchProgramsQuery = r'''
query searchPrograms($searchParameter: String!){
  searchPrograms(searchParameter: $searchParameter){
    id
    active
    name
    organisation{
      id
      name
      description
    }
  }
}
''';

const String checkIfPhoneExistsQuery = r'''
query checkIfPhoneExists($phoneNumber: String!){
  checkIfPhoneExists(phoneNumber: $phoneNumber)
}
 ''';
