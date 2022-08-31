import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class SkNetworkConnector {
  Future<bool> checkInternetConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile) {
      debugPrint('Connect to Mobile Network');
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      debugPrint('Connect to Wifi');
      return true;
    } else {
      debugPrint('Unable to connect. Please Check internet Conection');

      return false;
    }
  }

  dynamic networkManager(Function func) {
    checkInternetConnected().then((bool? internet) {
      if (internet != null && internet) {
        func(true);
      } else {
        func(false);
      }
    });
  }
}
