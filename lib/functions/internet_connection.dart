import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/custom_msg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnection {
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          checkConnection();
        },
      );

  Future checkConnection() async {
    var has_internet_connection =
        await InternetConnectionChecker().hasConnection;
    if (has_internet_connection) {
      
      CustomMsg(msg: "Back Online", color: Colors.green);
    } else {
      CustomMsg(msg: "No Internet Connection", color: Colors.red);
    }
  }
}
