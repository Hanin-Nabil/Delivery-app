import 'package:cached_network_image/cached_network_image.dart';
import 'package:AngelDelivery/controller/productdetails_controller.dart';
import 'package:AngelDelivery/core/constant/color.dart';
import 'package:AngelDelivery/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              //  color: AppColor.secondColor,
              borderRadius: BorderRadius.circular(30)),
        ),
        Positioned(
            top: 30.0,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Hero(
              tag: "${controller.itemsModel.productId}",
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  "${AppLink.imagestItems}/${controller.itemsModel.productImage!}",
                ),
                radius: 110,
              ),

              // Image.asset(
              //   "${AppLink.imagestItems}/${controller.itemsModel.productImage!}",
              //   height: 200,
              //   fit: BoxFit.fill,
              // ),

              // CachedNetworkImage(
              //   imageUrl:
              //       "${AppLink.imagestItems}/${controller.itemsModel.productImage!}",
              //   height: 250,
              //   fit: BoxFit.fill,
              // ),
            ))
      ],
    );
  }
}
