import 'package:get/get.dart';

class AppController extends GetxController{
  static AppController instance = Get.find();
  static var isShowingProgressBar = false.obs;

}