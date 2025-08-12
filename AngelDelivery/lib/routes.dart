// ignore_for_file: unused_import

import 'package:AngelDelivery/core/constant/routes.dart';
import 'package:AngelDelivery/core/middleware/mymiddleware.dart';
import 'package:AngelDelivery/test_view.dart';
import 'package:AngelDelivery/view/screen/RestorantPage.dart';
import 'package:AngelDelivery/view/screen/ServesHome.dart';
import 'package:AngelDelivery/view/screen/address/add.dart';
import 'package:AngelDelivery/view/screen/address/adddetails.dart';
import 'package:AngelDelivery/view/screen/address/view.dart';
import 'package:AngelDelivery/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:AngelDelivery/view/screen/auth/login.dart';
import 'package:AngelDelivery/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:AngelDelivery/view/screen/auth/signup.dart';
import 'package:AngelDelivery/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:AngelDelivery/view/screen/auth/success_signup.dart';
import 'package:AngelDelivery/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:AngelDelivery/view/screen/auth/verifycodesignup.dart';
import 'package:AngelDelivery/view/screen/cart.dart';
import 'package:AngelDelivery/view/screen/checkout.dart';
import 'package:AngelDelivery/view/screen/home.dart';
import 'package:AngelDelivery/view/screen/homescreen.dart';
import 'package:AngelDelivery/view/screen/items.dart';
import 'package:AngelDelivery/view/screen/language.dart';
import 'package:AngelDelivery/view/screen/myfavorite.dart';
import 'package:AngelDelivery/view/screen/onboarding.dart';
import 'package:AngelDelivery/view/screen/orders/archive.dart';
import 'package:AngelDelivery/view/screen/orders/details.dart';
import 'package:AngelDelivery/view/screen/orders/pending.dart';
import 'package:AngelDelivery/view/screen/productdetails.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  //GetPage(name: "/", page: () => const RestorantPage()),
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () =>   TestView()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.RestorantPage, page: () => const RestorantPage()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(
      name: AppRoute.serveshome,
      page: () => const HomeServesControllerImpWidget()),
  GetPage(name: AppRoute.homescreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),
  //
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),
];
