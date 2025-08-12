// ignore_for_file: unused_import, camel_case_types

import 'package:AngelDelivery/controller/homeServesControllerImp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:AngelDelivery/controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatefatabase.dart';
import '../../../data/Model/servesModel.dart';
import '../../../data/model/CategoriesModel2.dart';
import '../../../linkapi.dart';

class ListcateogoriesSerHome extends GetView<HomeServesControllerImpelment> {
  const ListcateogoriesSerHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Get.put(HomeServesControllerImpelment());
    return Container(
      // height: 300,
      decoration: BoxDecoration(
          // color: AppColor.secondColor, borderRadius: BorderRadius.circular(20)
          ),

      child: GetBuilder<HomeServesControllerImpelment>(
        builder: (controller) => GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.catData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => listCatoRestorantsHome(
            i: index,
            categoriesModel: controller.catData[index],
          ),
        ),
      ),
    );
  }
}

class listCatoRestorantsHome extends GetView<HomeServesControllerImpelment> {
  final CategoriersModel categoriesModel;
  final int i;
  const listCatoRestorantsHome(
      {super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.catData, i, categoriesModel.categoriersId!);
      },
      child: Card(
        //color: Colors.amber,
        shape: Border.all(width: 1, color: AppColor.primaryColor),

        margin: const EdgeInsets.symmetric(
            horizontal: 5, vertical: 5), ////////////////////////
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  "${AppLink.imagestCategories}/${categoriesModel.categoriersImage}",
                ),
                radius: 60, //////////////////////////////////
              ),
              // Image.asset(
              //   "${AppLink.imagestCategories}/${categoriesModel.categoriersImage}",
              //   width: 200,
              //   height: 150,
              // ),
              const SizedBox(
                height: 10,
              ),
              // Text(categoriesModel.servesName!),
              Center(
                child: Text(
                  "${translateDatabase(categoriesModel.categoriersNameAr, categoriesModel.categoriersName)}",
                  style: const TextStyle(
                      fontSize: 13, color: AppColor.primaryColor),
                ),
              )
            ]),
      ),
    );
  }
}
