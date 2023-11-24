// To parse this JSON data, do
//
//     final createRestaurantModel = createRestaurantModelFromJson(jsonString);

import 'dart:convert';

CreateRestaurantModel createRestaurantModelFromJson(String str) =>
    CreateRestaurantModel.fromJson(json.decode(str));

String createRestaurantModelToJson(CreateRestaurantModel data) =>
    json.encode(data.toJson());

class CreateRestaurantModel {
  bool? success;
  String? message;
  Data? data;

  CreateRestaurantModel({
    this.success,
    this.message,
    this.data,
  });

  CreateRestaurantModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      CreateRestaurantModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CreateRestaurantModel.fromJson(Map<String, dynamic> json) =>
      CreateRestaurantModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Resturant? resturant;

  Data({
    this.resturant,
  });

  Data copyWith({
    Resturant? resturant,
  }) =>
      Data(
        resturant: resturant ?? this.resturant,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        resturant: json["resturant"] == null
            ? null
            : Resturant.fromJson(json["resturant"]),
      );

  Map<String, dynamic> toJson() => {
        "resturant": resturant?.toJson(),
      };
}

class Resturant {
  int? id;
  String? name;
  String? color;
  int? status;
  String? phone;
  String? address;
  String? facebookUrl;
  String? instagramUrl;
  String? discountPrecent;
  String? firstAward;
  Templete? templete;
  Subscriptions? subscriptions;
  City? city;
  Background? logo;
  Background? background;
  Background? banner;
  Background? qrCode;

  Resturant({
    this.id,
    this.name,
    this.color,
    this.status,
    this.phone,
    this.address,
    this.facebookUrl,
    this.instagramUrl,
    this.discountPrecent,
    this.firstAward,
    this.templete,
    this.subscriptions,
    this.city,
    this.logo,
    this.background,
    this.banner,
    this.qrCode,
  });

  Resturant copyWith({
    int? id,
    String? name,
    String? color,
    int? status,
    String? phone,
    String? address,
    String? facebookUrl,
    String? instagramUrl,
    String? discountPrecent,
    String? firstAward,
    Templete? templete,
    Subscriptions? subscriptions,
    City? city,
    Background? logo,
    Background? background,
    Background? banner,
    Background? qrCode,
  }) =>
      Resturant(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        status: status ?? this.status,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        facebookUrl: facebookUrl ?? this.facebookUrl,
        instagramUrl: instagramUrl ?? this.instagramUrl,
        discountPrecent: discountPrecent ?? this.discountPrecent,
        firstAward: firstAward ?? this.firstAward,
        templete: templete ?? this.templete,
        subscriptions: subscriptions ?? this.subscriptions,
        city: city ?? this.city,
        logo: logo ?? this.logo,
        background: background ?? this.background,
        banner: banner ?? this.banner,
        qrCode: qrCode ?? this.qrCode,
      );

  factory Resturant.fromJson(Map<String, dynamic> json) => Resturant(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        status: json["status"],
        phone: json["phone"],
        address: json["address"],
        facebookUrl: json["facebook_url"],
        instagramUrl: json["instagram_url"],
        discountPrecent: json["discount_precent"],
        firstAward: json["first_award"],
        templete: json["templete"] == null
            ? null
            : Templete.fromJson(json["templete"]),
        subscriptions: json["subscriptions"] == null
            ? null
            : Subscriptions.fromJson(json["subscriptions"]),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        logo: json["logo"] == null ? null : Background.fromJson(json["logo"]),
        background: json["background"] == null
            ? null
            : Background.fromJson(json["background"]),
        banner:
            json["banner"] == null ? null : Background.fromJson(json["banner"]),
        qrCode: json["qr_code"] == null
            ? null
            : Background.fromJson(json["qr_code"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "status": status,
        "phone": phone,
        "address": address,
        "facebook_url": facebookUrl,
        "instagram_url": instagramUrl,
        "discount_precent": discountPrecent,
        "first_award": firstAward,
        "templete": templete?.toJson(),
        "subscriptions": subscriptions?.toJson(),
        "city": city?.toJson(),
        "logo": logo?.toJson(),
        "background": background?.toJson(),
        "banner": banner?.toJson(),
        "qr_code": qrCode?.toJson(),
      };
}

class Background {
  int? id;
  String? mediaUrl;
  String? thumbUrl;
  int? mediaType;
  String? hash;
  int? order;

  Background({
    this.id,
    this.mediaUrl,
    this.thumbUrl,
    this.mediaType,
    this.hash,
    this.order,
  });

  Background copyWith({
    int? id,
    String? mediaUrl,
    String? thumbUrl,
    int? mediaType,
    String? hash,
    int? order,
  }) =>
      Background(
        id: id ?? this.id,
        mediaUrl: mediaUrl ?? this.mediaUrl,
        thumbUrl: thumbUrl ?? this.thumbUrl,
        mediaType: mediaType ?? this.mediaType,
        hash: hash ?? this.hash,
        order: order ?? this.order,
      );

  factory Background.fromJson(Map<String, dynamic> json) => Background(
        id: json["id"],
        mediaUrl: json["media_url"],
        thumbUrl: json["thumb_url"],
        mediaType: json["media_type"],
        hash: json["hash"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "media_url": mediaUrl,
        "thumb_url": thumbUrl,
        "media_type": mediaType,
        "hash": hash,
        "order": order,
      };
}

class City {
  int? id;
  String? name;

  City({
    this.id,
    this.name,
  });

  City copyWith({
    int? id,
    String? name,
  }) =>
      City(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Subscriptions {
  int? id;
  DateTime? startDate;
  DateTime? endDate;
  int? status;

  Subscriptions({
    this.id,
    this.startDate,
    this.endDate,
    this.status,
  });

  Subscriptions copyWith({
    int? id,
    DateTime? startDate,
    DateTime? endDate,
    int? status,
  }) =>
      Subscriptions(
        id: id ?? this.id,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
      );

  factory Subscriptions.fromJson(Map<String, dynamic> json) => Subscriptions(
        id: json["id"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "status": status,
      };
}

class Templete {
  int? id;
  String? name;
  int? categoryHasColor;
  int? productHasImage;
  int? productHasDescription;
  int? categoryHasImage;

  Templete({
    this.id,
    this.name,
    this.categoryHasColor,
    this.productHasImage,
    this.productHasDescription,
    this.categoryHasImage,
  });

  Templete copyWith({
    int? id,
    String? name,
    int? categoryHasColor,
    int? productHasImage,
    int? productHasDescription,
    int? categoryHasImage,
  }) =>
      Templete(
        id: id ?? this.id,
        name: name ?? this.name,
        categoryHasColor: categoryHasColor ?? this.categoryHasColor,
        productHasImage: productHasImage ?? this.productHasImage,
        productHasDescription:
            productHasDescription ?? this.productHasDescription,
        categoryHasImage: categoryHasImage ?? this.categoryHasImage,
      );

  factory Templete.fromJson(Map<String, dynamic> json) => Templete(
        id: json["id"],
        name: json["name"],
        categoryHasColor: json["category_has_color"],
        productHasImage: json["product_has_image"],
        productHasDescription: json["product_has_description"],
        categoryHasImage: json["category_has_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category_has_color": categoryHasColor,
        "product_has_image": productHasImage,
        "product_has_description": productHasDescription,
        "category_has_image": categoryHasImage,
      };
}
