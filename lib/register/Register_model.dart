/// status : true
/// message : "تم التسجيل بنجاح"
/// data : {"name":"Abdelrahman ALgazzar","phone":"01555755","email":"ahmedellewaa@gmail.com","id":55165,"image":"https://student.valuxapps.com/storage/uploads/users/QvINXRYVhi_1683395871.jpeg","token":"TQTZkBojbR8bRzQYcZQk3ME4AxiKcfoMjcsNnNGmyJqyuT1tkcn2CH4XinMMC4lam4jHEr"}

class RegisterModel {
  RegisterModel({
      this.status, 
      this.message, 
      this.data,});

  RegisterModel.fromJson(dynamic json) {
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

/// name : "Abdelrahman ALgazzar"
/// phone : "01555755"
/// email : "ahmedellewaa@gmail.com"
/// id : 55165
/// image : "https://student.valuxapps.com/storage/uploads/users/QvINXRYVhi_1683395871.jpeg"
/// token : "TQTZkBojbR8bRzQYcZQk3ME4AxiKcfoMjcsNnNGmyJqyuT1tkcn2CH4XinMMC4lam4jHEr"

class Data {
  Data({
      this.name, 
      this.phone, 
      this.email, 
      this.id, 
      this.image, 
      this.token,});

  Data.fromJson(dynamic json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    id = json['id'];
    image = json['image'];
    token = json['token'];
  }
  String? name;
  String? phone;
  String? email;
  int? id;
  String? image;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['id'] = id;
    map['image'] = image;
    map['token'] = token;
    return map;
  }

}