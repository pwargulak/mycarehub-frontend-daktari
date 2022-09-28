import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/search/search_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';

class SearchClientItem extends StatelessWidget {
  const SearchClientItem({
    required this.searchUserResponse,
    required this.onTap,
  });

  final SearchUserResponse searchUserResponse;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final String name = searchUserResponse.user?.name ?? UNKNOWN;
    return StoreConnector<AppState, SearchViewModel>(
      converter: (Store<AppState> store) => SearchViewModel.fromStore(store),
      builder: (BuildContext context, SearchViewModel vm) {
        return InkWell(
          onTap: onTap,
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
                          'CCC#: ${searchUserResponse.clientCCCNumber}',
                          style: normalSize12Text(AppColors.greyTextColor),
                        ),
                      ],
                    ),
                  ],
                ),
                if (vm.selectedUsers?.contains(searchUserResponse) ?? false)
                  SvgPicture.asset(doneIconSvgPath)
              ],
            ),
          ),
        );
      },
    );
  }
}
