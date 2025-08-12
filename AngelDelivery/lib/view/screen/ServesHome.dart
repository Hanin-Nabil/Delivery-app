// ignore_for_file: unused_import

import 'package:AngelDelivery/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homeServesControllerImp.dart';
import '../widget/customappbar.dart';
import '../widget/home/customtitlehome.dart';
import '../widget/home/listRestorantsHome.dart';
import '../widget/home/listServesHome.dart';
import '../widget/home/listcateogoriesSerHome.dart';

class HomeServesControllerImpWidget
    extends GetView<HomeServesControllerImpelment> {
  const HomeServesControllerImpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeServesControllerImpelment());
    return GetBuilder<HomeServesControllerImpelment>(
      builder: (controller) => Scaffold(
        body: Container(
          width: double.infinity,
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/images/1.png'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          //  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            children: [
              CustomAppBar(
                mycontroller: null,
                titleappbar: "Find Product",
                // onPressedIcon: () {},
                onPressedSearch: () {
                  //  controller.onSearchItems();
                },
                onChanged: (val) {
                  // controller.checkSearch(val);
                },
                onPressedIconFavorite: () {
                  Get.toNamed(AppRoute.myfavroite);
                },
              ),
              CustomTitleHome(
                title: "43".tr,
              ),
              const ListServesHome(),
              // // ListCategoriesHome(),
              CustomTitleHome(
                title: "48".tr,
              ),
              const ListcateogoriesSerHome(),
            ],
          ),
        ),
      ),
    );
  }
}
