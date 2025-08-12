// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:AngelDelivery/controller/home_controller.dart';
import 'package:AngelDelivery/core/class/handlingdataview.dart';
import 'package:AngelDelivery/core/constant/routes.dart';
import 'package:AngelDelivery/data/model/itemsmodel.dart';
import 'package:AngelDelivery/linkapi.dart';
import 'package:AngelDelivery/view/widget/customappbar.dart';
import 'package:AngelDelivery/view/widget/home/customcardhome.dart';
import 'package:AngelDelivery/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/home/listRestorantsHome.dart';

class HomePage extends GetView<HomeControllerImp> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: Container(
        // height: 600,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/1.png'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: GetBuilder<HomeControllerImp>(
          builder: (controller) => Container(
              //   height: 600,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  CustomAppBar(
                    mycontroller: controller.search!,
                    titleappbar: "Find Product",
                    // onPressedIcon: () {},
                    onPressedSearch: () {
                      controller.onSearchItems();
                    },
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                    onPressedIconFavorite: () {
                      Get.toNamed(AppRoute.myfavroite);
                    },
                  ),
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: !controller.isSearch
                          ? SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomCardHome(
                                      title: "A summer surprise",
                                      body: "Cashback 20%"),
                                  CustomTitleHome(title: "43".tr),
                                  // ListCategoriesHome(),
                                  // CustomTitleHome(title: "Product for you"),

                                  //  ListItemsHome(),
                                  SizedBox(height: 2),
                                  const Restorants(),
                                ],
                              ),
                            )
                          : ListItemsSearch(listdatamodel: controller.listdata))

                  // const CustomTitleHome(title: "Offer"),
                  // const ListItemsHome()
                ],
              )),
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle: Text(listdatamodel[index].categoriesName!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
