import 'package:internet_connection_checker/internet_connection_checker.dart';

mixin ConnectionCheckerMixin {
  final _internetConnectionChecker = InternetConnectionChecker();

  Future<bool> isConnectedToNetwork() async =>
      await _internetConnectionChecker.hasConnection;
}
