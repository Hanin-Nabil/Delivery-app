import 'package:AngelDelivery/core/class/statusrequest.dart';
import 'package:AngelDelivery/core/constant/routes.dart';
import 'package:AngelDelivery/core/functions/handingdatacontroller.dart';
import 'package:AngelDelivery/core/services/services.dart';
import 'package:AngelDelivery/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/model/userModel.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;
  late Users user;
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      print("=============================== Controller $response ");
      //user = Users.fromJson(response['data']);
      // String userid = response['data']['user_id'];
      // myServices.sharedPreferences.setString("id", "63");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          user = Users.fromJson(response['data']);
          // data.addAll(response['data']);
          if (user.userApprove == "1") {
            print(user.userApprove);
            myServices.sharedPreferences.setString("userid", user.userId!);
            myServices.sharedPreferences.setString("username", user.userName!);
            myServices.sharedPreferences.setString("email", user.userEmail!);
            myServices.sharedPreferences.setString("phone", user.userPhone!);
            Get.offNamed(AppRoute.homescreen);
            myServices.sharedPreferences.setString("step", "2");
            // update();
            String userid = user.userId!;
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users${userid}");

            // update();
          } else {
            Get.toNamed(AppRoute.verfiyCodeSignUp,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    //   String? token = value;
    // });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
