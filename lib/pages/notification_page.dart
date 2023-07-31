import 'package:flutter/material.dart';
import 'package:vh_shipper_app/Json/constrain.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    var noti = Expanded(
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        // padding: EdgeInsets.only(right: 200),
                        child: Text(
                          "Đơn hàng gợi ý",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 25,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(
                        height: kSpacingUnit * 1.5,
                      ),
                      Container(
                        // padding: EdgeInsets.only(right: 220),
                        child: Text(
                          "1 điểm giao",
                          style: TextStyle(
                            color: Color.fromARGB(255, 128, 41, 41),
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kSpacingUnit * 1.5,
                      ),
                      Container(
                        // padding: EdgeInsets.only(right: 80),
                        child: Text(
                          "Cơm gà Nguyễn Văn Tăng",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: kSpacingUnit * 1.5,
                      ),
                      Container(
                        // padding: EdgeInsets.only(right: 330),
                        child: Text(
                          "|",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kSpacingUnit * 1.5,
                      ),
                      Container(
                        // padding: EdgeInsets.only(right: 110),
                        child: Text(
                          "S602, đường Cầu Vồng",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );

    var accept = Expanded(
      child: Column(
        children: [
          Container(
            height: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
              color: Color.fromARGB(255, 243, 247, 251),
            ),
            child: Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: kSpacingUnit * 1.5,
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 170, top: 5),
                        child: Text(
                          "Siêu tốc",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 171, 76),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "________________________________________",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                      SizedBox(
                        height: kSpacingUnit * 2,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // padding: EdgeInsets.only(right: 120),
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(
                                      "Tổng",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(
                                    height: kSpacingUnit * 1.5,
                                  ),
                                  Text(
                                    "35.000 đ",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 171, 76),
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(children: [
                                Text(
                                  "Tổng COD",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: kSpacingUnit * 1.5,
                                ),
                                Text(
                                  "0.0 đ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 171, 76),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: kSpacingUnit * 1.7,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              // padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "________________________________________",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w200),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: kSpacingUnit * 1,
                      ),
                      Container(
                        // padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Container(
                              height: kSpacingUnit * 8,
                              width: kSpacingUnit * 41,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kSpacingUnit * 2),
                                color: Color.fromARGB(255, 255, 171, 76),
                              ),
                              child: Center(
                                child: Text(
                                  "Chấp nhận",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 48, 46, 46),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 171, 76),
                Color.fromARGB(255, 74, 70, 70),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              noti,
              accept,
            ],
          )),
    );
  }
}
