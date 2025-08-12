import '../../../core/Class/crud.dart';
import '../../../linkapi.dart';

class ServesDataCategory {
  Crud crud;
  ServesDataCategory(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.SRSC, {});
    return response.fold((l) => l, (r) => r);
  }
}
