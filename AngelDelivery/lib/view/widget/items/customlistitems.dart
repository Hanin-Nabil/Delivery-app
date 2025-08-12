import 'package:cached_network_image/cached_network_image.dart';
import 'package:AngelDelivery/controller/favorite_controller.dart';
import 'package:AngelDelivery/controller/items_controller.dart';
import 'package:AngelDelivery/core/constant/color.dart';
import 'package:AngelDelivery/core/constant/imgaeasset.dart';
import 'package:AngelDelivery/core/functions/translatefatabase.dart';
import 'package:AngelDelivery/data/model/itemsmodel.dart';
import 'package:AngelDelivery/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/ItemsModel2.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel2 itemsModel;
  // final bool active;
  const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemsModel.productId}",
                        child: 
                          Image.asset(
                         
                             "${AppLink.imagestItems}/${itemsModel.productImage!}",
                         // height: 100,
                          //fit: BoxFit.fill,
                        ),
                        
                        // CachedNetworkImage(
                        //   imageUrl:
                        //      "${ AppLink.imagestItems}/${itemsModel.productImage!}",
                        //   height: 100,
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                      //const SizedBox(height: 10),
                      Text(
                          translateDatabase(
                              itemsModel.productNameAr, itemsModel.productName),
                          style: const TextStyle(
                              color: AppColor.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Rating 3.5 ", textAlign: TextAlign.center),
                          Container(
                            alignment: Alignment.bottomCenter,
                            height: 22,
                            child: Row(
                              children: [
                                ...List.generate(
                                    5,
                                    (index) => const Icon(
                                          Icons.star,
                                          size: 10,
                                        ))
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${itemsModel.productPrice} \$",
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "sans")),
                          GetBuilder<FavoriteController>(
                              builder: (controller) => IconButton(
                                  onPressed: () {
                                    if (controller.isFavorite[itemsModel.productId] ==
                                        "1") {
                                      controller.setFavorite(
                                          itemsModel.productId, "0");
                                      controller
                                          .removeFavorite(itemsModel.productId!);
                                    } else {
                                      controller.setFavorite(
                                          itemsModel.productId, "1");
                                      controller.addFavorite(itemsModel.productId!);
                                    }
                                  },
                                  icon: Icon(
                                    controller.isFavorite[itemsModel.productId] == "1"
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: AppColor.primaryColor,
                                  )))
                        ],
                      )
                    ]),
              ),
           if (itemsModel.productDiscount!= "0")   Positioned(
                top: 4,
                left: 4,
                child: Image.asset(AppImageAsset.saleOne , width: 40,))
            ],
          ),
        ));
  }
}






























// logical thinking

  // GetBuilder<FavoriteController>(
  //                         builder: (controller) => IconButton(
  //                             onPressed: () {
  //                                 if (controller.isFavorite[itemsModel.itemsId] == "1" ) {
  //                                   controller.setFavorite(
  //                                       itemsModel.itemsId, "0");
  //                                 } else {
  //                                   controller.setFavorite(
  //                                       itemsModel.itemsId, "1");
  //                                 }
  //                             },
  //                             icon: Icon(
  //                               controller.isFavorite[itemsModel.itemsId] == "1"
  //                                   ? Icons.favorite
  //                                   : Icons.favorite_border_outlined,
  //                               color: AppColor.primaryColor,
  //                             )))