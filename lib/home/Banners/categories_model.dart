/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
    CategoriesModel({
        required this.data,
        required this.status,

    });

    Data data;
    bool status;


    factory CategoriesModel.fromJson(Map<dynamic, dynamic> json) => CategoriesModel(
        data: Data.fromJson(json["data"]),
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "data": data.toJson(),
        "status": status,
    };
}

class Data {
    Data({
        required this.firstPageUrl,
        required this.path,
        required this.perPage,
        required this.total,
        required this.data,
        required this.lastPage,
        required this.lastPageUrl,
        required this.from,
        required this.to,
        required this.currentPage,
    });

    String firstPageUrl;
    String path;
    int perPage;
    int total;
    List<Datum> data;
    int lastPage;
    String lastPageUrl;
    int from;
    int to;
    int currentPage;

    factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
        firstPageUrl: json["first_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        total: json["total"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        from: json["from"],
        to: json["to"],
        currentPage: json["current_page"],
    );

    Map<dynamic, dynamic> toJson() => {
        "first_page_url": firstPageUrl,
        "path": path,
        "per_page": perPage,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "from": from,
        "to": to,
        "current_page": currentPage,
    };
}

class Datum {
    Datum({
        required this.image,
        required this.name,
        required this.id,
    });

    String image;
    String name;
    int id;

    factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
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
