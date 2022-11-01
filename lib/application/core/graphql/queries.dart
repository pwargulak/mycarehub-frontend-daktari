const String getTermsQuery = r'''
query getCurrentTerms($flavour: Flavour!) {
  getCurrentTerms(flavour: $flavour) {
    termsID
    text
  }
}
''';

const String getSecurityQuestionsQuery = r'''
query getSecurityQuestions($flavour: Flavour!) {
  getSecurityQuestions(flavour: $flavour) {
    SecurityQuestionID
    QuestionStem
    Description
    Active
    ResponseType
  }
}
''';
const String searchFacilityQuery = r'''
query searchFacility($searchParameter: String) {
  searchFacility(searchParameter: $searchParameter) {
    ID
    name
    code
  }
}
''';

const String getServiceRequestsQuery = r'''
query getServiceRequests($type: String, $status: String, $facilityID: String!, $flavour: Flavour!){
  getServiceRequests(requestType: $type, requestStatus: $status, facilityID: $facilityID, flavour: $flavour){
    ID
    RequestType
    Request
    ClientID
    FacilityID
    ClientName
    ClientContact
    StaffContact
    StaffID
    StaffName
    Status
    CreatedAt
    Meta
  }
}
''';

const String searchServiceRequestsQuery = r'''
query searchServiceRequests($searchTerm: String!, $flavour: Flavour!, $requestType: String!, $facilityID: String!){
  searchServiceRequests(searchTerm: $searchTerm, flavour: $flavour, requestType: $requestType, facilityID: $facilityID){
    ID
    RequestType
    ClientName
    StaffName
    Status
    ClientID
    CreatedAt
    StaffContact
    ClientContact
    Meta
    ClientContact
    StaffContact
  }
}
''';

const String getResolvedServiceRequestsQuery = r'''
query getServiceRequests($type: String, $status: String, $facilityID: String!, $flavour: Flavour!){
  getServiceRequests(requestType: $type, requestStatus: $status, facilityID: $facilityID, flavour: $flavour){
    ID
    RequestType
    Request
    ClientID
    FacilityID
    ClientName
    ClientContact
    Status
    ResolvedAt
    ResolvedBy
    ResolvedByName
    CreatedAt
    Meta
    StaffID
    StaffName
    StaffContact
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

const String inviteMembersToCommunityQuery = r'''
query inviteMembersToCommunity($communityID: String!,$memberIDs: [String!]! ){
  inviteMembersToCommunity(communityID: $communityID, memberIDs: $memberIDs)
}
''';

const String listCommunityMembersQuery = r'''
query listCommunityMembers($communityID: ID!, $communityMembersFilter: QueryOption!, $listCommunitiesFilter: QueryOption!){
	listCommunityMembers(communityID: $communityID, input: $communityMembersFilter) {
      user{
        id
        userID
        username
        role
        extraData
      }
      isModerator
  }
  listCommunities(input: $listCommunitiesFilter) {
    ageRange {
      lowerBound
      upperBound
    }
    gender
    clientType
  }
}
''';

const String listUserInvitedCommunitiesQuery = r'''
query listPendingInvites($memberID: String!, $input: QueryOption){
  listPendingInvites(memberID: $memberID, input: $input){
    id
    name
    memberCount
    gender
    description
  }
}
''';

const String searchClientQuery = r'''
query searchClientUser($searchParameter: String!) {
  searchClientUser(searchParameter: $searchParameter){
    ID
    CCCNumber
    Active 
    User{
      ID
      Username
      Name
      Active
      Contacts{
        id
        contactValue
        active
        optedIn
      }
      TermsAccepted
    }
      DefaultFacility{
      ID
      name
      code
      phone
      active
      county
      description
    }
  }
}
''';

const String searchStaffMemberQuery = r'''
query searchStaffUser($searchParameter: String!) {
  searchStaffUser(searchParameter: $searchParameter) {
    ID
    StaffNumber
    User{
      ID
      Username
      Name
      Active
      Contacts{
        id
        contactType
        contactValue
        active
        optedIn
      }
      TermsAccepted
    }
    DefaultFacility{
      ID
      name
      code
      phone
      active
      county
      description
    }
  }
}
''';

const String getUserRolesQuery = r'''
query getUserRoles($userID: String!){
  getUserRoles(userID: $userID){
    authorityRoleID
    name
    active
  }
}
''';

const String listFlaggedMessagesQuery = r'''
query listFlaggedMessages($communityCID: String,$memberIDs: [String]){
  listFlaggedMessages(communityCID: $communityCID,memberIDs: $memberIDs){
    message{
      id
      text
      created_at
      user{
        id
        userID
        name
        username
      }
      attachments{
        type
        title
        image_url
      }
    }
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
    projectId
    xmlFormId
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
      ID
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
        ID
        Document {
          ID
          title
          meta {
            documentDetailUrl
            documentDownloadUrl
          }
        }
      }
      featuredMedia{
        ID
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
        ID
        image{
          ID
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
    ID
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
      Limit
      CurrentPage
      Count
      TotalPages
      NextPage
      PreviousPage
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
      ID
      Username
      Name
      Contacts{
        contactType
        contactValue
      }
    }
    caregiverNumber
    isClient
  }
}
''';

const String getUserLinkedFacilitiesQuery = r'''
query getUserLinkedFacilities($userID: ID! $paginationInput: PaginationsInput!){
  getUserLinkedFacilities(userID: $userID, paginationInput: $paginationInput){
    Pagination{
      Limit
      CurrentPage
      Count
      TotalPages
      NextPage
      PreviousPage
    }
    Facilities{
      ID
      name
      code
      phone
      active
      county
      description
      fhirOrganisationID
      workStationDetails{
        Notifications
        Surveys
        Articles
        Messages
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
    ManagedClients{
      caregiverConsent
			clientConsent
      clientProfile{
        ID
        User{
          ID
          Username
          Name
          Contacts{
            id
            contactType
            contactValue
          }
          DateOfBirth
        }
      }
      workStationDetails{
        Notifications
        Surveys
      }
    }
  }
}
''';
