import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/functions/get_news_data.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:flutter_application_2/screens/home_screen_offline.dart';
import 'package:flutter_application_2/utils/custom_msg.dart';

class InternetConnection extends StatefulWidget {
  const InternetConnection({super.key});

  @override
  State<InternetConnection> createState() => _InternetConnectionState();
}

class _InternetConnectionState extends State<InternetConnection> {
  bool _isConnected = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsData();

    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        // Update the flag if the device's connectivity has changed
        setState(() {
          _isConnected = result != ConnectivityResult.none;
        });
        // Fetch the news data if the device is now connected
        if (_isConnected) {
          CustomMsg(msg: "Back Online", color: Colors.green);
          getNewsData();
        } else {
          CustomMsg(msg: "No internet Connection", color: Colors.red);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isConnected ? HomeScreenOnline() : HomeScreenOffline();
  }
}







// class InternetConnections {
//   late StreamSubscription subscription;
//   bool isDeviceConnected = false;
//   getConnectivity() =>
//       subscription = Connectivity().onConnectivityChanged.listen(
//         (ConnectivityResult result) async {
//           checkConnection();
//         },
//       );

//   Future checkConnection() async {
//     var has_internet_connection =
//         await InternetConnectionChecker().hasConnection;
//     if (has_internet_connection) {
      
      // CustomMsg(msg: "Back Online", color: Colors.green);
//     } else {
//       CustomMsg(msg: "No Internet Connection", color: Colors.red);
//     }
//   }
// }
