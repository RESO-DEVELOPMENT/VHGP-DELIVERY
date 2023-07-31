import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:vh_shipper_app/Json/constrain.dart';
import 'package:vh_shipper_app/widgets/accordion_order.dart';
import 'package:vh_shipper_app/widgets/trip_detail.dart';

class TripInfor extends StatefulWidget {
  TripInfor({super.key});

  @override
  State<TripInfor> createState() => _TripInforState();
}

class _TripInforState extends State<TripInfor> {
  var location = 0;

  total_order() {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 15, left: 15, right: 15),
      color: Colors.white,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                  "đ200.000",
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
                  "đ500.000",
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
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Số đơn hàng - 05",
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
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Số tiền cần ứng ",
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
                          "Số tiền cần thu ",
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
                      "200.000 đ",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ]),
    );
  }

  collectMoney() {
    return Container(
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

  way(status) {
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
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Color.fromRGBO(220, 220, 220, 1)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    getStatusName(status),
                    style: TextStyle(
                      fontFamily: "SF Medium",
                      color: getColor(status),
                      fontSize: 14,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => TripDetail(status: 1),
                      //   ),
                      // );
                    },
                    child: Container(
                        padding: EdgeInsets.only(
                            left: 5, right: 5, top: 3, bottom: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: MaterialColors.primary)),
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
            collectMoney()
          ],
        ),
      ),
    );
  }

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
              height: 15,
            ),

            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: getColor(StatusAccordionOrder.fail))),
              child: AccordionOrder(
                open: false,
                status: StatusAccordionOrder.fail,
                content: way(StatusAccordionOrder.fail),
                title: "Đơn hàng #093828",
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: getColor(StatusAccordionOrder.done))),
              child: AccordionOrder(
                open: false,
                status: StatusAccordionOrder.done,
                content: way(StatusAccordionOrder.done),
                title: "Đơn hàng #093828",
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: getColor(StatusAccordionOrder.doing))),
              child: AccordionOrder(
                open: false,
                status: StatusAccordionOrder.doing,
                content: way(StatusAccordionOrder.doing),
                title: "Đơn hàng #093828",
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: getColor(StatusAccordionOrder.create))),
              child: AccordionOrder(
                open: false,
                status: StatusAccordionOrder.create,
                content: way(StatusAccordionOrder.create),
                title: "Đơn hàng #093828",
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: getColor(StatusAccordionOrder.create))),
              child: AccordionOrder(
                open: false,
                status: StatusAccordionOrder.create,
                content: way(StatusAccordionOrder.create),
                title: "Đơn hàng #093828",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
