import 'package:flutter/cupertino.dart';

class EdgeModel {
  String? id;
  String? buildingId;
  String? buildingName;
  int? orderNum;
  int? priority;
  int? status;

  EdgeModel(
      {this.id,
      this.buildingId,
      this.buildingName,
      this.orderNum,
      this.status,
      this.priority});

  factory EdgeModel.fromJson(Map<String, dynamic> json) {
    return EdgeModel(
      id: json['id'],
      buildingId: json['buildingId'],
      buildingName: json['buildingName'],
      orderNum: json['orderNum'],
      priority: json['priority'],
      status: json['status'],
    );
  }
}
