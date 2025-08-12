import 'package:AngelDelivery/core/class/crud.dart';
import 'package:AngelDelivery/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.home, {});
    return response.fold((l) => l, (r) => r);
  }
   getDataSer() async {
    var response = await crud.postData(AppLink.itemproduct, {});
    return response.fold((l) => l, (r) => r);
  }
     getDataserves() async {
    var response = await crud.postData(AppLink.itemserves, {});
    return response.fold((l) => l, (r) => r);
  }
  //   getDataSer(String usersid, String itemsid) async {
  //   var response = await crud.postData(AppLink.itemsview, 
  //   {"userid": usersid, "productid": itemsid});
  //   return response.fold((l) => l, (r) => r);
  // }

  searchData(String search) async {
    var response = await crud.postData(AppLink.searchitems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
