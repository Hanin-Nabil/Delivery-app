// ignore_for_file: unused_local_variable

import 'package:AngelDelivery/controller/productdetails_controller.dart';
import 'package:AngelDelivery/core/class/handlingdataview.dart';
import 'package:AngelDelivery/core/constant/color.dart';
import 'package:AngelDelivery/core/constant/routes.dart';
import 'package:AngelDelivery/view/widget/productdetails/priceandcount.dart';
import 'package:AngelDelivery/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());

    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: AppColor.primaryColor,
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child: const Text(
                  "Go To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: Container(
          ////////////////////////////////////
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/20.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: GetBuilder<ProductDetailsControllerImp>(
              builder: (controller) => ListView(children: [
                    const TopProductPageDetails(),
                    const SizedBox(
                      height: 80,
                    ),
                    HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ////////////////////////////////////////////////
                                Text("${controller.itemsModel.productName}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          color: AppColor.fourthColor,
                                        )),
                                const SizedBox(height: 50),
                                ///////////////////////////////////////
                                PriceAndCountItems(
                                    onAdd: () {
                                      controller.add();
                                    },
                                    onRemove: () {
                                      controller.remove();
                                    },
                                    price:
                                        "${controller.itemsModel.productPrice}",
                                    //controller.countitems
                                    count: "${controller.countitems}"),
                                const SizedBox(height: 40),
                                /////////////////////////////////////
                                Text("${controller.itemsModel.productDesc}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            color: AppColor.grey2)),
                                const SizedBox(height: 10),
                                // Text("Color",
                                //     style: Theme.of(context).textTheme.headline1!.copyWith(
                                //           color: AppColor.fourthColor,
                                //         )),
                                // const SizedBox(height: 10),
                                // const SubitemsList()
                              ]),
                        ))
                  ])),
        ));
  }
}
