// ignore_for_file: unused_import

import 'package:AngelDelivery/controller/home_controller.dart';
import 'package:AngelDelivery/core/constant/color.dart';
import 'package:AngelDelivery/core/functions/translatefatabase.dart';
import 'package:AngelDelivery/data/model/categoriesmodel.dart';
import 'package:AngelDelivery/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/model/CategoriesModel2.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.cat.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel: controller.cat[index],
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriersModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.cat, i!, categoriesModel.categoriersId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.thirdColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 100,
            width: 100,
            child: Image.asset(
              "${AppLink.imagestCategories}/${categoriesModel.categoriersImage}",
              width: 80, height: 80,
              //color: AppColor.secondColor
            ),
          ),
          Text(
            "${translateDatabase(categoriesModel.categoriersNameAr, categoriesModel.categoriersName)}",
            style: const TextStyle(fontSize: 13, color: AppColor.black),
          )
        ],
      ),
    );
  }
}
