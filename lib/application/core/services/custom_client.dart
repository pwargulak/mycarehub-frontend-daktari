// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_credentials_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/auth_credentials.dart';
import 'package:http/http.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class CustomClient extends IGraphQlClient {
  CustomClient(
    String idToken,
    String endpoint, {
    required this.context,
    required this.refreshTokenEndpoint,
    required this.userID,
    Client? client,
  }) : _client = client ?? Client() {
    super.idToken = idToken;
    super.endpoint = endpoint;
  }

  final String refreshTokenEndpoint;
  final String userID;
  final BuildContext context;
  final Client _client;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    request.headers.addAll(this.requestHeaders);

    final bool isSignedIn =
        StoreProvider.state<AppState>(context)?.credentials?.isSignedIn ??
            false;

    final String? expiryDateString = StoreProvider.state<AppState>(context)
        ?.credentials
        ?.tokenExpiryTimestamp;

    final DateTime expiryDateTime = DateTime.tryParse(
          expiryDateString ?? DateTime.now().toIso8601String(),
        ) ??
        DateTime.now();

    final bool shouldRefreshToken = isSignedIn &&
        (hasTokenExpired(expiryDateTime, DateTime.now()) || idToken == UNKNOWN);

    if (request.url ==
        Uri.parse(
          AppWrapperBase.of(context)?.customContext?.loginByPhoneEndpoint ?? '',
        )) {
      return request.send();
    } else if (shouldRefreshToken) {
      AuthCredentials? authCredentials = await refreshToken();

      if (authCredentials?.idToken != null &&
          authCredentials?.expiresIn != null &&
          authCredentials?.refreshToken != null) {
        request.headers.addAll(<String, String>{
          'Authorization': 'Bearer ${authCredentials?.idToken}'
        });

        final DateTime expiryTimestamp =
            getTokenExpiryTimestamp(authCredentials?.expiresIn);

        authCredentials = authCredentials?.copyWith(
          tokenExpiryTimestamp: expiryTimestamp.toIso8601String(),
        );

        StoreProvider.dispatch(
          context,
          UpdateCredentialsAction(
            idToken: authCredentials?.idToken,
            refreshToken: authCredentials?.refreshToken,
            expiresIn: authCredentials?.expiresIn,
            tokenExpiryTimestamp: authCredentials?.tokenExpiryTimestamp,
          ),
        );
      }

      return request.send();
    } else {
      return request.send();
    }
  }

  Future<AuthCredentials?> refreshToken() async {
    String currentUserId = userID;
    if(currentUserId == UNKNOWN){
     currentUserId =  StoreProvider.state<AppState>(context)?.userProfileState?.userProfile?.user?.userId ?? '';
    }
    final Response refreshTokenResponse = await _client.post(
      Uri.parse(refreshTokenEndpoint),
      headers: <String, String>{'content-type': 'application/json'},
      body: jsonEncode(<String, String>{'userID': currentUserId}),
    );

    AuthCredentials? credentials =
        StoreProvider.state<AppState>(context)?.credentials;

    if (refreshTokenResponse.statusCode == 200) {
      final Map<String, dynamic> body =
          jsonDecode(refreshTokenResponse.body) as Map<String, dynamic>;

      final AuthCredentials tempAuthCredentials =
          AuthCredentials.fromJson(body);

      credentials = credentials?.copyWith(
        refreshToken: tempAuthCredentials.refreshToken,
        idToken: tempAuthCredentials.idToken,
        expiresIn: tempAuthCredentials.expiresIn,
      );
    }

    return credentials;
  }
}
