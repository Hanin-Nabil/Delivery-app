// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:AngelDelivery/core/constant/routes.dart';
import 'package:AngelDelivery/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    String userid = myServices.sharedPreferences.getString("userid")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
