import 'package:flutter/cupertino.dart';

class HistoryModel {
  String? id;
  String? serviceName;
  double? total;
  double? shippingCost;
  int? actionType;
  String? date;

  HistoryModel({
    this.id,
    this.actionType,
    this.serviceName,
    this.total,
    this.shippingCost,
    this.date,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['id'],
      actionType: json['actionType'],
      serviceName: json['serviceName'],
      shippingCost: json['shippingCost'].toDouble() ?? 0.0,
      date: json['date'],
      total: json['total'] != null ? json['total'].toDouble() : 0.0,
      // buildingName: json['buildingName'],
      // orderNum: json['orderNum'],
      // priority: json['priority'],
      // status: json['status'],
    );
  }
}
