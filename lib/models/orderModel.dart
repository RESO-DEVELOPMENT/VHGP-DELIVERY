// To parse this JSON data, do
//
//     final orderResponse = orderResponseFromJson(jsonString);

import 'dart:convert';

OrderResponse orderResponseFromJson(String str) => OrderResponse.fromJson(json.decode(str));

String orderResponseToJson(OrderResponse data) => json.encode(data.toJson());

class OrderResponse {
    OrderResponse({
        this.statusCode,
        this.data,
    });

    String? statusCode;
    List<Order>? data;

    factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
        statusCode: json["statusCode"],
        data: List<Order>.from(json["data"].map((x) => Order.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Order {
    Order({
        this.edgeNum,
        this.firstEdge,
        this.lastEdge,
        this.orderNum,
        this.shiperId,
        this.status,
        this.totalCod,
        this.totalBill,
    });

    int? edgeNum;
    String? firstEdge;
    String? lastEdge;
    int? orderNum;
    String? shiperId;
    int? status;
    double? totalCod;
    double? totalBill;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        edgeNum: json["edgeNum"],
        firstEdge: json["firstEdge"],
        lastEdge: json["lastEdge"],
        orderNum: json["orderNum"],
        shiperId: json["shiperId"],
        status: json["status"],
        totalCod: json["totalCod"].toDouble(),
        totalBill: json["totalBill"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "edgeNum": edgeNum,
        "firstEdge": firstEdge,
        "lastEdge": lastEdge,
        "orderNum": orderNum,
        "shiperId": shiperId,
        "status": status,
        "totalCod": totalCod,
        "totalBill": totalBill,
    };
}
