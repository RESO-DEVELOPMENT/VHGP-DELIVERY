import 'package:flutter/cupertino.dart';

class OrderEdgeModel {
  String? orderId;
  String? actionId;
  String? name;
  String? note;
  String? phone;
  String? serviceName;
  int? paymentType;
  double? total;
  double? shipCost;
  int? actionType;
  int? actionStatus;
  List? orderDetailActions;

  OrderEdgeModel(
      {this.orderId,
      this.actionId,
      this.name,
      this.paymentType,
      this.note,
      this.phone,
      this.serviceName,
      this.total,
      this.shipCost,
      this.actionStatus,
      this.orderDetailActions,
      this.actionType});

  factory OrderEdgeModel.fromJson(Map<String, dynamic> json) {
    return OrderEdgeModel(
      orderId: json['orderId'],
      actionId: json['actionId'],
      name: json['name'],
      note: json['note'],
      phone: json['phone'],
      serviceName: json['serviceName'],
      paymentType: json['paymentType'],
      total: json['total'] != null ? json['total'].toDouble() : 0.0,
      shipCost: json['shipCost'].toDouble() ?? 0.0,
      actionType: json['actionType'],
      actionStatus: json['actionStatus'],
      orderDetailActions: json['orderDetailActions'],
    );
  }
}
