import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../core/Services/services.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/Model/servesModel.dart';
import '../../data/datasource/remote/servicecategorydata.dart';
import '../../data/model/Servescatmodel.dart';

class ServesController extends GetxController {
  final ServesDataCategory homedata = Get.find();
  final MyServices myServices = Get.find();
  late TextEditingController search;
  final List<ServesModel> serves = <ServesModel>[];
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    search = TextEditingController();
    // lang = myServices.sharedPreferences.getString("lang");

    getdata();
    super.onInit();
  }

  Future<void> getdata() async {
    statusRequest = StatusRequest.loading;
    update();

    final dynamic response = await homedata.getData();
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      for (final Map<String, dynamic> servpro in response['servicecategory']) {
        serves.add(Servicecategorymodel.fromJson(servpro) as ServesModel);
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  void goToItems(dynamic categories, dynamic selectedCat, dynamic servid) {
    Get.offNamed(AppRoute.homepage, arguments: <String, dynamic>{
      'serves': categories,
      'selectedcat': selectedCat,
      'servid': servid,
    });
  }
}
