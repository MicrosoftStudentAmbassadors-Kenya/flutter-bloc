import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocapp/constants/data_connection_enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscrition;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return connectivityStreamSubscrition =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.mobile) {
        // I am connected to the mobile network.
        emitInternetConnected(ConnectionType.mobile);
      } else if (connectivityResult == ConnectivityResult.wifi) {
        // I am connected to a wifi network.
        emitInternetConnected(ConnectionType.wifi);
      } else if (connectivityResult == ConnectivityResult.none) {
        // I am not connected to the internet.
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) {
    emit(InternetConnected(connectionType: _connectionType));
  }

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() async {
    connectivityStreamSubscrition.cancel();
    super.close();
  }
}
