// // ignore_for_file: unused_import

// import 'package:ecommercecourse/controller/homeServesControllerImp.dart';
// import 'package:ecommercecourse/controller/home_controller.dart';
// import 'package:ecommercecourse/core/constant/color.dart';
// import 'package:ecommercecourse/core/functions/translatefatabase.dart';
// import 'package:ecommercecourse/data/model/categoriesmodel.dart';
// import 'package:ecommercecourse/linkapi.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';


// import '../../../data/Model/servesModel.dart';
// import '../../../data/model/CategoriesModel2.dart';
// import '../../../data/model/Servescatmodel.dart';

// class ListSeviceCategory extends GetView<HomeServesControllerImpelment> {
//   const ListSeviceCategory({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //Get.put(HomeServesControllerImp());
//     return GetBuilder<HomeServesControllerImpelment>(
//       builder: (controller) => SizedBox(
//         height: 140,
//         child: ListView.separated(
//           separatorBuilder: (context, index) => const SizedBox(width: 10),
//           itemCount: controller.serves.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             return CategoriesServes(
//               i: index,
//               servicecategoriesModel: controller.serves[index],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class CategoriesServes extends GetView<HomeServesControllerImpelment> {
//   final Servicecategorymodel servicecategoriesModel;
//   final int? i;
  
//   const CategoriesServes(
//       {Key? key, required this.servicecategoriesModel, required this.i})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         controller.changeCat(i!, servicecategoriesModel.servicecategoryId!);
//         //controller.goToItems(controller.catData, i!, categoriesModel.servesId!);
//       },
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 color: AppColor.secondColor,
//                 borderRadius: BorderRadius.circular(50)),
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             height: 100,
//             width: 100,
//             child: CircleAvatar(
//               backgroundImage: AssetImage(
//                 "${AppLink.imagestCategories}/${servicecategoriesModel.servicecategoryImage}",
//               ),
//               radius: 90,
//             ),

//             // Image.asset(
//             //   "${AppLink.imagestCategories}/${categoriesModel.servesImage}",
//             //   width: 80, height: 80,
//             //   //color: AppColor.secondColor
//             // ),
//           ),
//           const SizedBox(height: 3),
//           Container(
//             width: 100,
//             child: Center(
//               child: Text(
//                 "${translateDatabase(servicecategoriesModel.servicecategoryNameAr, servicecategoriesModel.servicecategoryName)}",
//                 style: const TextStyle(
//                     fontSize: 13,
//                     color: AppColor.secondColor,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
