/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
        required this.data,
        required this.status,
        required this.message
    });

    Data? data;
    bool? status;
    String? message ;

    factory ProfileModel.fromJson(Map<dynamic, dynamic> json) => ProfileModel(
        data: Data.fromJson(json["data"]),
        status: json["status"],
        message: json["message"],
    );

    Map<dynamic, dynamic> toJson() => {
        "data": data!.toJson(),
        "status": status,
        "message" : message
    };
}

class Data {
    Data({
        required this.image,
        required this.phone,
        required this.name,
        required this.id,
        required this.credit,
        required this.email,
        required this.points,
        required this.token,
    });

    String image;
    String phone;
    String name;
    int id;
    int credit;
    String email;
    int points;
    String token;

    factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
        image: json["image"],
        phone: json["phone"],
        name: json["name"],
        id: json["id"],
        credit: json["credit"],
        email: json["email"],
        points: json["points"],
        token: json["token"],
    );

    Map<dynamic, dynamic> toJson() => {
        "image": image,
        "phone": phone,
        "name": name,
        "id": id,
        "credit": credit,
        "email": email,
        "points": points,
        "token": token,
    };
}
