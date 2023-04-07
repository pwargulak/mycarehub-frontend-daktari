import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/sign_in_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/sync_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/communities/communities_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/communities/widgets/room_list_item_widget.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/core/bottom_nav/bottom_nav_bar.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/sync_params.dart';

class RoomListPage extends StatefulWidget {
  const RoomListPage({super.key});

  @override
  State<RoomListPage> createState() => _RoomListPageState();
}

class _RoomListPageState extends State<RoomListPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await StoreProvider.dispatch(
        context,
        SignInAction(
          client: AppWrapperBase.of(context)!.communitiesClient!,
        ),
      );
    });

    super.initState();
  }

  Future<void> onRefresh(BuildContext context) async {
    StoreProvider.dispatch<AppState>(
      context,
      SyncAction(
        syncParams: SyncParams(
          fullState: true,
          fullSync: true,
          forceFull: true,
          client: AppWrapperBase.of(context)!.communitiesClient!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const CustomAppBar(title: communityPageString, showBackButton: false),
      bottomNavigationBar: const BottomNavBar(bottomNavIndex: 2),
      body: RefreshIndicator(
        onRefresh: () async => onRefresh(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: StoreConnector<AppState, RoomListViewModel>(
                  converter: (Store<AppState> store) {
                    return RoomListViewModel.fromStore(store);
                  },
                  onInit: (Store<AppState> store) {},
                  builder: (BuildContext context, RoomListViewModel vm) {
                    if (vm.syncing) {
                      return Center(
                        child: Column(
                          children: <Widget>[
                            const Text(syncingString),
                            mediumVerticalSizedBox,
                            const CircularProgressIndicator(strokeWidth: 1),
                          ],
                        ),
                      );
                    }

                    if (vm.rooms?.isEmpty ?? true) {
                      return GenericErrorWidget(
                        actionText: viewInvites,
                        actionKey: emptyChatsNewRoomKey,
                        headerIconSvgUrl: noChatImage,
                        messageTitle: noConversationsAvailable,
                        messageBody: <TextSpan>[
                          TextSpan(
                            text: noConversationsDescription,
                            style: normalSize16Text(
                              AppColors.greyTextColor,
                            ),
                          ),
                        ],
                        recoverCallback: () {},
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: vm.rooms?.length ?? 0,
                      itemBuilder: (BuildContext context, int i) {
                        final Room? currentRoom = vm.rooms?[i];

                        return RoomListItemWidget(currentRoom: currentRoom!);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
