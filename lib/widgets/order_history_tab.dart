import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:vh_shipper_app/Json/constrain.dart';
import 'package:vh_shipper_app/apis/apiServices.dart';
import 'package:vh_shipper_app/models/HistoryModel.dart';
import 'package:vh_shipper_app/models/MessageEdgeModel.dart';
import 'package:vh_shipper_app/pages/history_detail_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vh_shipper_app/provider/appProvider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class OrderHistoryTab extends StatefulWidget {
  int status;
  OrderHistoryTab({Key? key, required this.status}) : super(key: key);

  @override
  _OrderHistoryTabState createState() => _OrderHistoryTabState();
}

historyTitle(title) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(kSpacingUnit * 1),
      color: Color.fromARGB(255, 243, 247, 251),
    ),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: Text(
                  title,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18, fontFamily: "SF Bold"),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: kSpacingUnit * 1,
        ),
      ],
    ),
  );
}

historyItem(HistoryModel item, int status, bool isToday, bool isBorder) {
  final currencyFormatter = NumberFormat('#,##0', 'ID');
  return Container(
    padding: EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
    // margin: EdgeInsets.only(right: 15, left: 15),
    decoration: BoxDecoration(color: Colors.white, border: isBorder ? Border(bottom: BorderSide(color: Color.fromRGBO(230, 230, 230, 1))) : null),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: item.serviceName == "Hub" ? 5 : 0,
              ),
              Image(
                  // color:70olors.red,
                  height: item.serviceName == "Hub" ? 25 : 30,
                  width: item.serviceName == "Hub" ? 25 : 30,
                  fit: BoxFit.cover,
                  image: NetworkImage(item.serviceName == "Hub" ? "https://cdn-icons-png.flaticon.com/512/8072/8072884.png" : "https://cdn-icons-png.flaticon.com/512/2844/2844235.png")),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.serviceName == "Hub" ? "Hub" : "Hỏa tốc",
                    style: TextStyle(fontFamily: "SF SemiBold", fontSize: 16),
                  ),
                  SizedBox(
                    height: kSpacingUnit * 0.5,
                  ),
                  Text(
                    "₫${currencyFormatter.format((item.total!).toInt()).toString()}",
                    style: TextStyle(fontFamily: "SF Regular", fontSize: 14),
                  ),
                  SizedBox(
                    height: kSpacingUnit * 0.5,
                  ),
                  Text(
                    item.actionType == OrderAction.deliveryHub ? "Lấy hàng đến Hub" : "Giao hàng",
                    style: TextStyle(fontFamily: "SF Regular", fontSize: 14, color: Colors.black38),
                  ),
                ],
              ),
              //SizedBox(
              //width: 45,
              //),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              isToday ? getDateHistoryToday(item.date) : getDateHistory(item.date),
              style: TextStyle(fontFamily: "SF Regular", fontSize: 13, color: Colors.black38),
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
                decoration: BoxDecoration(
                  color: status == 1 ? MaterialColors.success : Colors.red[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status == 1 ? "Thành công" : "Thất bại",
                  style: TextStyle(fontFamily: "SF Medium", fontSize: 13, color: Colors.white),
                ))
          ],
        ),
      ],
    ),
  );
}

class _OrderHistoryTabState extends State<OrderHistoryTab> {
  MessageEdgeModel messageEdgeModel = MessageEdgeModel();
  List<HistoryModel> historyListToday = [];
  // List<HistoryModel> historyListCancelToday = [];
  List<HistoryModel> historyList = [];
  // List<HistoryModel> historyListCancel = [];
  bool isLoading = true;
  late DateTime now;
  var inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
  var inputDate;
  var outputDate;
  var nowDate;
  var outputFormat = DateFormat('dd/MM/yyyy');
  handleGetHistory(shipperId) {
    ApiServices.getListHistory(shipperId, widget.status, 1, 10)
        .then((value) => {
              messageEdgeModel = value,
              if (messageEdgeModel.statusCode == "Successful")
                {
                  now = DateTime.now(),
                  nowDate = outputFormat.format(now),
                  setState(() => {
                        messageEdgeModel.data!.forEach((element) {
                          inputDate = inputFormat.parse(element["date"]);
                          outputDate = outputFormat.format(inputDate);
                          if (nowDate == outputDate) {
                            historyListToday.add(HistoryModel.fromJson(element));
                          } else {
                            historyList.add(HistoryModel.fromJson(element));
                          }
                        }),
                        isLoading = false
                      })
                }
              else
                {
                  setState(() => {isLoading = false})
                }
            })
        .catchError((onError) => {print(onError.toString())});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });
    print("ok");
    handleGetHistory(context.read<AppProvider>().getUserId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, child) {
      return Scaffold(
          body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isLoading) ...[
                  SizedBox(
                    height: kSpacingUnit * 1.5,
                  ),
                  if (historyListToday.isNotEmpty) ...[
                    historyTitle("Hôm nay"),
                    ...[...historyListToday].map((item) {
                      var index = historyListToday.indexOf(item);
                      bool isBorder = true;
                      if (index == historyListToday.length - 1) {
                        isBorder = false;
                      }
                      return InkWell(
                        child: Container(
                          child: historyItem(item, widget.status, true, isBorder),
                          // color: Colors.red,
                          // margin: EdgeInsets.only(left: 15, right: 15),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HistoryDetailPage(actionType: item.actionType!, status: widget.status == 1 ? StatusHistoryOrder.done : StatusHistoryOrder.fail, historyOrderId: item.id!)));
                        },
                      );
                    }).toList(),
                  ],
                  SizedBox(
                    height: kSpacingUnit * 0.5,
                  ),
                  if (historyList.isNotEmpty) ...[
                    historyTitle("Cũ hơn"),
                    ...[...historyList].map((item) {
                      var index = historyList.indexOf(item);
                      bool isBorder = true;
                      if (index == historyList.length - 1) {
                        isBorder = false;
                      }
                      return InkWell(
                        child: historyItem(item, widget.status, true, isBorder),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HistoryDetailPage(actionType: item.actionType!, status: widget.status == 1 ? StatusHistoryOrder.done : StatusHistoryOrder.fail, historyOrderId: item.id!)));
                        },
                      );
                    })
                  ],
                  if (!isLoading && historyList.isEmpty && historyListToday.isEmpty)
                    Container(
                      padding: EdgeInsets.only(top: 100),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                              'assets/images/empty-order.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "Bạn không có đơn hàng nào",
                            style: TextStyle(fontFamily: "SF Regular", fontSize: 16),
                          ),
                        ],
                      )),
                    ),
                ],
              ],
            ),
          ),
          if (isLoading)
            Positioned(
              child: Container(
                // color: Colors.white.withOpacity(0.5),
                child: SpinKitDualRing(
                  color: MaterialColors.primary,
                  size: 40.0,
                ),
              ),
            ),
        ],
      ));
    });
  }
}
