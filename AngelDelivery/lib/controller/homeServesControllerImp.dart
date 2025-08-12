// ignore_for_file: non_constant_identifier_names

import 'package:AngelDelivery/data/datasource/remote/HomeServesData.dart';
import 'package:AngelDelivery/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import 'package:AngelDelivery/core/constant/routes.dart';
import '../core/functions/handingdatacontroller.dart';
import 'package:AngelDelivery/core/services/services.dart';
import '../data/Model/servesModel.dart';
import '../data/model/CategoriesModel2.dart';

// abstract class HomeServesController extends GetxController {
//   //initialData();
//   // getdata(String? serId);
//   // getdata();
//   getcat(String servId);
//   goToItems(List<CategoriersModel> categories, int selectedCat, String servid);
//   isLang();
//   // getDataCat();
// }

class HomeServesControllerImpelment extends GetxController {
  // ServesDataa homedata = ServesDataa(Get.find());
  MyServices myServices = Get.find();
  //HomeServesData hohmedata = HomeServesData(Get.find());
  HomeData homedata = HomeData(Get.find());

  //late TextEditingControllACer search;
  List<ServesModel> serves = [];
  List<ServesModel> servesD = [];
  String? username;
  String? id;
  String? lang;
  //String? servID;
  bool IsLang = false;
  List<CategoriersModel> cat = [];
  List<CategoriersModel> catData = [];

  int? selectedCat;
  String? servID;
  StatusRequest statusRequest = StatusRequest.none;

  // initialData() {
  //   // myServices.sharedPreferences.clear() ;
  //   // lang = myServices.sharedPreferences.getString("lang");
  //   // username = myServices.sharedPreferences.getString("username");
  //   // id = myServices.sharedPreferences.getString("userid");
  //   // servID = Get.arguments["serID"];
  //   serves = Get.arguments['serves'];
  //   servID = Get.arguments["servid"];
  //   selectedCat = Get.arguments['selectedcat'];
  //  getcat(servID!);
  //   // getDataCat();
  // }

  @override
  void onInit() {
    //search = TextEditingController();
    // lang = myServices.sharedPreferences.getString("lang");
    //initialData();
    serves = Get.arguments['serves'];
    servID = Get.arguments["serid"];
    selectedCat = Get.arguments['selectedcat'];
    //cat = Get.arguments['categories'];
    getcat(servID!);

    super.onInit();
  }

  changeCat(val, catval) {
    selectedCat = val;
    servID = catval;
    getcat(servID!);
    update();
  }

  // getcat(String servId) {
  //   catData.clear();
  //   cat.forEach((element) {
  //     if (element.categoriersServes == servId) {
  //       catData.add(element);
  //     }
  //   });
  //   update();
  // }

  getcat(String servId) async {
    cat.clear();
    catData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['categories']) {
        cat.add(CategoriersModel.fromJson(servpro));
      }
      cat.forEach((element) {
        if (element.categoriersServes == servId) {
          catData.add(element);
        }
      });
    } else {
      statusRequest = StatusRequest.failure;
    }
    // }
    update();
  }

  goToItems(
      List<CategoriersModel> categories, int selectedCat, String categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid,
      "serves": serves
    });
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

  isLang() {
    if (lang == "Ar") {
      IsLang = true;
    } else {
      IsLang = false;
    }
    update();
  }

  // @override
  // getDataCat() async{
  //     statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await homedata.getDataCateo();
  //   print("=============================== Controller $response ");
  //   //categories.addAll(response['categories']);
  //   // for (Map catpro in response['categories']) {
  //   //   cat.add(CategoriersModel.fromJson(catpro));
  //   // }
  //      statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //    // if (response['status'] == "success") {
  //       for (Map catpro in response['categories']) {
  //       cat.add(CategoriersModel.fromJson(catpro));
  //     }

  //     }
  //      else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //    // update();
  //   //}
  //   update();

  // }

  // @override
  // getDataitem() async {
  //   ItemsData homeitem = ItemsData(Get.find());
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await homeitem.getDataItem();
  //   print("=============================== Controller $response ");
  //   for (Map itempro in response['items']) {
  //     items.add(ItemsModel2.fromJson(itempro));
  //     // items.add(ItemsModel(
  //     //     itemsId: itempro['product_id'],
  //     //     itemsCat: itempro['categoriers_id'],
  //     //     categoriesName: itempro['categoriers_name'],
  //     //     itemsName: itempro['product-name'],
  //     //     itemsNameAr: itempro['product_name_ar'],
  //     //     itemsImage: itempro['product_imag']));
  //   }
  //   itemspro.addAll(response['items']);
  //   update();
  //   print((items));
  //   statusRequest = handlingData(response);
  //   update();
  // }
}

// class SearchMixController extends GetxController {
//   searchData() async {}
//   StatusRequest statusRequest = StatusRequest.none;
//   bool isSearch = false;
//   late TextEditingController search;
//   checkSearch(val) {
//     if (val == "") {
//       isSearch = false;
//     }
//     update();
//   }

//   onSearchItems() {
//     isSearch = true;
//     searchData();
//     update();
//   }
// }
