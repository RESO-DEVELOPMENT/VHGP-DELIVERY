import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:vh_shipper_app/Json/constrain.dart';
import 'package:vh_shipper_app/apis/apiServices.dart';
import 'package:vh_shipper_app/models/MessageEdgeModel.dart';
import 'package:vh_shipper_app/models/MessageEdgeModelHistory.dart';
import 'package:vh_shipper_app/models/TransactionListModel.dart';
import 'package:vh_shipper_app/models/TransactionModel.dart';
import 'package:vh_shipper_app/pages/detail_remittance_history_page.dart';
import 'package:vh_shipper_app/provider/appProvider.dart';
import 'package:vh_shipper_app/widgets/colection_detail.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  List<TransactionModel> transactionList = [];
  bool isLoading = true;
  MessageEdgeModel messageEdgeModel = MessageEdgeModel();
  final currencyFormatter = NumberFormat('#,##0', 'ID');
  transactionTitle(List<TransactionListModel> list) {
    int count = 0;
    for (var element in list) {
      count = count + element.transactions!.length;
    }
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 243, 247, 251),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Lọc theo",
                  style: TextStyle(color: Color.fromRGBO(100, 100, 100, 1), fontSize: 14, fontFamily: "SF Regular"),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 7, bottom: 7),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kSpacingUnit * 2), border: Border.all(color: MaterialColors.primary)),
                  child: Text(
                    "1 Tháng gần nhất",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 14, fontFamily: "SF Regular"),
                  ),
                )
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 12),
            color: Colors.white,
            child: Row(
              children: [
                Text(
                  "$count giao dịch",
                  style: TextStyle(fontSize: 17, fontFamily: "SF SemiBold"),
                ),
              ],
            ),
          ),
          // Container(
          //   color: MaterialColors.primary.withOpacity(0.2),
          //   child: Row(
          //     children: [
          //       Container(
          //         padding:
          //             EdgeInsets.only(right: 15, left: 15, top: 8, bottom: 8),
          //         child: Text(
          //           "11/11/2022 Thứ Năm",
          //           style: TextStyle(
          //               fontSize: 13.5,
          //               color: MaterialColors.primary,
          //               fontFamily: "SF Medium"),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  var deliver = Row(
    children: [
      Container(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(kSpacingUnit * 1),
          color: Color.fromARGB(255, 243, 247, 251),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Chuyển tiền đến công ty",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Text("11:11  - 01/01/2022"),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kSpacingUnit * 1),
                    color: Color.fromARGB(255, 243, 247, 251),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text("Số dư ví: **********"),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "- 111.111 vnd",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ],
  );

  transactionItem(TransactionListModel list) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              color: MaterialColors.primary.withOpacity(0.1),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 15, left: 15, top: 8, bottom: 8),
                    child: Text(
                      getTimeTransaction(list.date),
                      style: TextStyle(fontSize: 13.5, color: MaterialColors.primary, fontFamily: "SF Medium"),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            if (list.transactions!.isNotEmpty)
              ...list.transactions!.map((item) {
                var index = list.transactions!.indexOf(item);
                return InkWell(
                  onTap: () {
                    var shipperId = context.read<AppProvider>().getUserId;
                    var name = context.read<AppProvider>().getName;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailRemittanceHistory(transaction: item, shipperId: shipperId, name: name)));
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      bottom: 8,
                    ),
                    margin: EdgeInsets.only(right: 15, left: 15),
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(245, 245, 245, 1)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          getTransactionType(item.transactionType).toUpperCase(),
                                          style: TextStyle(fontFamily: "SF Regular", fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: kSpacingUnit * 1,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset(item.transactionAction == 1 ? 'assets/images/green-tag.png' : 'assets/images/red-tag.png',
                                              fit: BoxFit.cover, color: Color.fromRGBO(255, 255, 255, 0.5), colorBlendMode: BlendMode.modulate),
                                        ),
                                        SizedBox(
                                          width: kSpacingUnit * 0.5,
                                        ),
                                        Text(
                                          item.transactionAction == 1 ? "Nhận tiền vào" : "Chuyển tiền đi",
                                          style: TextStyle(fontFamily: "SF Regular", fontSize: 14, color: Color.fromRGBO(120, 120, 120, 1)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: kSpacingUnit * 1,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Text(
                          "${item.transactionAction == 1 ? "+" : "-"}${currencyFormatter.format((item.amount!).toInt()).toString()} VND",
                          style: TextStyle(fontFamily: "SF SemiBold", fontSize: 16, color: item.transactionAction == 1 ? MaterialColors.success : MaterialColors.black),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList()
          ],
        ));
  }

  revenue() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 0),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(200, 200, 200, 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tài khoản thu hộ",
            style: TextStyle(color: Colors.black54, fontSize: 16, fontFamily: "SF Regular"),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "${currencyFormatter.format((wallet).toInt()).toString()} ",
            style: TextStyle(color: Colors.black, fontSize: 24, fontFamily: "SF Bold"),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.event_available,
                    size: 20,
                    color: Color.fromRGBO(80, 80, 80, 1),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "0",
                        style: TextStyle(color: Color.fromRGBO(80, 80, 80, 1), fontSize: 14),
                      ),
                      Text(
                        " đơn hàng hoàn tất",
                        style: TextStyle(color: Color.fromRGBO(80, 80, 80, 1), fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                  decoration: BoxDecoration(color: Colors.white),
                  width: 120,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      gradient: const LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                        MaterialColors.primary,
                        Color(0xfff7892b),
                      ]),
                    ),
                    height: 38,
                    child: ElevatedButton(
                      child: Text(
                        "Xem chi tiết",
                        style: TextStyle(color: Colors.white, fontFamily: "SF SemiBold", fontSize: 15),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        textStyle: TextStyle(color: Colors.black),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => ColectionDetail()))},
                    ),
                  )),
              // Column(
              //   children: [

              //     // Container(
              //     //   child: OutlinedButton(
              //     //     style: ButtonStyle(
              //     //       backgroundColor: MaterialStatePropertyAll<Color>(MaterialColors.primary),
              //     //       shape: MaterialStateProperty.all(
              //     //         RoundedRectangleBorder(
              //     //           borderRadius: BorderRadius.circular(30.0),
              //     //         ),
              //     //       ),
              //     //     ),
              //     //     onPressed: () {
              //     //       Navigator.push(context, MaterialPageRoute(builder: (context) => ColectionDetail()));
              //     //     },
              //     //     child: Text('Xem chi tiết', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 16, fontFamily: "SF SemiBold")),
              //     //   ),
              //     // ),
              //   ],
              // ),
            ],
          )
        ],
      ),
    );
  }

  List<TransactionListModel> _list = [];
  late DateTime now;
  var inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
  var inputDate;
  var outputDate;
  var nowDate;
  MessageEdgeModelHistory messageEdgeModelHistory = MessageEdgeModelHistory();
  double wallet = 0;
  var outputFormat = DateFormat('dd/MM/yyyy');
  hanldeGetTransaction(String shipperId) {
    var newList = [];
    List<TransactionModel> tmpList = [];
    List<TransactionListModel> resultList = [];

    ApiServices.getListTransaction(shipperId, 1, 10)
        .then((value) => {
              messageEdgeModel = value,
              now = DateTime.now(),
              nowDate = outputFormat.format(now),
              if (messageEdgeModel.statusCode == "Successful")
                {
                  setState(() {
                    tmpList = messageEdgeModel.data!.map((item) {
                      var tmpDate = "";
                      tmpDate = item["date"];
                      inputDate = inputFormat.parse(item["date"]);
                      outputDate = outputFormat.format(inputDate);
                      item["date"] = outputDate;
                      newList.add(outputDate);
                      TransactionModel transactionModel = TransactionModel.fromJson(item);
                      transactionModel.fullDate = tmpDate;
                      return transactionModel;
                    }).toList();
                    // newList.add("27/11/2022");
                    // tmpList.add(TransactionModel(amount: 100000, date: "27/11/2022", status: 1, transactionAction: 2, transactionType: 2));
                    newList = newList.toSet().toList();
                    for (var element in newList) {
                      TransactionListModel tracnsactionDate = TransactionListModel(date: "", fullDate: "", transactions: []);
                      for (var tran in tmpList) {
                        if (element == tran.date) {
                          tracnsactionDate.date = element;
                          tracnsactionDate.fullDate = tran.fullDate;
                          tracnsactionDate.transactions?.add(tran);
                        }
                      }
                      resultList.add(tracnsactionDate);
                    }
                    _list = resultList;
                  })
                }
              else
                {
                  setState(() {
                    isLoading = false;
                    transactionList = [];
                  })
                },
            })
        .then((value) => {
              ApiServices.getWallet(shipperId).then((value2) => {
                    messageEdgeModelHistory = value2,
                    if (messageEdgeModelHistory.statusCode == "Successful")
                      {
                        setState(() {
                          isLoading = false;
                          wallet = messageEdgeModelHistory.data.toDouble();
                        })
                      }
                    else
                      {
                        setState(() {
                          isLoading = false;
                        })
                      },
                  })
            })
        .catchError((onError) => {
              print(onError.toString()),
              setState(() {
                isLoading = false;
                transactionList = [];
              })
            });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var shipperId = context.read<AppProvider>().getUserId;
    hanldeGetTransaction(shipperId);
    // new Timer(
    //     const Duration(seconds: 2),
    //     () => {
    //           setState(() {
    //             isLoading = false;
    //           }),
    //           // orderState(() {
    //           //   statusOrder = StatusOrderAction.fail;
    //           // }),
    //         });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, child) {
      return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                  MaterialColors.primary,
                  MaterialColors.primary2,
                ]),
              ),
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              "Giao dịch",
              style: TextStyle(color: MaterialColors.white, fontFamily: "SF Bold"),
            ),
          ),
          body: Stack(
            children: [
              if (!isLoading)
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          revenue(),
                          transactionTitle(_list),
                        ],
                      ),
                      Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            child: Column(children: [
                              // SizedBox(
                              //   height: kSpacingUnit * 0.7,
                              // ),
                              if (_list.isNotEmpty) ...[..._list].map((item) => transactionItem(item)).toList(),
                              SizedBox(
                                height: kSpacingUnit * 0.5,
                              ),
                            ]),
                          )),
                    ],
                  ),
                ),
              if (!isLoading && _list.isEmpty)
                Container(
                  padding: EdgeInsets.only(top: 180),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Container(
                      //   height: 100,
                      //   width: 100,
                      //   child: Image.asset(
                      //     'assets/images/empty-order.png',
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      Image(
                          // color:70olors.red,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                          image: NetworkImage("https://cdn-icons-png.flaticon.com/512/5157/5157579.png")),
                      SizedBox(
                        height: 15,
                      ),

                      Text(
                        "Bạn không có giao dịch nào",
                        style: TextStyle(fontFamily: "SF Regular", fontSize: 16, color: Colors.black45),
                      ),
                    ],
                  )),
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
