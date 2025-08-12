import 'package:AngelDelivery/controller/home_controller.dart';
import 'package:AngelDelivery/core/class/statusrequest.dart';
import 'package:AngelDelivery/core/constant/routes.dart';
import 'package:AngelDelivery/core/functions/handingdatacontroller.dart';
import 'package:AngelDelivery/core/services/services.dart';
import 'package:AngelDelivery/data/datasource/remote/items_data.dart';
import 'package:AngelDelivery/data/model/ItemsModel2.dart';
import 'package:AngelDelivery/data/model/itemsmodel.dart';
import '../data/Model/servesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/CategoriesModel2.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, String catval);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel2 itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  List<CategoriersModel> categories = [];
  String? catid;
  int? selectedCat;
  List<ServesModel> serves = [];
  ItemsData testData = ItemsData(Get.find());

  List data = [];
  List<ItemsModel2> itemsData = [];
  List<ItemsModel2> items = [];
  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  String? userid;
  @override
  intialData() {
    serves=Get.arguments['serves'];
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];

    // "serves": servess,
    //   "selectedcat": selectedCat,
    //   "serid": serid,
    //   "categories": catData,
    userid = myServices.sharedPreferences.getString("userid");
   getItems(catid!);
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  @override
  getItems(categoryid) async {
    data.clear();
    items.clear();
    itemsData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await testData.getData(userid!, categoryid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        for (Map servpro in response['items']) {
          items.add(ItemsModel2.fromJson(servpro));
        }
        items.forEach((element) {
          if (element.productCat == categoryid) {
            itemsData.add(element);
          }
        });
        update();
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    // End
    //}
    update();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }
}


























// class FavoriteController extends GetxController {
//   Map isFavorite = {};

//   setFavorite(id, val) {
//     isFavorite[id] = val;
//     print(isFavorite[id]);
//     update();
//   }
// }
