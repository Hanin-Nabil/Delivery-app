// ignore_for_file: avoid_print, unused_import

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:AngelDelivery/core/class/statusrequest.dart';
import 'package:AngelDelivery/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        
        Map<String,dynamic> responsebody = jsonDecode(response.body.toString());
        print(responsebody);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
//---------------------------------------------------------------------//
// class Crud {
//   Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
//     //,encoding: Encoding.getByName("utf-8") <String,dynamic>

//     var response = await http.post(Uri.parse(linkurl),
//         body: data, encoding: Encoding.getByName("utf-8"));
//     print(response.statusCode);

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       var responsebody = jsonDecode(response.body);
//       // Map responsebody =json.decode(response.body) ;

//       print(responsebody);

//       return Right(responsebody);
//     } else {
//       return const Left(StatusRequest.serverfailure);
//     }
//   }
// }
//---------------------------------------------------------------------//
// class Crud {
//   Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {

//         var response = await http.post(Uri.parse(linkurl), body: data);
//           print(response.statusCode) ;

//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map responsebody = jsonDecode(response.body);
//           print(responsebody) ;

//           return Right(responsebody);
//         } else {
//           return const Left(StatusRequest.serverfailure);
//         }
//       }

//   }
