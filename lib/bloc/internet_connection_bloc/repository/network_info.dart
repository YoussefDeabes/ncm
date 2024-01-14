import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ncm/bloc/internet_connection_bloc/repository/check_connection_using_url.dart';

/// AbstractNetworkInfo
/// Future<bool> get isConnected;
/// Stream<ConnectivityResult> checkConnectionStream();
abstract class AbstractNetworkInfo {
  const AbstractNetworkInfo();
  Future<bool> get isConnected;
  Stream<ConnectivityResult> checkConnectionStream();
}

class NetworkInfoRepository implements AbstractNetworkInfo {
  /// the package Connectivity _connectivity
  final Connectivity _connectivity;

  /// check the connection using url
  final CheckConnectionUsingUrl _checkConnectionUsingUrl;
  const NetworkInfoRepository({
    required Connectivity connectivity,
    required CheckConnectionUsingUrl checkConnectionUsingUrl,
  })  : _connectivity = connectivity,
        _checkConnectionUsingUrl = checkConnectionUsingUrl;

  @override
  Future<bool> get isConnected async {
    final connectivityResult = await _connectivity.checkConnectivity();

    /// if no Date or wifi is opened the back false with url check
    /// if there is data or wifi the check the url and return the result
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return _checkConnectionUsingUrl.checkConnectionUsingUrl;
  }

  /// return _connectivity.onConnectivityChanged;
  @override
  Stream<ConnectivityResult> checkConnectionStream() {
    return _connectivity.onConnectivityChanged;
  }
}
