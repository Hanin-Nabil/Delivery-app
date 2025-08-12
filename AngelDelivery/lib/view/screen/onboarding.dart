import 'package:AngelDelivery/controller/onboarding_controller.dart';
import 'package:AngelDelivery/core/constant/color.dart';
import 'package:AngelDelivery/view/widget/onboarding/custombutton.dart';
import 'package:AngelDelivery/view/widget/onboarding/customslider.dart';
import 'package:AngelDelivery/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        body: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/images/one.PNG'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: const SafeArea(
            child: Column(children: [
              Expanded(
                flex: 4,
                child: CustomSliderOnBoarding(),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CustomDotControllerOnBoarding(),
                      Spacer(flex: 2),
                      CustomButtonOnBoarding()
                    ],
                  ))
            ]),
          ),
        ));
  }
}
