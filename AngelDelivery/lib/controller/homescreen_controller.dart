// ignore_for_file: unused_import

import 'package:AngelDelivery/view/screen/home.dart';
import 'package:AngelDelivery/view/screen/notification.dart';
import 'package:AngelDelivery/view/screen/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/Services/services.dart';
import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handingdatacontroller.dart';
import '../data/Model/servesModel.dart';
import '../data/datasource/remote/serves_data.dart';
import '../view/screen/RestorantPage.dart';
import '../view/screen/orders/nearStore.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  // List<ServesModel> serves = [];
  // ServesDataa homedata = ServesDataa(Get.find());
  // MyServices myServices = Get.find();
  // StatusRequest statusRequest = StatusRequest.none;
  // int? selectedCat;
  // String? servID;
  List<Widget> listPage = [
    const HomePage(),
    //NotificationView(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("P"))],
    ),
    NearbyStores(),
    const Settings(),
  ];

  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "Notif", "icon": Icons.notifications_active_outlined},
    {"title": "Near", "icon": Icons.store},
    {"title": "profile", "icon": Icons.person_pin_sharp},
  ];
  @override
  void onInit() {
    // serve = Get.arguments['serves'];
    // servID = Get.arguments["servid"];
    // selectedCat = Get.arguments['selectedcat'];
    //getdata();
    super.onInit();
  }

  // getdata() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await homedata.getData();
  //   print("=============================== Controller $response ");

  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     for (Map servpro in response['serves']) {
  //       serves.add(ServesModel.fromJson(servpro));
  //     }
  //   } else {
  //     statusRequest = StatusRequest.failure;
  //   }
  //   //update();
  //   //}
  //   update();
  // }

  // goToItems(categories, selectedCat, servid) {
  //   Get.offNamed(AppRoute.homepage, arguments: {
  //     "serves": categories,
  //     "selectedcat": selectedCat,
  //     "servid": servid,
  //   });
  // }

  @override
  changePage(int index) {
    currentpage = index;
    update();
  }
}
