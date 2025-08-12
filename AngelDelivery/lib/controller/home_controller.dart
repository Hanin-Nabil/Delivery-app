// ignore_for_file: unused_import

import 'package:AngelDelivery/core/class/statusrequest.dart';
import 'package:AngelDelivery/core/constant/routes.dart';
import 'package:AngelDelivery/core/functions/handingdatacontroller.dart';
import 'package:AngelDelivery/core/services/services.dart';
import 'package:AngelDelivery/data/datasource/remote/home_data.dart';
import 'package:AngelDelivery/data/model/itemsmodel.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/Model/servesModel.dart';
import '../data/datasource/remote/serves_data.dart';
import '../data/model/CategoriesModel2.dart';
import '../data/model/ItemsModel2.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  //getdata();
  // getcat(String servId);
  // getItem();
  getdataserves();
  goTocat(List<ServesModel> categories, int selectedCat, String categoryid);
  goToItems(
      List<CategoriersModel> categories, int selectedCat, String categoryid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  //late TextEditingController search;
  late String username;
  late String userid;
  late String lang;
  List<CategoriersModel> cat = [];
  List<CategoriersModel> catData = [];
  List<ServesModel> serves = [];
  HomeData homedata = HomeData(Get.find());

  // List data = [];
  List categories = [];
  List items = [];
  List<ItemsModel2> itemss = [];
  List<ServesModel> serve = [];
  int? selectedCat;
  String? servID;

  @override
  initialData() {
    // myServices.sharedPreferences.clear() ;
    lang = myServices.sharedPreferences.getString("lang")!;
    username = myServices.sharedPreferences.getString("username")!;
    userid = myServices.sharedPreferences.getString("userid")!;
  }

  @override
  getdataserves() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getDataserves();
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['serves']) {
        serves.add(ServesModel.fromJson(servpro));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    //update();
    //}
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    initialData();

    getdataserves();

    super.onInit();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }


  @override
  goTocat(servess, selectedCat, serid) {
    Get.toNamed(AppRoute.serveshome, arguments: {
      "serves": servess,
      "selectedcat": selectedCat,
      "serid": serid,
      // "categories": catData,
    });
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }

//   @override
//   getItem() async {
//     statusRequest = StatusRequest.loading;
//     var response = await homedata.getDataSer();
//     print("=============================== Controller $response ");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       for (Map servpro in response['items']) {
//         itemss.add(ItemsModel2.fromJson(servpro));
//       }
//       // cat.forEach((element) {
//       //   if (element.categoriersServes == servId) {
//       //     catData.add(element);
//       //   }
//       // });
//     } else {
//       statusRequest = StatusRequest.failure;
//     }
//     // }
//     update();
//   }
// }
}

class SearchMixController extends GetxController {
  List<ItemsModel> listdata = [];

  StatusRequest statusRequest = StatusRequest.none;
  HomeData homedata = HomeData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}
