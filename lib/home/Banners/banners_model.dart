/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

BannersModel bannersModelFromJson(String str) => BannersModel.fromJson(json.decode(str));

String bannersModelToJson(BannersModel data) => json.encode(data.toJson());

class BannersModel {
    BannersModel({
        required this.data,
        required this.status,
        required this.message
    });

    List<Datum>? data;
    bool? status;
    String? message ;

    factory BannersModel.fromJson(Map<dynamic, dynamic> json) => BannersModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json!["status"],
        message: json!["message"],
    );

    Map<dynamic, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "status": status,
        "message": message,
    };
}

class Datum {
    Datum({
        required this.image,
        required this.id,
        this.category,
    });

    String image;
    int id;
    Category? category;

    factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        image: json["image"],
        id: json["id"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "image": image,
        "id": id,
        "category": category?.toJson(),
    };
}

class Category {
    Category({
        required this.image,
        required this.name,
        required this.id,
    });

    String image;
    String name;
    int id;

    factory Category.fromJson(Map<dynamic, dynamic> json) => Category(
        image: json["image"],
        name: json["name"],
        id: json["id"],
    );

    Map<dynamic, dynamic> toJson() => {
        "image": image,
        "name": name,
        "id": id,
    };
}
