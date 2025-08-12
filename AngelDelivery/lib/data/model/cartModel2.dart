class CartModel2 {
  String? productprice;
  String? countproduct;
  String? cartId;
  String? cartUserid;
  String? cartProductid;
  String? productId;
  String? productName;
  String? productNameAr;
  String? productDesc;
  String? productDescAr;
  String? productImage;
  String? productCount;
  String? productActive;
  String? productPrice;
  String? productDiscount;
  String? productData;
  String? productCat;
  String? productType;

  CartModel2(
      {this.productprice,
      this.countproduct,
      this.cartId,
      this.cartUserid,
      this.cartProductid,
      this.productId,
      this.productName,
      this.productNameAr,
      this.productDesc,
      this.productDescAr,
      this.productImage,
      this.productCount,
      this.productActive,
      this.productPrice,
      this.productDiscount,
      this.productData,
      this.productCat,
      this.productType});

  CartModel2.fromJson(Map json) {
    productprice = json['productprice'];
    countproduct = json['countproduct'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartProductid = json['cart_productid'];
    productId = json['product_id'];
    productName = json['product-name'];
    productNameAr = json['product_name_ar'];
    productDesc = json['product_desc'];
    productDescAr = json['product_desc_ar'];
    productImage = json['product_image'];
    productCount = json['product_count'];
    productActive = json['product_active'];
    productPrice = json['product_price'];
    productDiscount = json['product_discount'];
    productData = json['product_data'];
    productCat = json['product_cat'];
    productType = json['product_type'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['productprice'] = this.productprice;
    data['countproduct'] = this.countproduct;
    data['cart_id'] = this.cartId;
    data['cart_userid'] = this.cartUserid;
    data['cart_productid'] = this.cartProductid;
    data['product_id'] = this.productId;
    data['product-name'] = this.productName;
    data['product_name_ar'] = this.productNameAr;
    data['product_desc'] = this.productDesc;
    data['product_desc_ar'] = this.productDescAr;
    data['product_image'] = this.productImage;
    data['product_count'] = this.productCount;
    data['product_active'] = this.productActive;
    data['product_price'] = this.productPrice;
    data['product_discount'] = this.productDiscount;
    data['product_data'] = this.productData;
    data['product_cat'] = this.productCat;
    data['product_type'] = this.productType;
    return data;
  }
}
