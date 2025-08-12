// ignore_for_file: prefer_const_constructors, unused_import
import 'package:AngelDelivery/controller/cart_controller.dart';
import 'package:AngelDelivery/core/class/handlingdataview.dart';
import 'package:AngelDelivery/core/constant/color.dart';
import 'package:AngelDelivery/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:AngelDelivery/view/widget/cart/customitemscartlist.dart';
import 'package:AngelDelivery/view/widget/cart/topcardCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => BottomNavgationBarCart(
                shipping: "0",
                controllercoupon: controller.controllercoupon!,
                onApplyCoupon: () {
                  controller.checkcoupon();
                },
                price: "${cartController.priceorders}",
                discount: "${controller.discountcoupon}%",
                totalprice: "${controller.getTotalPrice()}")),
        body: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/images/1.png'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: GetBuilder<CartController>(
              builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      SizedBox(height: 10),
                      TopCardCart(
                          message:
                              "You Have ${cartController.totalcountitems} Items in Your List"),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ...List.generate(
                              cartController.cart.length,
                              (index) => CustomItemsCartList(
                                  onAdd: () async {
                                    await cartController.add(
                                        cartController.cart[index].productId!);
                                    cartController.refreshPage();
                                  },
                                  onRemove: () async {
                                    await cartController.delete(
                                        cartController.cart[index].productId!);
                                    cartController.refreshPage();
                                  },
                                  imagename:
                                      "${cartController.cart[index].productImage}",
                                  name:
                                      "${cartController.cart[index].productName}",
                                  price:
                                      "${cartController.cart[index].productPrice} \$",
                                  count:
                                      "${cartController.cart[index].countproduct}"),
                            )
                          ],
                        ),
                      )
                    ],
                  )))),
        ));
  }
}
