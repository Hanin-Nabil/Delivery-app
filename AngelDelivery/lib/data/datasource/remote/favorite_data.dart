import 'package:AngelDelivery/core/class/crud.dart';
import 'package:AngelDelivery/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.favoriteAdd, {"userid": usersid.toString(), "productid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.favoriteRemove, {"userid": usersid.toString(), "productid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
