import 'package:flutter/cupertino.dart';
import 'package:vh_shipper_app/models/TransactionModel.dart';

class TransactionListModel {
  String? date;
  String? fullDate;

  List<TransactionModel>? transactions;

  TransactionListModel({this.date, this.transactions, required this.fullDate});
}
