import 'package:flutter/cupertino.dart';
import 'package:vh_shipper_app/models/EdgeModel.dart';

class MessageEdgeModelHistory {
  String? statusCode;
  dynamic data;

  MessageEdgeModelHistory({this.statusCode, this.data});

  factory MessageEdgeModelHistory.fromJson(Map<String, dynamic> json) {
    return MessageEdgeModelHistory(
      statusCode: json['statusCode'],
      data: json['data'],
    );
  }
}
