import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:vh_shipper_app/pages/route_detail_page.dart';
import 'package:vh_shipper_app/provider/appProvider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListOrderAceeptPage extends StatefulWidget {
  const ListOrderAceeptPage({Key? key}) : super(key: key);

  @override
  _ListOrderAceeptPageState createState() => _ListOrderAceeptPageState();
}

class _ListOrderAceeptPageState extends State<ListOrderAceeptPage> {
  final currencyFormatter = NumberFormat('#,##0', 'ID');
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('routes').snapshots();
  order_item(edgeNum, firstEdge, lastEdge, orderNum, shipperId, status,
      totalBill, totalCod) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: status == 1
                          ? Color.fromRGBO(220, 220, 220, 1)
                          : MaterialColors.primary,
                    ),
                    child: status == 1
                        ? Text(
                            "Đang tìm",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(80, 80, 80, 1),
                              fontFamily: "SF Medium",
                            ),
                          )
                        : Text(
                            "Đang thực hiện",
                            style: TextStyle(
                              fontSize: 14,
                              color: MaterialColors.white,
                              fontFamily: "SF Medium",
                            ),
                          ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${edgeNum} điểm đến",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(170, 170, 170, 1),
                              fontFamily: "SF Regular",
                            ),
                          ),
                          SizedBox(width: 3),
                          Text(
                            "-",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(170, 170, 170, 1),
                              fontFamily: "SF Regular",
                            ),
                          ),
                          SizedBox(width: 3),
                          Text(
                            "₫${currencyFormatter.format((totalBill!).toInt()).toString()}",
                            style: TextStyle(
                              fontSize: 14,
                              color: MaterialColors.primary,
                              fontFamily: "SF Medium",
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [
                          Text(
                            "Tổng tiền thu hộ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(170, 170, 170, 1),
                              fontFamily: "SF Regular",
                            ),
                          ),
                          Text(
                            ": ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(170, 170, 170, 1),
                              fontFamily: "SF Regular",
                            ),
                          ),
                          Text(
                            "₫${currencyFormatter.format((totalCod!).toInt()).toString()}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(50, 50, 50, 1),
                              fontFamily: "SF Medium",
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [
                          Text(
                            "Số gói hàng",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(170, 170, 170, 1),
                              fontFamily: "SF Regular",
                            ),
                          ),
                          Text(": ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(170, 170, 170, 1),
                                fontFamily: "SF Regular",
                              )),
                          Text(
                            "${orderNum}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(50, 50, 50, 1),
                              fontFamily: "SF Medium",
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ]),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    Icon(
                      Icons.circle,
                      size: 12,
                      color: MaterialColors.primary,
                    ),
                    if (edgeNum > 2) ...[
                      Container(
                        margin: EdgeInsets.only(top: 4, bottom: 4),
                        width: 1,
                        height: 10,
                        color: Color.fromRGBO(200, 200, 200, 1),
                      ),
                      Icon(Icons.circle_outlined,
                          size: 12,
                          color: MaterialColors.primary.withOpacity(0.6)),
                      Container(
                        margin: EdgeInsets.only(top: 4, bottom: 4),
                        width: 1,
                        height: 10,
                        color: Color.fromRGBO(200, 200, 200, 1),
                      ),
                    ] else ...[
                      Container(
                        margin: EdgeInsets.only(top: 4, bottom: 4),
                        width: 1,
                        height: 22,
                        color: Color.fromRGBO(200, 200, 200, 1),
                      ),
                    ],
                    Icon(
                      Icons.circle_outlined,
                      size: 12,
                      color: Color.fromRGBO(200, 200, 200, 1),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${firstEdge}, Vinhomes Grand Park, Quận 9",
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(20, 20, 20, 1),
                          fontFamily: "SF Medium",
                          overflow: TextOverflow.ellipsis),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6, bottom: 6),
                    ),
                    if (edgeNum > 2) ...[
                      Text(
                        "+${edgeNum - 2} điểm đến...",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(170, 170, 170, 1),
                            fontFamily: "SF Regular",
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                    Container(
                      margin: EdgeInsets.only(top: 6, bottom: 6),
                    ),
                    Text(
                      "${lastEdge}, Vinhomes Grand Park, Quận 9",
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(20, 20, 20, 1),
                          fontFamily: "SF Medium",
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ))
              ],
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, child) {
      var shipperId = context.read<AppProvider>().getUserId;
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 10.0,
            automaticallyImplyLeading: false,
            // backgroundColor: MaterialColors.primary,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      MaterialColors.primary,
                      Color(0xfff7892b),
                    ]),
              ),
            ),
            title: Text(
              "Đơn hàng",
              style:
                  TextStyle(color: MaterialColors.white, fontFamily: "SF Bold"),
            ),
          ),
          body: SingleChildScrollView(
              child: Stack(
            children: [
              Column(children: [
                SizedBox(
                  height: 10,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: _usersStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    bool flag = false;
                    String routeId = "";
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    if (!snapshot.hasData) {
                      return Container(
                        height: MediaQuery.of(context).size.height - 200,
                        width: MediaQuery.of(context).size.width,
                        child: SpinKitDualRing(
                          color: MaterialColors.primary,
                          size: 40.0,
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Positioned(
                          top: 50,
                          child: Container(
                            height: MediaQuery.of(context).size.height - 200,
                            width: MediaQuery.of(context).size.width,
                            child: SpinKitDualRing(
                              color: MaterialColors.primary,
                              size: 40.0,
                            ),
                          ));
                    }
                    // print("snapshot.data!.docs: " + snapshot.data!.docs.isNotEmpty.toString());
                    if (snapshot.data!.docs.isNotEmpty) {
                      snapshot.data!.docs.forEach((DocumentSnapshot document) {
                        Map<String, dynamic> dataTmp =
                            document.data()! as Map<String, dynamic>;
                        if (dataTmp["Status"] == 2 &&
                            dataTmp["ShipperId"] == shipperId) {
                          flag = true;
                          routeId = dataTmp["RouteId"];
                        }
                      });
                      print(flag);
                      return flag
                          ? Column(
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                if (data["RouteId"] == routeId) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RouteDetailPage(
                                              routeId: data["RouteId"],
                                              status: data["Status"] ,
                                              totalBill:  data["TotalAdvance"] ?? 0,
                                              totalCod: data["TotalCod"] ?? 0)
                                        ),
                                      );
                                    },
                                    child: order_item(
                                      data["EdgeNum"] ?? 0,
                                      data["FirstEdge"] ?? "",
                                      data["LastEdge"] ?? "",
                                      data["OrderNum"] ?? 0,
                                      data["ShipperId"] ?? "",
                                      data["Status"] ?? 1,
                                      data["TotalAdvance"] ?? 0,
                                      data["TotalCod"] ?? 0,
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              }).toList(),
                            )
                          : Column(
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                if (data["Status"] == 1) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RouteDetailPage(
                                              routeId: data["RouteId"],
                                              status: data["Status"] ?? 1,
                                              totalBill: data["TotalAdvance"] ?? 0,
                                              totalCod: data["TotalCod"] ?? 0),
                                        ),
                                      );
                                    },
                                    child: order_item(
                                      data["EdgeNum"] ?? 0,
                                      data["FirstEdge"] ?? "",
                                      data["LastEdge"] ?? "",
                                      data["OrderNum"] ?? 0,
                                      data["ShipperId"] ?? "",
                                      data["Status"] ?? 1,
                                      data["TotalAdvance"] ?? 0,
                                      data["TotalCod"] ?? 0,
                                    ),
                                  );
                                } else {
                                  return Container(
                                      // padding: EdgeInsets.only(top: 100),
                                      // child: Center(
                                      //     child: Column(
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      //   crossAxisAlignment: CrossAxisAlignment.center,
                                      //   children: [
                                      //     Container(
                                      //       height: 100,
                                      //       width: 100,
                                      //       child: Image.asset(
                                      //         'assets/images/empty-order.png',
                                      //         fit: BoxFit.cover,
                                      //       ),
                                      //     ),
                                      //     Text(
                                      //       "Hiện tại không có đơn hàng nào",
                                      //       style: TextStyle(fontFamily: "SF Regular", fontSize: 16, color: Color.fromRGBO(120, 120, 120, 1)),
                                      //     ),
                                      //   ],
                                      // )),
                                      );
                                }
                              }).toList(),
                            );
                    } else {
                      return Container(
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
                              "Hiện tại không có đơn hàng nào",
                              style: TextStyle(
                                  fontFamily: "SF Regular",
                                  fontSize: 16,
                                  color: Color.fromRGBO(120, 120, 120, 1)),
                            ),
                          ],
                        )),
                      );
                    }
                  },
                )
              ]),
            ],
          )));
    });
  }
}
