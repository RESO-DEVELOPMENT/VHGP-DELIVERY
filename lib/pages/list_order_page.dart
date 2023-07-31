import 'package:flutter/material.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:vh_shipper_app/Json/constrain.dart';
import 'package:vh_shipper_app/pages/order_detail_page.dart';
import 'package:vh_shipper_app/widgets/accordion_order.dart';
import 'package:vh_shipper_app/widgets/trip_detail.dart';
import 'package:vh_shipper_app/widgets/trip_infor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class ListOrderPage extends StatefulWidget {
  double totalBill, totalCod;
  ListOrderPage({super.key, required this.totalBill, required this.totalCod});

  @override
  State<ListOrderPage> createState() => _ListOrderPageState();
}

class _ListOrderPageState extends State<ListOrderPage> {
  var location = 0;
  int activeRadio = 0;
  Future<void> _makePhoneCall(String phoneNumber) async {
    if (phoneNumber != "") {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    }
  }

  total_order() {
    final currencyFormatter = NumberFormat('#,##0', 'ID');
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 15, left: 15, right: 15),
      color: Colors.white,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center, children: [
        Column(
          children: [
            Text(
              "Tổng phí".toUpperCase(),
              style: TextStyle(
                fontFamily: "SF SemiBold",
                fontSize: 14,
                color: Color.fromRGBO(170, 170, 170, 1),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "đ${currencyFormatter.format((widget.totalBill).toInt()).toString()}",
              style: TextStyle(
                fontFamily: "SF SemiBold",
                fontSize: 17,
                color: MaterialColors.primary,
              ),
            )
          ],
        ),
        Column(
          children: [
            Text(
              "Tiền ứng tối thiểu".toUpperCase(),
              style: TextStyle(
                fontFamily: "SF SemiBold",
                fontSize: 14,
                color: Color.fromRGBO(170, 170, 170, 1),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "đ${currencyFormatter.format((widget.totalCod).toInt()).toString()}",
              style: TextStyle(
                fontFamily: "SF SemiBold",
                fontSize: 17,
                color: MaterialColors.black,
              ),
            )
          ],
        ),
      ]),
    );
  }

  header() {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Số chuyến hàng - 05",
              style: TextStyle(
                fontSize: 17,
                fontFamily: "SF Bold",
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
        Icon(
          Icons.more_vert,
          color: Colors.white,
          size: 28,
        ),
      ]),
    );
  }

  collectMoney() {
    return Container(
      // width: MediaQuery.of(context).size.width,

      color: Colors.white,
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 15,
        top: 15,
      ),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Tổng tiền ",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "SF Medium",
                          color: Color(0xfff7892b),
                        ),
                      ),
                      Icon(
                        Icons.report_gmailerrorred,
                        size: 16,
                        color: Color.fromARGB(255, 99, 92, 92),
                      ),
                    ],
                  ),
                  Text(
                    "500.000 đ",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "SF Medium",
                      color: Color(0xfff7892b),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: kSpacingUnit * 1.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Tiền mặt ",
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        Icons.report_gmailerrorred,
                        size: 15,
                        color: Color.fromARGB(255, 99, 92, 92),
                      ),
                    ],
                  ),
                  Text(
                    "500.000 đ",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  showModal() {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(8.0))),
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
              child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                          color: Colors.black87,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Hãy chọn lý do giao hàng thất bại?", style: const TextStyle(fontFamily: "SF Bold", fontSize: 18, color: Colors.black87)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...MessageCancelStore.map((e) {
                          return InkWell(
                            child: Container(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Row(children: [
                                            Icon(activeRadio == e["id"] ? Icons.radio_button_checked : Icons.radio_button_unchecked, size: 18, color: Color.fromRGBO(100, 100, 100, 1)),
                                          ]),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          child: Row(children: [
                                            Text(
                                              e["message"],
                                              style: TextStyle(color: Color.fromRGBO(100, 100, 100, 1), fontFamily: "SF Medium", fontSize: 16),
                                            ),
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              mystate(() {
                                activeRadio = e["id"];
                              });
                            },
                          );
                        }).toList()
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MaterialColors.primary,
                          border: Border.all(color: Color.fromRGBO(200, 200, 200, 1)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(children: [
                                TextButton(
                                  child: Text(
                                    "Xác nhận",
                                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontFamily: "SF Bold", fontSize: 16),
                                  ),
                                  onPressed: () {},
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            );
          });
        });
  }

  dialogOrder() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        insetPadding: EdgeInsets.all(15),
        actionsPadding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 10),
        titlePadding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
        title: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text(
            'Chi tiết đơn hàng',
            style: TextStyle(color: Colors.black, fontFamily: "SF Bold", fontSize: 18),
          ),
          InkWell(
            child: Icon(
              Icons.close,
              size: 20,
              color: Colors.black54,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ]),
        actions: <Widget>[
          Container(
            // padding: EdgeInsets.all(0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 25,
                  height: 25,
                  margin: const EdgeInsets.only(right: 15),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),

                      // padding: const EdgeInsets.only(right: 15, left: 0),
                      child: Image(
                        // color:25olors.red,
                        height: 25,
                        width: 25,
                        fit: BoxFit.cover,
                        image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/deliveryfood-9c436.appspot.com/o/icon%2Fcutlery.png?alt=media&token=18690a73-6b12-40b6-a055-3c212ebcdad4"),
                      )),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Đặt bởi",
                            style: const TextStyle(color: Color.fromRGBO(100, 100, 100, 1), fontFamily: "SF Regular", fontSize: 16),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Văn Dương",
                            style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Bold", fontSize: 16),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          _makePhoneCall("09873782823");
                        },
                        child: Icon(
                          Icons.phone_in_talk,
                          size: 24,
                          color: Color.fromRGBO(100, 100, 100, 1),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            decoration: BoxDecoration(border: Border(top: BorderSide(color: Color.fromRGBO(230, 230, 230, 1)))),
          ),
          Row(
            children: [
              Text(
                "Ghi chú khách hàng",
                style: const TextStyle(color: Color.fromRGBO(150, 150, 150, 1), fontFamily: "SF Regular", fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(240, 240, 240, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 32,
                      ),
                      child: Text(
                        "Xin ớt",
                        style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Medium", fontSize: 16),
                      ),
                    )),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            decoration: BoxDecoration(border: Border(top: BorderSide(color: Color.fromRGBO(230, 230, 230, 1)))),
          ),
          Row(
            children: [
              Text(
                "Danh sách món",
                style: const TextStyle(color: Color.fromRGBO(150, 150, 150, 1), fontFamily: "SF Regular", fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 0, top: 0),
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
                        "1 x",
                        style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Kebab Thịt heo",
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
                  "₫ 25.000",
                  style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 0, top: 0),
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
                        "1 x",
                        style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Kebab Thịt heo đặc biệt có phô mai mai mai",
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
                  "₫ 25.000",
                  style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            decoration: BoxDecoration(border: Border(top: BorderSide(color: Color.fromRGBO(230, 230, 230, 1)))),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Thu tiền mặt khách hàng",
                style: TextStyle(color: Color.fromRGBO(150, 150, 150, 1), fontFamily: "SF Regular", fontSize: 16),
              ),
              Text(
                "đ50.000",
                style: TextStyle(color: Colors.black, fontFamily: "SF Semibold", fontSize: 16),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tổng cộng",
                style: TextStyle(color: Color.fromRGBO(150, 150, 150, 1), fontFamily: "SF Regular", fontSize: 16),
              ),
              Text(
                "đ50.000",
                style: TextStyle(color: Colors.black, fontFamily: "SF Semibold", fontSize: 16),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    child: Text(
                      "Thất bại",
                      style: TextStyle(color: Colors.black45, fontFamily: "SF Medium", fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      textStyle: TextStyle(color: Colors.black),
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color: Colors.black45, width: 1)),
                    ),
                    onPressed: () => {showModal()},
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(7)),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    child: const Text(
                      "Thành công",
                      style: TextStyle(color: Colors.white, fontFamily: "SF Medium", fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: MaterialColors.primary,
                      textStyle: TextStyle(color: Colors.white),
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () => {},
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  way(status, segment) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(220, 220, 220, 1)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //  Text(
                    //   getStatusName(status),
                    //   style: TextStyle(
                    //     fontFamily: "SF Medium",
                    //     color: getColor(status),
                    //     fontSize: 14,
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                            // color:70olors.red,
                            height: 20,
                            width: 20,
                            fit: BoxFit.cover,
                            image: NetworkImage(segment == 0 ? "https://cdn-icons-png.flaticon.com/512/4521/4521931.png" : "https://cdn-icons-png.flaticon.com/512/7541/7541900.png")),
                        SizedBox(width: 5),
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            (segment == 0 ? "Lấy Hàng" : "Giao hàng") + " - 3 món",
                            style: TextStyle(
                              fontFamily: "SF Medium",
                              color: MaterialColors.primary,
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        dialogOrder();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => OrderDetailPage(
                        //             Status: segment,
                        //             statusStrip: StatusTrip.create)));
                      },
                      child: Container(
                          padding: EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), border: Border.all(color: MaterialColors.primary)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Xem chi tiết",
                                style: TextStyle(
                                  fontFamily: "SF SemiBold",
                                  color: MaterialColors.primary,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: 3),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 10,
                                color: MaterialColors.primary,
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "1 x",
                            style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 14),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "Kebab Thịt heo",
                              style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "25.000 ₫",
                      style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 14),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "1 x",
                            style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 14),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "Kebab Thịt heo đặc biệt có phô mai mai mai",
                              style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "25.000 ₫",
                      style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 14),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 0, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Xem thêm",
                      style: const TextStyle(color: Color.fromRGBO(150, 150, 150, 1), fontFamily: "SF Regular", fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color.fromRGBO(150, 150, 150, 1),
                      size: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
  // way(status) {
  //   return Container(
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(5),
  //       ),
  //       child: Container(
  //         padding: EdgeInsets.only(left: 15, right: 15),
  //         // height: kSpacingUnit * 7,
  //         // width: kSpacingUnit * 40,

  //         child: Column(
  //           children: [
  //             Container(
  //               padding: EdgeInsets.only(bottom: 10),
  //               decoration: BoxDecoration(
  //                   border: Border(
  //                       bottom: BorderSide(
  //                           color: Color.fromRGBO(220, 220, 220, 1)))),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   //  Text(
  //                   //   getStatusName(status),
  //                   //   style: TextStyle(
  //                   //     fontFamily: "SF Medium",
  //                   //     color: getColor(status),
  //                   //     fontSize: 14,
  //                   //   ),
  //                   // ),
  //                   Text(
  //                     "Lấy hàng ",
  //                     style: TextStyle(
  //                       fontFamily: "SF Medium",
  //                       color: MaterialColors.primary,
  //                       fontSize: 14,
  //                     ),
  //                   ),
  //                   InkWell(
  //                     onTap: () {
  //                       Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                           builder: (context) => OrderDetailPage(Status: 1),
  //                         ),
  //                       );
  //                     },
  //                     child: Container(
  //                         padding: EdgeInsets.only(
  //                             left: 5, right: 5, top: 3, bottom: 3),
  //                         decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(2),
  //                             border:
  //                                 Border.all(color: MaterialColors.primary)),
  //                         child: Row(
  //                           crossAxisAlignment: CrossAxisAlignment.center,
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             Text(
  //                               "Xem chi tiết",
  //                               style: TextStyle(
  //                                 fontFamily: "SF SemiBold",
  //                                 color: MaterialColors.primary,
  //                                 fontSize: 15,
  //                               ),
  //                             ),
  //                             SizedBox(width: 3),
  //                             Icon(
  //                               Icons.arrow_forward_ios_outlined,
  //                               size: 10,
  //                               color: MaterialColors.primary,
  //                             )
  //                           ],
  //                         )),
  //                   )
  //                 ],
  //               ),
  //             ),
  //             Container(
  //               padding: EdgeInsets.only(top: 15, bottom: 15),
  //               child: Row(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       SizedBox(
  //                         height: 5,
  //                       ),
  //                       Image(
  //                           // color:70olors.red,
  //                           height: 16,
  //                           width: 16,
  //                           fit: BoxFit.cover,
  //                           image: NetworkImage(
  //                               "https://cdn-icons-png.flaticon.com/512/1946/1946770.png")),
  //                       SizedBox(
  //                         height: 5,
  //                       ),
  //                       Container(
  //                         height: 30,
  //                         decoration: const BoxDecoration(
  //                             border: Border(
  //                                 right: BorderSide(
  //                                     color: Color.fromRGBO(200, 200, 200, 1),
  //                                     width: 1))),
  //                       ),
  //                       SizedBox(
  //                         height: 5,
  //                       ),
  //                       Icon(
  //                         Icons.info,
  //                         size: 16,
  //                         color: Color.fromRGBO(255, 206, 2, 1),
  //                       ),
  //                     ],
  //                   ),
  //                   SizedBox(
  //                     width: 20,
  //                   ),
  //                   Expanded(
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Text(
  //                           "Bếp Việt T13/07, MANHATTAN , Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9 13 123 123",
  //                           style: TextStyle(
  //                               fontSize: 15,
  //                               fontFamily: "SF Regular",
  //                               overflow: TextOverflow.ellipsis,
  //                               height: 1.3),
  //                           maxLines: 2,
  //                         ),
  //                         SizedBox(
  //                           height: 20,
  //                         ),
  //                         Text(
  //                           "S2.05, Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9",
  //                           style: TextStyle(
  //                               fontSize: 15,
  //                               color: Colors.black,
  //                               fontFamily: "SF Regular",
  //                               height: 1.3),
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ));
  // }

  Color getColor(status) {
    switch (status) {
      case StatusAccordionOrder.create:
        return const Color.fromRGBO(150, 150, 150, 1);
      case StatusAccordionOrder.doing:
        return MaterialColors.primary;
      case StatusAccordionOrder.done:
        return Colors.green;
      case StatusAccordionOrder.fail:
        return Colors.red;

      default:
        return const Color.fromRGBO(150, 150, 150, 1);
    }
  }

  String getStatusName(status) {
    switch (status) {
      case StatusAccordionOrder.create:
        return "Chưa làm";
      case StatusAccordionOrder.doing:
        return "Đang làm";
      case StatusAccordionOrder.done:
        return "Hoàn thành";
      case StatusAccordionOrder.fail:
        return "Đã hủy";

      default:
        return "Chưa làm";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   color: Color.fromRGBO(245, 245, 245, 1),
              //   height: 20,
              // ),
              // header(),
              total_order(),
              //collectMoney(),
              Container(
                color: Color.fromRGBO(245, 245, 245, 1),
                height: 20,
              ),

              // Container(
              //   margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(5),
              //       border:
              //           Border.all(color: getColor(StatusAccordionOrder.fail))),
              //   child: AccordionOrder(
              //     status: StatusAccordionOrder.fail,
              //     content: way(StatusAccordionOrder.fail, 0),
              //     title: "Chuyến hàng #093828",
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(5),
              //       border:
              //           Border.all(color: getColor(StatusAccordionOrder.done))),
              //   child: AccordionOrder(
              //     status: StatusAccordionOrder.done,
              //     content: way(StatusAccordionOrder.done,0),
              //     title: "Chuyến hàng #093828",
              //   ),
              Container(
                padding: EdgeInsets.all(15),
                child: Row(children: [
                  Text(
                    "Đơn hàng",
                    style: TextStyle(fontSize: 16, color: Color.fromRGBO(150, 150, 150, 1), fontFamily: "SF SemiBold", height: 1.3),
                  ),
                  Text(
                    " - ",
                    style: TextStyle(fontSize: 16, color: Color.fromRGBO(150, 150, 150, 1), fontFamily: "SF SemiBold", height: 1.3),
                  ),
                  Text(
                    "5 đơn hàng",
                    style: TextStyle(fontSize: 17, color: Colors.black, fontFamily: "SF SemiBold", height: 1.3),
                  )
                ]),
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(5),
              //       border:
              //           Border.all(color: getColor(StatusAccordionOrder.fail))),
              //   child: AccordionOrder(
              //     status: StatusAccordionOrder.fail,
              //     content: way(StatusAccordionOrder.fail),
              //     title:
              //         "S2.05, Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9",
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: getColor(StatusAccordionOrder.done))),
                child: AccordionOrder(
                  open: false,
                  status: StatusAccordionOrder.done,
                  content: way(StatusAccordionOrder.done, 0),
                  title: "#CDCC-000012",
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: getColor(StatusAccordionOrder.done))),
                child: AccordionOrder(
                  open: false,
                  status: StatusAccordionOrder.done,
                  content: way(StatusAccordionOrder.done, 0),
                  title: "#CDCC-000012",
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: getColor(StatusAccordionOrder.create))),
                child: AccordionOrder(
                  open: false,
                  status: StatusAccordionOrder.create,
                  content: way(StatusAccordionOrder.create, 1),
                  title: "#CDCC-000012",
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: getColor(StatusAccordionOrder.create))),
                child: AccordionOrder(
                  open: false,
                  status: StatusAccordionOrder.create,
                  content: way(StatusAccordionOrder.create, 1),
                  title: "#CDCC-000012",
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: getColor(StatusAccordionOrder.create))),
                child: AccordionOrder(
                  open: false,
                  status: StatusAccordionOrder.create,
                  content: way(StatusAccordionOrder.create, 0),
                  title: "#CDCC-000012",
                ),
              ),
              SizedBox(
                height: kSpacingUnit * 1.5,
              ),
            ],
          ),
        ));
  }
}
