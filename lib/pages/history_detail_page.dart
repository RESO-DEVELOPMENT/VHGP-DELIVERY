import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:vh_shipper_app/Json/constrain.dart';
import 'package:vh_shipper_app/apis/apiServices.dart';
import 'package:vh_shipper_app/models/HistoryDetailModel.dart';
import 'package:vh_shipper_app/models/MessageEdgeModelHistory.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HistoryDetailPage extends StatefulWidget {
  StatusHistoryOrder status;
  String historyOrderId;
  int actionType;
  HistoryDetailPage({Key? key, required this.status, required this.historyOrderId, required this.actionType}) : super(key: key);

  @override
  _HistoryDetailPageState createState() => _HistoryDetailPageState();
}

class _HistoryDetailPageState extends State<HistoryDetailPage> {
  final currencyFormatter = NumberFormat('#,##0', 'ID');

  way() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          // height: kSpacingUnit * 7,
          // width: kSpacingUnit * 40,

          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Image(
                            // color:70olors.red,
                            height: 16,
                            width: 16,
                            fit: BoxFit.cover,
                            image: NetworkImage("https://cdn-icons-png.flaticon.com/512/1946/1946770.png")),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 30,
                          decoration: const BoxDecoration(border: Border(right: BorderSide(color: Color.fromRGBO(200, 200, 200, 1), width: 1))),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Icon(
                          Icons.info,
                          size: 16,
                          color: Color.fromRGBO(255, 206, 2, 1),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _historyDetailModel.start!,
                                maxLines: 1,
                                style: const TextStyle(color: MaterialColors.black, overflow: TextOverflow.ellipsis, fontFamily: "SF Bold", fontSize: 18),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                _historyDetailModel.startBuilding! + ", Vinhomes Grand Park, Quận 9",
                                maxLines: 1,
                                style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 15, color: Colors.black, fontFamily: "SF Regular", height: 1.3),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _historyDetailModel.end!,
                                maxLines: 1,
                                style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Bold", overflow: TextOverflow.ellipsis, fontSize: 18),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                _historyDetailModel.endBuilding! + ", Vinhomes Grand Park, Quận 9",
                                maxLines: 1,
                                style: TextStyle(fontSize: 15, color: Colors.black, fontFamily: "SF Regular", overflow: TextOverflow.ellipsis, height: 1.3),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  MessageEdgeModelHistory messageEdgeModelHistory = MessageEdgeModelHistory();
  HistoryDetailModel _historyDetailModel = HistoryDetailModel();
  bool isLoading = true;
  late final Map parsed;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiServices.getHistoryDetail(widget.historyOrderId)
        .then((value) => {
              messageEdgeModelHistory = value,
              if (messageEdgeModelHistory.statusCode == "Successful")
                {
                  setState(() => {
                        _historyDetailModel = HistoryDetailModel(
                          orderId: messageEdgeModelHistory.data["orderId"],
                          start: messageEdgeModelHistory.data["start"],
                          startBuilding: messageEdgeModelHistory.data["startBuilding"],
                          end: messageEdgeModelHistory.data["end"],
                          endBuilding: messageEdgeModelHistory.data["endBuilding"],
                          note: messageEdgeModelHistory.data["note"],
                          orderDetails: messageEdgeModelHistory.data["orderDetails"],
                          paymentType: messageEdgeModelHistory.data["paymentType"],
                          phone: messageEdgeModelHistory.data["phone"],
                          serviceName: messageEdgeModelHistory.data["serviceName"],
                          shipCost: messageEdgeModelHistory.data["shipCost"].toDouble(),
                          total: messageEdgeModelHistory.data["total"].toDouble(),
                        ),
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
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                    // MaterialColors.primary,
                    // MaterialColors.primary.withOpacity(0.99),
                    // MaterialColors.primary.withOpacity(0.97),
                    // MaterialColors.primary.withOpacity(0.95),
                    // MaterialColors.primary.withOpacity(0.9),
                    widget.status == StatusHistoryOrder.done ? Colors.green : Colors.redAccent,
                    widget.status == StatusHistoryOrder.done ? Colors.green : Colors.redAccent
                  ]),
                ),
              ),
              titleSpacing: 0,
              toolbarHeight: 65,
              centerTitle: false,
              iconTheme: IconThemeData(
                color: Colors.white, //change your color here
              ),
              elevation: 0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Đơn hàng #${_historyDetailModel.orderId ?? ""}",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "SF Bold",
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.status == StatusHistoryOrder.done ? "Đã hoàn thành" : "Thất bại",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "SF Regular",
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            body: Container(
              color: MaterialColors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: kSpacingUnit * 1.5,
                  ),
                  if (!isLoading) ...[
                    way(),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            // SizedBox(
                            //   height: kSpacingUnit * 0.7,
                            // ),
                            Stack(
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          // Container(
                                          //   padding: EdgeInsets.all(15),
                                          //   child: Row(
                                          //     crossAxisAlignment:
                                          //         CrossAxisAlignment.start,
                                          //     children: [
                                          //       Image(
                                          //         // color:25olors.red,
                                          //         height: 25,
                                          //         width: 25,
                                          //         fit: BoxFit.cover,
                                          //         image: NetworkImage(
                                          //             "https://cdn-icons-png.flaticon.com/512/1532/1532692.png"),
                                          //       ),
                                          //       SizedBox(
                                          //         width: 10,
                                          //       ),
                                          //       Expanded(
                                          //         child: Column(
                                          //           crossAxisAlignment:
                                          //               CrossAxisAlignment.start,
                                          //           mainAxisAlignment:
                                          //               MainAxisAlignment.center,
                                          //           children: [
                                          //             Container(
                                          //               decoration: BoxDecoration(),
                                          //               child: Text(
                                          //                 "Cơm sườn Tám Nga",
                                          //                 style: const TextStyle(
                                          //                     color: MaterialColors
                                          //                         .black,
                                          //                     fontFamily: "SF Bold",
                                          //                     fontSize: 18),
                                          //               ),
                                          //             ),
                                          //             SizedBox(
                                          //               height: 7,
                                          //             ),
                                          //             Container(
                                          //               child: Text(
                                          //                 "Tòa S1.07, Rainbow, Vinhomes Grand Park",
                                          //                 style: const TextStyle(
                                          //                     color: MaterialColors
                                          //                         .black,
                                          //                     fontFamily: "SF Ruglar",
                                          //                     fontSize: 14),
                                          //               ),
                                          //             ),
                                          //           ],
                                          //         ),
                                          //       )
                                          //     ],
                                          //   ),
                                          // ),
                                          Container(
                                            margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                                            decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(230, 230, 230, 1), width: 1))),
                                          ),
                                          Container(
                                              // color: MaterialColors.grey,
                                              padding: EdgeInsets.only(top: 10)),
                                          Container(
                                            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 25,
                                                  height: 25,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(50),
                                                      bottomLeft: Radius.circular(50),
                                                      topRight: Radius.circular(50),
                                                      bottomRight: Radius.circular(50),
                                                    ),

