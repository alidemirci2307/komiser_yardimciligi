import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UIUtils {
/*  static void showMySnackbar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.primaryColorLight,
        colorText: Get.theme.accentColor);
  }*/

  static void showExitDefaultDialog(String title, String middleText) {
    Get.defaultDialog(
      title: title,
      middleText: middleText,
      barrierDismissible: false,
      onWillPop: () async => false,
      textCancel: "Kapat",
      onCancel: () {
        Get.back();
      },
    );
  }

  static void showSuccessDialog(String data) {
    Get.defaultDialog(
      title: "Başarılı İşlem",
      middleText: "($data) - İşlem başarıyla gerçekleştirilmiştir.",
      barrierDismissible: false,
      onWillPop: () async => false,
      textCancel: "Kapat",
      onCancel: () {
        Get.back();
      },
    );
  }

  static void showFailureDialog(String data) {
    Get.defaultDialog(
      title: "Başarısız İşlem",
      middleText: "($data) - Teknik bir sebepten dolayı işlem gerçekleştirilemedi.",
      barrierDismissible: false,
      onWillPop: () async => false,
      textCancel: "Kapat",
      onCancel: () {
        Get.back();
      },
    );
  }
}
