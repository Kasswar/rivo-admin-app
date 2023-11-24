// To parse this JSON data, do
//
//     final activateModel = activateModelFromJson(jsonString);

import 'dart:convert';

ActivateModel activateModelFromJson(String str) =>
    ActivateModel.fromJson(json.decode(str));

String activateModelToJson(ActivateModel data) => json.encode(data.toJson());

class ActivateModel {
  bool? success;
  String? message;
  dynamic data;

  ActivateModel({
    this.success,
    this.message,
    this.data,
  });

  ActivateModel copyWith({
    bool? success,
    String? message,
    dynamic data,
  }) =>
      ActivateModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ActivateModel.fromJson(Map<String, dynamic> json) => ActivateModel(
        success: json["success"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data,
      };
}
