// ignore_for_file: camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:AngelDelivery/controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatefatabase.dart';
import '../../../data/Model/servesModel.dart';
import '../../../linkapi.dart';

class Restorants extends GetView<HomeControllerImp> {
  const Restorants({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Get.put(HomeControllerImp());
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.serves.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) => listRestorantsHome(
        i: index,
        categoriesModel: controller.serves[index],
      ),
    );
  }
}

class listRestorantsHome extends GetView<HomeControllerImp> {
  final ServesModel categoriesModel;
  final int i;
  const listRestorantsHome(
      {super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     color: AppColor.thirdColor, borderRadius: BorderRadius.circular(30)),
      height: 100,
      child: InkWell(
        onTap: () {
          controller.goTocat(controller.serves, i, categoriesModel.servesId!);
        },
        child: Card(
          elevation: 20,
          shape: Border.all(width: 1, color: AppColor.primaryColor),
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    "${AppLink.imagestCategories}/${categoriesModel.servesImage}",
                  ),
                  radius: 60, //////////////////////////////////
                ),

                // Image.asset(
                //   "${AppLink.imagestCategories}/${categoriesModel.servesImage}",
                //   width: 200,
                //   height: 150,
                // ),
                const SizedBox(
                  height: 5,
                ),
                // Text(categoriesModel.servesName!),
                Text(
                  "${translateDatabase(categoriesModel.servesNameAr, categoriesModel.servesName)}",
                  style: const TextStyle(
                      fontSize: 13, color: AppColor.fourthColor),
                )
              ]),
        ),
      ),
    );
  }
}
