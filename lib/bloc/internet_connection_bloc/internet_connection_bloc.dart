import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart'
    show ConnectivityResult;
import 'package:equatable/equatable.dart';
import 'package:ncm/bloc/internet_connection_bloc/repository/network_info.dart';

part 'internet_connection_event.dart';
part 'internet_connection_state.dart';

class InternetConnectionBloc
    extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  final AbstractNetworkInfo _connectionCheck;
  InternetConnectionBloc({required AbstractNetworkInfo connectionCheck})
      : _connectionCheck = connectionCheck,
        super(const InternetConnectionState(
            isConnected: false, isInitApp: false)) {
    // _checkConnectionStream();
    on<CheckConnection>(_onCheckConnection);
    on<SetConnectionToFalse>(_onSetConnectionToFalse);
  }

  /// this event only called in the situation of _checkConnectionStream is false
  void _onSetConnectionToFalse(event, emit) {
    emit(const InternetConnectionState(isConnected: false, isInitApp: true));
  }

  FutureOr<void> _onCheckConnection(event, emit) async {
    try {
      final bool isConnected = await _connectionCheck.isConnected;
      emit(InternetConnectionState(isConnected: isConnected, isInitApp: true));
    } catch (e) {
      emit(const InternetConnectionState(isConnected: false, isInitApp: true));
    }
  }

  /// listen to the stream and each time the user close data or wifi
  /// the it will force to set connection to false
  void _checkConnectionStream() {
    _connectionCheck
        .checkConnectionStream()
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        add(const SetConnectionToFalse());
      } else {
        add(const CheckConnection());
      }
    });
  }
}
