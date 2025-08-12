import 'package:AngelDelivery/controller/auth/login_controller.dart';
import 'package:AngelDelivery/core/class/handlingdataview.dart';
import 'package:AngelDelivery/core/constant/color.dart';
import 'package:AngelDelivery/core/functions/alertexitapp.dart';
import 'package:AngelDelivery/core/functions/validinput.dart';
import 'package:AngelDelivery/facebook.dart';
import 'package:AngelDelivery/google_sign.dart';
import 'package:AngelDelivery/view/widget/auth/custombuttonauth.dart';
import 'package:AngelDelivery/view/widget/auth/customtextbodyauth.dart';
import 'package:AngelDelivery/view/widget/auth/customtextformauth.dart';
import 'package:AngelDelivery/view/widget/auth/customtexttitleauth.dart';
import 'package:AngelDelivery/view/widget/auth/logoauth.dart';
import 'package:AngelDelivery/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        // title: Text('Sign In',
        //     style: Theme.of(context)
        //         .textTheme
        //         .headlineLarge!
        //         .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataView2(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      const LogoAuth(),
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(text: "10".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: "11".tr),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        mycontroller: controller.email,
                        hinttext: "12".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "18".tr,
                      ),
                      GetBuilder<LoginControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          obscureText: controller.isshowpassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 3, 30, "password");
                          },
                          mycontroller: controller.password,
                          hinttext: "13".tr,
                          iconData: Icons.lock_outline,
                          labeltext: "19".tr,
                          // mycontroller: ,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: Text(
                          "14".tr,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      CustomButtomAuth(
                          text: "15".tr,
                          onPressed: () {
                            controller.login();
                          }),
                      const SizedBox(height: 40),
                      CustomTextSignUpOrSignIn(
                        textone: "16".tr,
                        texttwo: "17".tr,
                        onTap: () {
                          controller.goToSignUp();
                        },
                      ),
                      const SizedBox(height: 30),
                      Center(child: const Text("OR")),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FacebookLoginScreen(),
                          GoogleAuth(),
                        ],
                      ),
                    ]),
                  ),
                )),
          )),
    );
  }
}
