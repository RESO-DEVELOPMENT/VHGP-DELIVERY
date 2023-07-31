import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:vh_shipper_app/Json/constrain.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    var ATMInfor = Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
      padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 3, 82, 151),
            Color.fromARGB(255, 58, 173, 223),
            Color.fromARGB(255, 25, 124, 185),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "CARD NAME",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontFamily: "SF Regular"),
            ),
          ),
          SizedBox(
            height: kSpacingUnit * 0.5,
          ),
          Container(
            child: Text(
              "VO CHI CONG",
              style: TextStyle(
                  color: Colors.white, fontSize: 17, fontFamily: "SF SemiBold"),
            ),
          ),
          SizedBox(
            height: kSpacingUnit * 2,
          ),
          Row(
            children: [
              Text(
                "****",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "SF SemiBold"),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "****",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "SF SemiBold"),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "****",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "SF SemiBold"),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "1234",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "SF SemiBold"),
              ),
            ],
          ),
          SizedBox(
            height: kSpacingUnit * 2,
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "EXPIRES",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              fontFamily: "SF Regular"),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Text(
                          "09/26",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: "SF SemiBold"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "CVV NUMBER",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              fontFamily: "SF Regular"),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Text(
                          "**0",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: "SF SemiBold"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

    var revenue = Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
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
            "Hôm nay",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontFamily: "SF SemiBold"),
          ),
          SizedBox(
            height: kSpacingUnit * 1.5,
          ),
          Text(
            "0.00 đ",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontFamily: "SF Bold"),
          ),
          SizedBox(
            height: kSpacingUnit * 0.5,
          ),
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
                        style: TextStyle(
                            color: Color.fromRGBO(80, 80, 80, 1), fontSize: 14),
                      ),
                      Text(
                        " đơn hàng hoàn tất",
                        style: TextStyle(
                            color: Color.fromRGBO(80, 80, 80, 1), fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            MaterialColors.primary),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      onPressed: null,
                      child: Text('Xem chi tiết',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontFamily: "SF SemiBold")),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );

    var collection = Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(200, 200, 200, 1)),
      ),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Số dư",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "SF SemiBold"),
                  ),
                ),
                Container(
                  child: Text(
                    "0.00 đ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: "SF SemiBold"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 20,
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: Color.fromRGBO(220, 220, 220, 1)))),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Icon(
                          Icons.input,
                          size: 28,
                          color: MaterialColors.primary,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Nạp tiền",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(80, 80, 80, 1),
                            fontFamily: "SD Regular"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        size: 28,
                        color: MaterialColors.primary,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Rút tiền",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(80, 80, 80, 1),
                            fontFamily: "SD Regular"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Icon(
                          Icons.history,
                          size: 28,
                          color: MaterialColors.primary,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Lịch sử ",
                        style: TextStyle(
                          fontFamily: "SD Regular",
                          fontSize: 15,
                          color: Color.fromRGBO(80, 80, 80, 1),
                        ),
                      ),
                      Text(
                        "giao dịch ",
                        style: TextStyle(
                          fontFamily: "SD Regular",
                          fontSize: 15,
                          color: Color.fromRGBO(80, 80, 80, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

    var bonous = Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(200, 200, 200, 1)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Thưởng",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "SF SemiBold"),
                ),
              ),
              Container(
                child: Text(
                  "0.00 đ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "SF SemiBold"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Phạt",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "SF SemiBold"),
                  ),
                ),
                Container(
                  child: Text(
                    "0.00 đ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "SF SemiBold"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

    // var header = Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: <Widget>[
    //     SizedBox(
    //       width: kSpacingUnit * 3,
    //     ),
    //     ATMInfor,
    //     SizedBox(
    //       width: kSpacingUnit * 2,
    //     ),
    //   ],
    // );

    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          SizedBox(
            height: kSpacingUnit * 1.5,
          ),
          ATMInfor,
          SizedBox(
            height: kSpacingUnit * 3,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Tổng kết doanh thu",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "SF Bold",
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: kSpacingUnit * 0.5,
          ),
          revenue,
          SizedBox(
            height: kSpacingUnit * 2,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Doanh thu thu hộ",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "SF Bold",
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: kSpacingUnit * 0.5,
          ),
          collection,
          SizedBox(
            height: kSpacingUnit * 2,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Doanh thu bổ xung",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "SF Bold",
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: kSpacingUnit * 0.5,
          ),
          bonous,
          SizedBox(
            height: kSpacingUnit * 1.5,
          ),
        ],
      ),
    );
  }
}
