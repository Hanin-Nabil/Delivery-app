class AppLink {
  static const String server = 'http://192.168.1.108/angle_delivery_php';
  //__________________________image__________________________//

  static const String imageststatic = "../angle_delivery_php";
  static const String imagestCategories = "assets/images";
  static const String imagestItems = "assets/images";
  static const String imagestSweets = "assets/images/sweets";
  //____________________________________________________//

  static const String itemproduct = "$server/productview.php";
  static const String test = "$server/test.php";
  static const String itemserves = "$server/serves.php";
  static const String notification = "$server/notification.php";

  //__________________________Account__________________________//

  static const String signUp = "$server/account/signup.php";
  static const String login = "$server/account/login.php";
  static const String verifycodessignup = "$server/account/verfiycode.php";
  static const String resend = "$server/account/resend.php";

  //__________________________ForgetPassword__________________________//

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";

  //__________________________Home__________________________//
  static const String SRSC = "$server/serves/viewservicecategory.php";
  static const String home = "$server/home.php";
  //__________________________items__________________________//
  static const String items = "$server/items/items.php";
  static const String itemsview = "$server/item/itemview.php";
  static const String searchitems = "$server/items/search.php";

  //__________________________Favorit__________________________//

  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletefromfavroite =
      "$server/favorite/deletefromfavroite.php";

  // Cart
  static const String cartview = "$server/cart/view.php";
  static const String cartadd = "$server/cart/add.php";
  static const String cartdelete = "$server/cart/remove.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";

  // Address

  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

  // Coupon

  static const String checkcoupon = "$server/coupon/checkcoupon.php";

  // Checkout

  static const String checkout = "$server/orders/checkout.php";

  static const String pendingorders = "$server/orders/pending.php";
  static const String ordersarchive = "$server/orders/archive.php";
  static const String ordersdetails = "$server/orders/details.php";
  static const String ordersdelete = "$server/orders/delete.php";
}
