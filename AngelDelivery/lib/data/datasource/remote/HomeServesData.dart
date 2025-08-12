import 'package:AngelDelivery/core/Class/crud.dart';
import 'package:AngelDelivery/linkapi.dart';

class HomeServesData {
  Crud crud;
  HomeServesData(this.crud);

    getData() async {
    var response = await crud.postData(AppLink.home, {});
    return response.fold((l) => l, (r) => r);
  }
}