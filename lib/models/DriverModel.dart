import 'package:flutter/cupertino.dart';

class DriverModel {
  String? id;
  String? fullName;
  String? phone;
  String? email;
  String? image;
  String? deliveryTeam;
  String? password;
  String? vehicleType;
  String? licensePlates;
  String? colour;
  String? createAt;
  String? updateAt;
  bool? status;

  DriverModel(
      {this.id,
      this.image,
      this.deliveryTeam,
      this.email,
      this.fullName,
      this.password,
      this.vehicleType,
      this.phone,
      this.licensePlates,
      this.createAt,
      this.updateAt,
      this.status,
      this.colour});

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      id: json['id'],
      fullName: json['fullName'],
      image: json['image'] != "" && json['image'] != null
          ? json['image']
          : "https://firebasestorage.googleapis.com/v0/b/deliveryfood-9c436.appspot.com/o/food%2Ftopic-2.webp?alt=media&token=54a5086f-f2ea-4009-9479-28624019703e",
      email: json['email'],
      deliveryTeam: json['deliveryTeam'],
      password: json['password'],
      vehicleType: json['vehicleType'],
      licensePlates: json['licensePlates'],
      phone: json['phone'],
      status: json['status'] ?? false,
      createAt: json['createAt'] ?? "",
      updateAt: json['updateAt'] ?? "",
    );
  }
}
