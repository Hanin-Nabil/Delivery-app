import 'package:AngelDelivery/controller/favorite_controller.dart';
import 'package:AngelDelivery/controller/items_controller.dart';
import 'package:AngelDelivery/core/class/handlingdataview.dart';
import 'package:AngelDelivery/core/constant/routes.dart';
import 'package:AngelDelivery/view/screen/home.dart';
import 'package:AngelDelivery/view/widget/customappbar.dart';
import 'package:AngelDelivery/view/widget/items/customlistitems.dart';
import 'package:AngelDelivery/view/widget/items/listcategoirseitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/5.png'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          CustomAppBar(
            mycontroller: controller.search!,
            titleappbar: "Find Product",
            iconData: Icons.arrow_forward,
            // onPressedIcon: () {},
            onPressedSearch: () {
              controller.onSearchItems();
            },
            onChanged: (val) {
              controller.checkSearch(val);
            },
            onPressedIconFavorite: () {
              Get.offNamed(AppRoute.serveshome);
            },
          ),
          const SizedBox(height: 20),
          const ListCategoriesItems(),
          // const ListServesHome(),
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? SizedBox(
                          height: 450,
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.itemsData.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 0.5),
                              itemBuilder: (BuildContext context, index) {
                                // controllerFav.isFavorite[controller.data[index]
                                //         ['items_id']] =
                                //     controller.data[index]['favorite'];
                                controllerFav.isFavorite[
                                        controller.itemsData[index].productId] =
                                    controller.itemsData[index].favorite;
                                return CustomListItems(
                                    itemsModel: controller.itemsData[index]);
                              }),
                        )
                      : ListItemsSearch(listdatamodel: controller.listdata)))
        ]),
      ),
    );
  }
}





















// favoriteController.isFavorite[controller.data[index]
                            // ['items_id']] = controller.data[index]['favorite'];
