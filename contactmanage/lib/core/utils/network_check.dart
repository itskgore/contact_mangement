import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkUtils {
  Future<bool> isConnectedToInternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      return true;
    } else {
      throw const SocketException("No internet connection available");
    }
  }
}
