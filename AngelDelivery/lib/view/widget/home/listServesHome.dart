// ignore_for_file: unused_import, sized_box_for_whitespace

import 'package:AngelDelivery/controller/homeServesControllerImp.dart';
import 'package:AngelDelivery/controller/home_controller.dart';
import 'package:AngelDelivery/core/constant/color.dart';
import 'package:AngelDelivery/core/functions/translatefatabase.dart';
import 'package:AngelDelivery/data/model/categoriesmodel.dart';
import 'package:AngelDelivery/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/Model/servesModel.dart';
import '../../../data/model/CategoriesModel2.dart';

class ListServesHome extends GetView<HomeServesControllerImpelment> {
  const ListServesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get.put(HomeServesControllerImp());
    return GetBuilder<HomeServesControllerImpelment>(
      builder: (controller) => SizedBox(
        height: 140,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.serves.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoriesServes(
              i: index,
              categoriesModel: controller.serves[index],
            );
          },
        ),
      ),
    );
  }
}

class CategoriesServes extends GetView<HomeServesControllerImpelment> {
  final ServesModel categoriesModel;
  final int? i;
  const CategoriesServes(
      {Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i!, categoriesModel.servesId!);
        //controller.goToItems(controller.catData, i!, categoriesModel.servesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.secondColor,
                borderRadius: BorderRadius.circular(100)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 100,
            width: 100,
            child: CircleAvatar(
              backgroundImage: AssetImage(
                "${AppLink.imagestCategories}/${categoriesModel.servesImage}",
              ),
              radius: 99,
            ),

            // Image.asset(
            //   "${AppLink.imagestCategories}/${categoriesModel.servesImage}",
            //   width: 80, height: 80,
            //   //color: AppColor.secondColor
            // ),
          ),
          const SizedBox(height: 3),
          Container(
            width: 100,
            child: Center(
              child: Text(
                "${translateDatabase(categoriesModel.servesNameAr, categoriesModel.servesName)}",
                style: const TextStyle(
                    fontSize: 13,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
