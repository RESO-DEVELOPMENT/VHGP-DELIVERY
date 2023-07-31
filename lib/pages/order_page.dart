import 'package:flutter/material.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:vh_shipper_app/Json/constrain.dart';
import 'package:vh_shipper_app/pages/order_detail_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  var location = 0;
  @override
  Widget build(BuildContext context) {
    header() {
      return Container(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
        decoration: BoxDecoration(color: Colors.white
            // gradient: LinearGradient(
            //     begin: Alignment.centerLeft,
            //     end: Alignment.centerRight,
            //     colors: [
            //       Color(0xfff7892b).withOpacity(0.9),
            //       Color(0xfff7892b).withOpacity(0.8),
            //       MaterialColors.primary,
            //     ]),
            ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Công việc #F9838",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "SF Bold",
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Lấy hàng",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "SF Regular",
                      color: Colors.black,
                    ),
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
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
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
                          "Tổng phí ",
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
                      "50.000 đ",
                      style: TextStyle(
                        fontSize: 16,
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
                          "Nhận tiền mặt ",
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
                      "50.000 đ",
                      style: TextStyle(fontSize: 15),
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
                          "Tổng tiền thu hộ ",
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
                      "50.000 đ",
                      style: TextStyle(fontSize: 15),
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
                          "Phương thức thanh toán ",
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
                      "Tiền mặt",
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

    service() {
      return Container(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 10),
            // height: kSpacingUnit * 10.5,
            // width: kSpacingUnit * 40,

            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // padding: EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Dịch vụ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "SF Medium",
                                      color: Color.fromRGBO(170, 170, 170, 1)),
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
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://cdn-icons-png.flaticon.com/512/2844/2844235.png")),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Siêu tốc",
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
                    SizedBox(
                      height: kSpacingUnit * 1,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(240, 240, 240, 1)))),
                    ),
                    SizedBox(
                      height: kSpacingUnit * 1.5,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // padding: EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Dịch vụ kèm theo",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kSpacingUnit * 1.5,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                              // color:70olors.red,
                              height: 25,
                              width: 25,
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://cdn-icons-png.flaticon.com/512/1532/1532672.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // padding: EdgeInsets.only(left: 30),
                                child: Text(
                                  "Giao hàng tận tay",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "SF SemiBold",
                                  ),
                                ),
                              ),
                              Container(
                                // padding: EdgeInsets.only(right: 30),
                                child: Text(
                                  "x1",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "SF SemiBold",
                                  ),
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ));
    }

    note() {
      return Container(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(15),
          // height: kSpacingUnit * 7,
          // width: kSpacingUnit * 40,

          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  "Ghi chú từ khách hàng",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "SF Medium",
                                      color: Color.fromRGBO(170, 170, 170, 1)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kSpacingUnit * 1.5,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Xin khăn giấy, ít cay",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "SF SemiBold",
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    way() {
      return Container(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(15),
            // height: kSpacingUnit * 7,
            // width: kSpacingUnit * 40,

            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Lộ trình",
                        style: TextStyle(
                          fontFamily: "SF Medium",
                          color: Color.fromRGBO(170, 170, 170, 1),
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => OrderDetailPage(
                          //         status: 1, statusEdge: StatusEdge.done),
                          //   ),
                          // );
                        },
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 5, right: 5, top: 3, bottom: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border:
                                    Border.all(color: MaterialColors.primary)),
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
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: kSpacingUnit * 1.5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      location = 0;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 15, bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: location == 0
                                ? Color.fromRGBO(120, 120, 120, 1)
                                : Color.fromRGBO(245, 245, 245, 1))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                            // color:70olors.red,
                            height: 16,
                            width: 16,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://cdn-icons-png.flaticon.com/512/1946/1946770.png")),
                        SizedBox(
                          width: kSpacingUnit * 1,
                        ),
                        Expanded(
                            child: Container(
                          child: Text(
                            "Bếp Việt T13/07, MANHATTAN , Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "SF Medium",
                                height: 1.3),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      location = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 15, bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.white38.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: location == 1
                                ? Color.fromRGBO(120, 120, 120, 1)
                                : Color.fromRGBO(245, 245, 245, 1))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info,
                          size: 16,
                          color:
                              Color.fromRGBO(255, 206, 2, 1).withOpacity(0.4),
                        ),
                        SizedBox(
                          width: kSpacingUnit * 1,
                        ),
                        Expanded(
                            child: Container(
                          child: Text(
                            "S2.05, Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.4),
                                fontFamily: "SF Medium",
                                height: 1.3),
                          ),
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ));
    }

    return Scaffold(
        // backgroundColor: Colors.white,
        body: SingleChildScrollView(
      child: Column(
        children: [
          header(),
          Container(
            color: Color(0xFFF3F7FB),
            height: 15,
          ),
          collectMoney(),
          Container(
            color: Color(0xFFF3F7FB),
            height: 15,
          ),
          service(),
          Container(
            color: Color(0xFFF3F7FB),
            height: 15,
          ),
          note(),
          Container(
            color: Color(0xFFF3F7FB),
            height: 15,
          ),
          // product(),
          way(),
          Container(
            color: Color(0xFFF3F7FB),
            height: 15,
          ),
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>
              //         OrderDetailPage(status: 1, statusEdge: StatusEdge.done),
              //   ),
              // );
            },
            child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(15),
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: MaterialColors.primary,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: MaterialColors.primary)),
                child: Text(
                  "Xem lộ trình",
                  style: TextStyle(
                    fontFamily: "SF SemiBold",
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )),
          ),
          Container(
            color: Color(0xFFF3F7FB),
            height: 15,
          ),
        ],
      ),
    ));
  }
}
