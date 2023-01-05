import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/communities_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/community_members/community.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class UpdateCommunitiesStateAction extends ReduxAction<AppState> {
  UpdateCommunitiesStateAction({
    this.communitiesList,
    this.flaggedMessages,
  });

  final List<Community?>? communitiesList;
  final List<Message?>? flaggedMessages;

  @override
  AppState reduce() {
    final CommunitiesState? communitiesState =
        state.userProfileState?.communitiesState;

    final CommunitiesState? newCommunitiesState =
        state.userProfileState?.communitiesState?.copyWith(
      invitedCommunities:
          communitiesList ?? communitiesState?.invitedCommunities,
      flaggedMessages: flaggedMessages ?? communitiesState?.flaggedMessages,
    );

    final AppState newState = state.copyWith(
      userProfileState: state.userProfileState
          ?.copyWith(communitiesState: newCommunitiesState),
    );
    return newState;
  }
}
