import 'dart:async';

import 'package:lib_dependencies/lib_dependencies.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;
  Stream<bool> get streamIsConnected;
  Future<ConnectivityResult> checkConnectivity();
  Future<void> init();
}

class NetworkInfo implements INetworkInfo {
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult result = ConnectivityResult.none;
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;
  final StreamController<bool> _streamController = StreamController.broadcast();

  @override
  Future<void> init() async {
    try {
      result = await _connectivity.checkConnectivity();
      // ignore: empty_catches
    } catch (e) {}

    _updateConnectionStatus(result);
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    this.result = result;
    _streamController.add(!(result == ConnectivityResult.none));
  }

  @override
  Future<ConnectivityResult> checkConnectivity() async {
    result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
    return result;
  }

  @override
  Future<bool> get isConnected async => result != ConnectivityResult.none;

  @override
  Stream<bool> get streamIsConnected => _streamController.stream;

  void dispose() {
    _connectivitySubscription?.cancel();
    _streamController.close();
  }
}
