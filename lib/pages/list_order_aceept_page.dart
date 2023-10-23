import 'dart:async';

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

import '../apis/apiServices.dart';
import '../models/RouteModel.dart';

class ListOrderAceeptPage extends StatefulWidget {
  const ListOrderAceeptPage({Key? key}) : super(key: key);

  @override
  _ListOrderAceeptPageState createState() => _ListOrderAceeptPageState();
}

class _ListOrderAceeptPageState extends State<ListOrderAceeptPage>
    with TickerProviderStateMixin {
  final currencyFormatter = NumberFormat('#,##0', 'ID');
  StreamController _productsController = new StreamController();
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('routes').snapshots();
  List<RouteModel> listRoute = [];
  bool isLoading = true;
  late TabController _tabController;
// Để phân loại order not assign và to do
  late int tabStatus = 0;

  @override
  void initState() {
    ApiServices.getListRoutes().then((value) => {
          if (value != null)
            {listRoute = value, _productsController.add(listRoute)}
        });
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    setState(() {
      tabStatus = 0;
    });
  }

  Future<void> _pullRefresh() async {
    ApiServices.getListRoutes().then((value) => {
          if (value != null)
            {
              setState(() {
                listRoute = value;
              }),
              _productsController.add(listRoute)
            }
        });
    // why use freshNumbers var? https://stackoverflow.com/a/52992836/2301224
  }

  TabBar get _tabBar => TabBar(
        labelColor: MaterialColors.primary,
        unselectedLabelColor: Colors.black45,
        tabs: [
          Tab(
              child: InkWell(
            onTap: () {
              _tabController.index = 0;
              setState(() {
                tabStatus = _tabController.index;
              });
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Đã nhận",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "SF SemiBold",
                  fontSize: 16,
                ),
              ),
            ),
          )),
          Tab(
              child: InkWell(
            onTap: () {
              _tabController.index = 1;
              setState(() {
                tabStatus = _tabController.index;
              });
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Đang tìm",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "SF SemiBold",
                  fontSize: 16,
                ),
              ),
            ),
          )),
        ],
        controller: _tabController,
      );

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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(243, 255, 85, 76),
                      Color.fromARGB(255, 249, 136, 36)
                    ]),
              ),
            ),
            title: const Text(
              "Đơn hàng",
              style:
                  TextStyle(color: MaterialColors.white, fontFamily: "SF Bold"),
            ),
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: ColoredBox(
                color: Colors.white,
                child: _tabBar,
              ),
            )),
        body: RefreshIndicator(
            onRefresh: _pullRefresh,
            child: ListView(children: [
              const SizedBox(
                height: 10,
              ),
              StreamBuilder(
                stream: _productsController.stream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  // bool flag = false;
                  // String routeId = "";
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (!snapshot.hasData) {
                    return Container(
                      height: MediaQuery.of(context).size.height - 200,
                      width: MediaQuery.of(context).size.width,
                      child: const SpinKitDualRing(
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
                          child: const SpinKitDualRing(
                            color: MaterialColors.primary,
                            size: 40.0,
                          ),
                        ));
                  }

                  // print("snapshot.data!.docs: " + snapshot.data!.docs.isNotEmpty.toString());

                  if (snapshot.data!.isNotEmpty) {
                    return Column(
                      children: [
                        Column(
                          children: listRoute
                              .where((RouteModel document) =>
                                  (_tabController.index == 0 &&
                                      document.status == 2 &&
                                      document.shipperId.toString() ==
                                          shipperId) ||
                                  (_tabController.index == 1 &&
                                      document.status == 1))
                              .map((RouteModel document) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RouteDetailPage(
                                            routeId: document.routeId!,
                                            status: document.status!,
                                            totalBill:
                                                document.totalAdvance ?? 0,
                                            totalCod: document.totalCod ?? 0,
                                            orderId: document.orderId ?? "",
                                          )),
                                );
                              },
                              child: order_item(
                                document.edgeNum ?? 0,
                                document.firstEdge ?? "",
                                document.lastEdge ?? "",
                                document.orderNum ?? 0,
                                document.shipperId ?? "",
                                document.status ?? 1,
                                document.totalAdvance ?? 0,
                                document.totalCod ?? 0,
                                document.orderId ?? "",
                              ),
                            );
                            // } else {
                            //   return Container();
                            // }
                          }).toList(),
                        ),
                      ],
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
            ])),
      );
    });
  }

  Widget order_item(edgeNum, firstEdge, lastEdge, orderNum, shipperId, status,
      totalBill, totalCod, orderId) {
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
                  Column(
                    children: [
                      Text(
                        "${orderId}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: "SF Regular",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        // width: 100,
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: status == 1
                              ? Color.fromRGBO(220, 220, 220, 1)
                              : MaterialColors.primary,
                        ),
                        child: Column(
                          children: [
                            status == 1
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
                          ],
                        ),
                      ),
                    ],
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
                      SizedBox(height: 7),
                      // Row(
                      //   children: [
                      //     Text(
                      //       "${orderId}",
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //         color: Colors.black,
                      //         fontFamily: "SF Regular",
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
                      "${firstEdge}",
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(20, 20, 20, 1),
                          fontFamily: "SF Medium",
                          overflow: TextOverflow.ellipsis),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 6, bottom: 6),
                    ),
                    if (edgeNum > 2) ...[
                      Text(
                        "+${edgeNum - 2} điểm đến...",
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(170, 170, 170, 1),
                            fontFamily: "SF Regular",
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                    Container(
                      margin: const EdgeInsets.only(top: 6, bottom: 6),
                    ),
                    Text(
                      "${lastEdge}",
                      maxLines: 1,
                      style: const TextStyle(
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
}
