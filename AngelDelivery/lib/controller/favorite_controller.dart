// ignore_for_file: avoid_print

import 'package:AngelDelivery/core/class/statusrequest.dart';
import 'package:AngelDelivery/core/functions/handingdatacontroller.dart';
import 'package:AngelDelivery/core/services/services.dart';
import 'package:AngelDelivery/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../data/model/myfavorite.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());

  List data = [];
  List<MyFavoriteModel> favorite = [];
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  Map isFavorite = {};

//  key => id items
//  Value => 1 OR 0

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  String? userid;
  @override
  void onInit() {
    userid = myServices.sharedPreferences.getString("userid")!;
    print(userid);
    super.onInit();
  }

  addFavorite(String itemsid) async {
    data.clear();
    print(itemsid);
    print(userid);
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.addFavorite(userid!, itemsid) as Map;

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج من المفضلة "));

        favorite.add(MyFavoriteModel.fromJson(response['data']));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  removeFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    print(itemsid);
    print(userid);
    var response = await favoriteData.removeFavorite(userid!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم حذف المنتج من المفضلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
}
