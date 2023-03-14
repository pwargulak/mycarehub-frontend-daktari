import 'package:async_redux/async_redux.dart';

class AppEntryPointViewModel extends Vm {
  AppEntryPointViewModel({
    required this.idToken,
    required this.userId,
    required this.communitiesAccessToken,
  }) : super(equals: <Object?>[idToken, userId, communitiesAccessToken]);

  final String? idToken;
  final String? userId;
  final String? communitiesAccessToken;
}
