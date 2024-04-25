import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

mixin NetworkStatusMixin {
  final _internetConnectionChecker = InternetConnectionChecker();

  Future<void> onNetworkStatus({
    required VoidCallback whenOnline,
    required VoidCallback whenDisconnected,
  }) async {
    await _internetConnectionChecker.hasConnection
        ? whenOnline()
        : whenDisconnected();
  }
}
