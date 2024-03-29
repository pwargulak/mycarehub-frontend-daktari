import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/search_users/update_search_user_response_state_action.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/src/domain/core/entities/identifier.dart';

class SearchUserItem extends StatefulWidget {
  const SearchUserItem({
    required this.searchUserResponse,
    this.isCCCNumber = false,
  });

  final SearchUserResponse searchUserResponse;
  final bool isCCCNumber;

  @override
  State<SearchUserItem> createState() => _SearchUserItemState();
}

class _SearchUserItemState extends State<SearchUserItem> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String name = widget.searchUserResponse.user?.name ?? UNKNOWN;
    return InkWell(
      onTap: () {
        StoreProvider.dispatch(
          context,
          UpdateSearchUserResponseStateAction(
            selectedSearchUserResponse: widget.searchUserResponse,
          ),
        );
        Navigator.of(context).pushNamed(
          AppRoutes.searchDetailViewPage,
          arguments: <String, dynamic>{
            'searchUserResponse': widget.searchUserResponse,
            'isClient': widget.isCCCNumber,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 38,
                  width: 38,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.galleryColor,
                  ),
                  child: Center(
                    child: Text(
                      name.trim()[0].toUpperCase(),
                      style: boldSize14Text(AppColors.primaryColor),
                    ),
                  ),
                ),
                smallHorizontalSizedBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: boldSize12Text(),
                    ),
                    Text(
                      widget.isCCCNumber
                          ? 'CCC#: ${widget.searchUserResponse.identifiers?.firstWhere(
                                (Identifier element) =>
                                    element.type == IdentifierType.CCC, orElse: () => Identifier.initial(),
                              ).value}'
                          : widget.searchUserResponse.staffNumber ?? '',
                      style: normalSize12Text(AppColors.greyTextColor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
