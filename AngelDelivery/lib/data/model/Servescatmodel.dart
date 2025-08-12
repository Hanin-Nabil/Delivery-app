class Servicecategorymodel {
  String? servicecategoryId;
  String? servicecategoryName;
  String? servicecategoryNameAr;
  String? servicecategoryImage;



  Servicecategorymodel(
      {required this.servicecategoryId,
      required this.servicecategoryName,
      required this.servicecategoryNameAr,
      required this.servicecategoryImage});

  Servicecategorymodel.fromJson(Map<String, dynamic> json) {
    servicecategoryId = json['servicecategory_id'];
    servicecategoryName = json['servicecategory_name'];
    servicecategoryNameAr = json['servicecategory_name_ar'];
    servicecategoryImage = json['servicecategory_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['servicecategory_id'] = this.servicecategoryId;
    data['servicecategory_name'] = this.servicecategoryName;
    data['servicecategory_name_ar'] = this.servicecategoryNameAr;
    data['servicecategory_image'] = this.servicecategoryImage;
    return data;
  }
}