                                                    // padding: const EdgeInsets.only(right: 15, left: 0),
                                                    child: Image(
                                                      // color:40olors.red,
                                                      height: 35,
                                                      width: 35,
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage("https://cdn-icons-png.flaticon.com/512/4507/4507529.png"),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text("Danh sách món", style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Bold", fontSize: 16)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          if (_historyDetailModel.orderDetails!.isNotEmpty)
                                            ..._historyDetailModel.orderDetails!.map((item) {
                                              return Container(
                                                padding: EdgeInsets.only(left: 25, right: 15, bottom: 10, top: 10),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            "${item["quantity"]} x",
                                                            style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              item["productName"],
                                                              style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "₫${currencyFormatter.format((item["price"]).toInt())}",
                                                      style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(color: MaterialColors.grey, padding: EdgeInsets.only(top: 10)),

                                          Container(
                                            padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  // padding: EdgeInsets.only(left: 15),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Dịch vụ",
                                                        style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontFamily: "SF SemiBold", fontSize: 16),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  // padding: EdgeInsets.only(right: 15),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Image(
                                                          // color:70olors.red,
                                                          height: _historyDetailModel.serviceName.toString() == "Hub" ? 25 : 30,
                                                          width: _historyDetailModel.serviceName.toString() == "Hub" ? 25 : 30,
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(_historyDetailModel.serviceName.toString() == "Hub"
                                                              ? "https://cdn-icons-png.flaticon.com/512/8072/8072884.png"
                                                              : "https://cdn-icons-png.flaticon.com/512/2844/2844235.png")),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        _historyDetailModel.serviceName.toString(),
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: "SF SemiBold",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(color: MaterialColors.grey, padding: EdgeInsets.only(top: 10)),

                                          Container(
                                            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                                            child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                              Container(
                                                child: Row(children: [
                                                  Container(
                                                    child: Text(
                                                      "Phương thức thanh toán",
                                                      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontFamily: "SF SemiBold", fontSize: 16),
                                                    ),
                                                  )
                                                ]),
                                              ),
                                              Text(
                                                _historyDetailModel.paymentType == 0 ? "Tiền mặt" : "Đã thanh toán",
                                                style: const TextStyle(color: Colors.black, fontFamily: "SF Regular", fontSize: 16),
                                              ),
                                            ]),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                                            child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Image(
                                                        // color:70olors.red,
                                                        height: 25,
                                                        width: 25,
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage("https://cdn-icons-png.flaticon.com/512/3297/3297987.png")),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      child: Row(children: [
                                                        Container(
                                                          child: Text(
                                                            widget.actionType == OrderAction.deliveryHub ? "Trả tiền mặt cho nhà hàng" : "Thu tiền mặt khách hàng",
                                                            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontFamily: "SF SemiBold", fontSize: 16),
                                                          ),
                                                        )
                                                      ]),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    widget.actionType == OrderAction.deliveryHub ? "- ₫" : "+ ₫",
                                                    style: TextStyle(
                                                        color: widget.actionType == OrderAction.deliveryHub ? Color.fromARGB(255, 255, 0, 0) : MaterialColors.success,
                                                        fontFamily: "SF Regular",
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    currencyFormatter.format((_historyDetailModel.total!).toInt()).toString(),
                                                    style: TextStyle(
                                                        color: widget.actionType == OrderAction.deliveryHub ? Color.fromARGB(255, 255, 0, 0) : MaterialColors.success,
                                                        fontFamily: "SF Regular",
                                                        fontSize: 16),
                                                  )
                                                ],
                                              )
                                            ]),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          LayoutBuilder(
                                            builder: (BuildContext context, BoxConstraints constraints) {
                                              final boxWidth = constraints.constrainWidth();
                                              const dashWidth = 5.0;
                                              final dashHeight = 1;
                                              final dashCount = (boxWidth / (2 * dashWidth)).floor();
                                              return Flex(
                                                children: List.generate(dashCount, (_) {
                                                  return SizedBox(
                                                    width: dashWidth,
                                                    height: 1,
                                                    child: DecoratedBox(
                                                        decoration: BoxDecoration(
                                                      color: Color.fromRGBO(200, 200, 200, 1),
                                                    )),
                                                  );
                                                }),
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                direction: Axis.horizontal,
                                              );
                                            },
                                          ),
                                          Container(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          "Tổng cộng ",
                                                          style: const TextStyle(color: MaterialColors.black, fontFamily: "SF SemiBold", fontSize: 16),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Icon(
                                                          Icons.error_outline,
                                                          color: Color.fromARGB(255, 125, 125, 131),
                                                          size: 15,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          "₫",
                                                          style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          currencyFormatter.format((_historyDetailModel.total!).toInt()).toString(),
                                                          style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            padding: EdgeInsets.all(15),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: kSpacingUnit * 0.5,
                            ),
                          ]),
                        ),
                      ),
                    )
                  ]
                ],
              ),
            )),
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
    );
  }
}
