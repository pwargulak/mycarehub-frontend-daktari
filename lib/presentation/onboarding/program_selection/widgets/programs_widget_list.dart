import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/programs/set_user_program_action.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/organization_selection/widgets/general_workstation_widget.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class ProgramsListWidget extends StatelessWidget {
  final List<Program> programs;
  final IGraphQlClient graphQlClient;

  const ProgramsListWidget({
    super.key,
    required this.programs,
    required this.graphQlClient,
  });
  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = <Widget>[];
    if (programs.isNotEmpty) {
      for (final Program program in programs) {
        widgetList.add(
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: GeneralWorkstationWidget(
              title: program.name ?? '',
              bodyWidget: Wrap(
                runSpacing: 12,
                spacing: 8,
              ),
              buttonText: proceedText,
              onButtonCallback: () => StoreProvider.dispatch(
                context,
                SetUserProgramAction(
                  client: getCustomClient(
                    context: context,
                    graphQlClient: graphQlClient,
                  ),
                  program: program,
                  onFailure: (String message) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text(
                            message,
                          ),
                          duration: const Duration(
                            seconds: 5,
                          ),
                          action: dismissSnackBar(
                            closeString,
                            Colors.white,
                            context,
                          ),
                        ),
                      );
                  },
                ),
              ),
            ),
          ),
        );
      }
    }
    return Column(
      children: <Widget>[
        ...widgetList,
      ],
    );
  }
}
