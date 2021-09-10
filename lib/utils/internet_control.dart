import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class InternetControl{

  static RxBool internetState = RxBool(false);
  Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }else{
      return false;
    }
  }

  static Future<void> internetListener() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.mobile) {
        internetState.value = true;
        print("internetState : mobile");
      } else if (result == ConnectivityResult.wifi) {
        internetState.value = true;
        print("internetState : wifi");
      }else{
        internetState.value = false;
        print("internetState :  none!");
      }
    });
  }
}