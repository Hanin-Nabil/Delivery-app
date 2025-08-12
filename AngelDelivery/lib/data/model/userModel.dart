// ignore_for_file: file_names, unnecessary_this, unnecessary_new

class Users {
  String? userId;
  String? userName;
  String? userPassword;
  String? userEmail;
  String? userPhone;
  String? userVerfiycode;
  String? userApprove;
  String? userCreate;
 

  Users(
      {this.userId,
      this.userName,
      this.userPassword,
      this.userEmail,
      this.userPhone,
      this.userVerfiycode,
      this.userApprove,
      this.userCreate});

  Users.fromJson(Map json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userPassword = json['user_password'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userVerfiycode = json['user_verfiycode'];
    userApprove = json['user_approve'];
    userCreate = json['user_create'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_password'] = this.userPassword;
    data['user_email'] = this.userEmail;
    data['user_phone'] = this.userPhone;
    data['user_verfiycode'] = this.userVerfiycode;
    data['user_approve'] = this.userApprove;
    data['user_create'] = this.userCreate;
    return data;
  }
}
