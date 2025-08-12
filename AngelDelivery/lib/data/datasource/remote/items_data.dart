import 'package:AngelDelivery/core/class/crud.dart';
import 'package:AngelDelivery/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.itemsview, 
    {"userid": usersid.toString(), "productid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
