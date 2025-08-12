import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/servesController.dart';
import '../../core/class/handlingdataview.dart';
import '../../linkapi.dart';
import '../widget/home/customtitlehome.dart';

class RestorantPage extends StatelessWidget {
  const RestorantPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.putAsync(()=>ServesController());
    return GetBuilder<ServesController>(
        init: ServesController(),
        builder: (controller) => HandlingDataView2(
              statusRequest: controller.statusRequest,
              widget: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ListView(children: [
                  CustomTitleHome(
                    title: "43".tr,
                  ),
                  // ListCategoriesHome(),
                  //margin:const EdgeInsets.all(20),

                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.5),
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              //  controller.goToItems(controller.serves, i, categoriesModel.servesId!);
                            },
                            child: Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "${AppLink.imagestCategories}/${"9346r.jpg"}",
                                      // width: 200,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("mmm,,a,"),
                                  ]),
                            ),
                          )),

                  // Restorants(),
                  // CustomTitleHome(
                  //   title: "47".tr,
                  // ),
                  // const ListServesHome(),
                  //const ListItemsHome(),
                ]),
              ),
            ));
  }
}
