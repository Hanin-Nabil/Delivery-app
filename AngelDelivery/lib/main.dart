// ignore_for_file: unused_import

import 'package:AngelDelivery/bindings/intialbindings.dart';
import 'package:AngelDelivery/core/localization/translation.dart';
import 'package:AngelDelivery/core/services/services.dart';
import 'package:AngelDelivery/routes.dart';
import 'package:AngelDelivery/view/screen/ServesHome.dart';
import 'package:AngelDelivery/view/screen/onboarding.dart';
import 'package:AngelDelivery/view/screen/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/changelocal.dart';
import 'facebook.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/orders/archive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Angle Delivery',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      // routes: routes,
       getPages: routes,
      //home: OnBoarding(),
    );
  }
}
