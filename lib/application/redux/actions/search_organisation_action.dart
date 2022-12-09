import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/organisation.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class SearchOrganisationAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String searchParam;

  SearchOrganisationAction({
    required this.client,
    required this.searchParam,
  });

  @override
  void before() {
    super.before();
    dispatch(UpdateOnboardingStateAction(organisations: <Organisation>[]));
    dispatch(WaitAction<AppState>.add(fetchOrganisationsFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchOrganisationsFlag));
    super.after();
  }

  @override
  AppState? reduce() {
  
    dispatch(
      UpdateOnboardingStateAction(
        organisations: <Organisation>[
          Organisation(name: 'Organization 1', id: 'org1'),
          Organisation(name: 'Organization 2', id: 'org2'),
          Organisation(name: 'Organization 3', id: 'org3'),
        ],
      ),
    );

    return state;
  }
}
