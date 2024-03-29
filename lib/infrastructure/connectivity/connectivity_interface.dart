import 'package:prohealth360_daktari/infrastructure/connectivity/connectivity_status_stub.dart'
    if (dart.library.io) 'mobile_connectivity_status.dart';

abstract class ConnectivityChecker {
  ConnectivityChecker();

  factory ConnectivityChecker.initial() => getConnectivityStatus();

  Stream<bool> get onConnectivityChanged;

  Future<bool> checkConnection();
}
