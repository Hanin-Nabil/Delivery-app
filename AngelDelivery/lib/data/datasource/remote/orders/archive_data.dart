import 'package:AngelDelivery/core/class/crud.dart';
import 'package:AngelDelivery/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.ordersarchive, {"id": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
