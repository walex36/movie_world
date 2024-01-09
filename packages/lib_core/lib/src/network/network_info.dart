import 'dart:async';

abstract class INetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfo implements INetworkInfo {
  @override
  Future<bool> get isConnected async => true;
}
