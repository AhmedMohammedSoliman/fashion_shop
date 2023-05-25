/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

ProductsHomeModel productsHomeModelFromJson(String str) => ProductsHomeModel.fromJson(json.decode(str));

String productsHomeModelToJson(ProductsHomeModel data) => json.encode(data.toJson());

class ProductsHomeModel {
    ProductsHomeModel({
        required this.data,
        required this.status,
    });

    Data data;
    bool status;

    factory ProductsHomeModel.fromJson(Map<dynamic, dynamic> json) => ProductsHomeModel(
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
        required this.ad,
        required this.banners,
        required this.products,
    });

    String ad;
    List<Banner> banners;
    List<Product> products;

    factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
        ad: json["ad"],
        banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "ad": ad,
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Banner {
    Banner({
        required this.image,
        required this.id,
        this.category,
    });

    String image;
    int id;
    Category? category;

    factory Banner.fromJson(Map<dynamic, dynamic> json) => Banner(
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

class Product {
    Product({
        required this.image,
        required this.images,
        required this.price,
        required this.inCart,
        required this.oldPrice,
        required this.inFavorites,
        required this.name,
        required this.discount,
        required this.description,
        required this.id,
    });

    String image;
    List<String> images;
    double price;
    bool inCart;
    double oldPrice;
    bool inFavorites;
    String name;
    int discount;
    String description;
    int id;

    factory Product.fromJson(Map<dynamic, dynamic> json) => Product(
        image: json["image"],
        images: List<String>.from(json["images"].map((x) => x)),
        price: json["price"]?.toDouble(),
        inCart: json["in_cart"],
        oldPrice: json["old_price"]?.toDouble(),
        inFavorites: json["in_favorites"],
        name: json["name"],
        discount: json["discount"],
        description: json["description"],
        id: json["id"],
    );

    Map<dynamic, dynamic> toJson() => {
        "image": image,
        "images": List<dynamic>.from(images.map((x) => x)),
        "price": price,
        "in_cart": inCart,
        "old_price": oldPrice,
        "in_favorites": inFavorites,
        "name": name,
        "discount": discount,
        "description": description,
        "id": id,
    };
}
