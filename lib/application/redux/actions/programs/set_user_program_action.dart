import 'dart:async';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_user_profile_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/programs/update_programs_state_action.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user_profile.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/set_user_program_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:http/http.dart';

class SetUserProgramAction extends ReduxAction<AppState> {
  SetUserProgramAction({
    required this.client,
    this.onFailure,
    required this.program,
  });

  final void Function(String message)? onFailure;
  final IGraphQlClient client;
  final Program program;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(setUserProgramFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(setUserProgramFlag));
    dispatch(UpdateProgramsStateAction(errorGettingPrograms: false));
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'programID': program.id,
    };

    final Response response =
        await client.query(setStaffProgramMutation, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        dispatch(UpdateProgramsStateAction(errorGettingPrograms: true));
        reportErrorToSentry(
          hint: setUserProgramErrorString,
          query: setStaffProgramMutation,
          variables: variables,
          response: response,
          state: state,
          exception: errors,
        );

        onFailure?.call(getErrorMessage('setting your program'));
        return state;
      }

      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;

      final SetUserProgramResponse setUserProgramResponse =
          SetUserProgramResponse.fromJson(
        data?['setStaffProgram'] as Map<String, dynamic>,
      );

      final User? user = state.userProfileState?.userProfile?.user?.copyWith(
        userId: setUserProgramResponse.staffProfile?.user?.userId,
        username: setUserProgramResponse.staffProfile?.user?.username,
        name: setUserProgramResponse.staffProfile?.user?.name,
        gender: setUserProgramResponse.staffProfile?.user?.gender,
        active: setUserProgramResponse.staffProfile?.user?.active,
        chatRoomToken: setUserProgramResponse.communityToken,
      );

      final UserProfile? userProfile =
          state.userProfileState?.userProfile?.copyWith(
        id: setUserProgramResponse.staffProfile?.id,
        user: user,
        staffNumber: setUserProgramResponse.staffProfile?.staffNumber,
        defaultFacility: setUserProgramResponse.staffProfile?.defaultFacility,
      );

      dispatch(UpdateUserProfileStateAction(userProfile: userProfile));

      dispatch(UpdateProgramsStateAction(selectedUserProgram: program));

      dispatch(
        NavigateAction<AppState>.pushNamed(AppRoutes.facilitySelectionPage),
      );
    } else {
      onFailure?.call(getErrorMessage('setting your program'));
      reportErrorToSentry(
        hint: setUserProgramErrorString,
        query: setStaffProgramMutation,
        variables: variables,
        response: response,
        state: state,
      );
    }
    return state;
  }
}
