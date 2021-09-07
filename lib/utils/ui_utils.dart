import 'package:get/get.dart';

class UIUtils{
  static void showMySnackbar(String title, String message){
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.primaryColorLight, colorText: Get.theme.accentColor);
  }
}