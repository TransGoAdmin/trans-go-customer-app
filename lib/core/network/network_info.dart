import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkInfo {
  final InternetConnection _checker = InternetConnection();

  Future<bool> isConnected() async {
    return await _checker.hasInternetAccess;
  }
}
