// ignore_for_file: unused_import

import 'package:AngelDelivery/controller/homescreen_controller.dart';
import 'package:AngelDelivery/core/constant/color.dart';
import 'package:AngelDelivery/core/constant/routes.dart';
import 'package:AngelDelivery/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../widget/customappbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                  backgroundColor: AppColor.primaryColor,
                  onPressed: () {
                    Get.toNamed(AppRoute.cart);
                  },
                  child: const Icon(Icons.shopping_basket_outlined)),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: Container(
                  height: 750,
                  // decoration: const BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage('assets/images/1.png'),
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  child: controller.listPage.elementAt(controller.currentpage)),
            ));
  }
}
