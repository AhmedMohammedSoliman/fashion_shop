/// status : true
/// message : "تم تسجيل الدخول بنجاح"
/// data : {"id":55156,"name":"Abdelrahm ALgazzar","email":"ahmedellewaa22@gmail.com","phone":"01555755621","image":"https://student.valuxapps.com/storage/uploads/users/uVCkDKeG1Q_1683371513.jpeg","points":0,"credit":0,"token":"wUB1GIDpYylumKOtiwQFR1TZYK80Ap7HYcqS3DXYUP6yOLIs2cEaI3PYTcjX7aRUe2ROn2"}

class LoginModel {
  LoginModel({
      this.status, 
      this.message, 
      this.data,});

  LoginModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// id : 55156
/// name : "Abdelrahm ALgazzar"
/// email : "ahmedellewaa22@gmail.com"
/// phone : "01555755621"
/// image : "https://student.valuxapps.com/storage/uploads/users/uVCkDKeG1Q_1683371513.jpeg"
/// points : 0
/// credit : 0
/// token : "wUB1GIDpYylumKOtiwQFR1TZYK80Ap7HYcqS3DXYUP6yOLIs2cEaI3PYTcjX7aRUe2ROn2"

class Data {
  Data({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.image, 
      this.points, 
      this.credit, 
      this.token,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['image'] = image;
    map['points'] = points;
    map['credit'] = credit;
    map['token'] = token;
    return map;
  }

}