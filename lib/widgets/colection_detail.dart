import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:vh_shipper_app/Json/constrain.dart';
import 'package:vh_shipper_app/pages/detail_remittance_history_page.dart';
import 'package:vh_shipper_app/pages/home_page.dart';
import 'package:vh_shipper_app/provider/appProvider.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ColectionDetail extends StatefulWidget {
  const ColectionDetail({super.key});

  @override
  State<ColectionDetail> createState() => _ColectionDetailState();
}

bool status = true;
historyTitle() {
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
                  "Tháng 11/2022",
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

historyItem(index) {
  return Container(
    padding: EdgeInsets.only(right: 15, top: 15, bottom: 15, left: 15),
    color: index % 2 == 1 ? Colors.white : Color.fromRGBO(250, 250, 250, 1),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                      height: kSpacingUnit * 5.5,
                      width: kSpacingUnit * 5.5,
                      child: Container(
                        height: kSpacingUnit * 5,
                        width: kSpacingUnit * 5,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), border: Border.all(width: 1, color: Color.fromRGBO(200, 200, 200, 1))),
                        child: const Center(
                          child: Image(
                              // color:70olors.red,
                              height: 20,
                              width: 20,
                              fit: BoxFit.cover,
                              image:
                                  NetworkImage("https://firebasestorage.googleapis.com/v0/b/deliveryfood-9c436.appspot.com/o/icon%2Fwallet.png?alt=media&token=49ac71c1-04e2-4e65-ae48-fbe255daeca9")),
                        ),
                      )),
                ],
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "11/09/2022 19:36:00",
                              style: TextStyle(fontFamily: "SF SemiBold", fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kSpacingUnit * 0.5,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "#093828",
                          style: TextStyle(fontFamily: "SF Regular", fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kSpacingUnit * 0.5,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "VNPay VO CHI CONG",
                          style: TextStyle(fontFamily: "SF Regular", fontSize: 16, color: Colors.black38),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "+ 100.000 VND",
                          style: TextStyle(fontFamily: "SF Regular", fontSize: 15, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Icon(
                            Icons.attach_money,
                            color: Colors.green,
                            size: kSpacingUnit * 3,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

transactionItem(index, transactionType, transactionName, transactionDate, transactionPrice) {
  final currencyFormatter = NumberFormat('#,##0', 'ID');
  return Container(
      color: index % 2 == 1 ? Colors.white : Color.fromRGBO(250, 250, 250, 1),
      child: Column(
        children: [
          Container(
            color: MaterialColors.primary.withOpacity(0.1),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 15, left: 15, top: 8, bottom: 8),
                  child: Text(
                    transactionDate,
                    style: TextStyle(fontSize: 13.5, color: MaterialColors.primary, fontFamily: "SF Medium"),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 15, top: 15, bottom: 15, left: 15),
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
                                  transactionName.toString().toUpperCase(),
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
                                  child: Image.asset(transactionType == 0 ? 'assets/images/red-tag.png' : 'assets/images/green-tag.png',
                                      fit: BoxFit.cover, color: Color.fromRGBO(255, 255, 255, 0.5), colorBlendMode: BlendMode.modulate),
                                ),
                                SizedBox(
                                  width: kSpacingUnit * 0.5,
                                ),
                                Text(
                                  transactionType == 1 ? "Nhận tiền vào" : "Chuyển tiền đi",
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
                  "${transactionType == 0 ? "-" : "+"}  ${currencyFormatter.format((transactionPrice!).toInt()).toString()} VND",
                  style: TextStyle(fontFamily: "SF SemiBold", fontSize: 16, color: transactionType == 1 ? Colors.green : Colors.black),
                ),
              ],
            ),
          )
        ],
      ));
}

class _ColectionDetailState extends State<ColectionDetail> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                  MaterialColors.primary,
                  MaterialColors.primary.withOpacity(0.99),
                  MaterialColors.primary.withOpacity(0.97),
                  MaterialColors.primary.withOpacity(0.95),
                  MaterialColors.primary.withOpacity(0.9),
                ]),
              ),
            ),
            centerTitle: true,
            shadowColor: MaterialColors.primary,
            title: Text(
              "Chi tiết giao dịch",
              style: TextStyle(color: Colors.white, fontFamily: "SF Bold"),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: kSpacingUnit * 1.5,
              ),
              historyTitle(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    // SizedBox(
                    //   height: kSpacingUnit * 0.7,
                    // ),
                    ...[1, 2, 3, 4, 5]
                        .map((item) => InkWell(
                              child: transactionItem(item, 1, "Thu hộ khách hàng", "11/11/2022 Thứ Năm", 100000),
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             DetailRemittanceHistory()));
                              },
                            ))
                        .toList(),
                    SizedBox(
                      height: kSpacingUnit * 0.5,
                    ),
                  ]),
                ),
                flex: 1,
              )
            ],
          ),
        );
      },
    );
  }
}
