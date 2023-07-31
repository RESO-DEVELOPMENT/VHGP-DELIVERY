import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:slide_to_act/slide_to_act.dart';

class OrderAcceptModal extends StatefulWidget {
  late ValueChanged<void> function;

  OrderAcceptModal({
    required this.function,
  });
  @override
  State<StatefulWidget> createState() => _OrderAcceptModal();
}

class _OrderAcceptModal extends State<OrderAcceptModal> {
  bool checkInclude(ele, arr) {
    for (var index = 0; index < arr.length; index++) {
      if (arr[index].id == ele) {
        return true;
      }
    }
    return false;
  }

  var count = 15;

  late Timer _timer;

  void _startTimer() {
    count = 2000;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (count > 0) {
        setState(() {
          count--;
        });
      } else {
        Navigator.pop(context);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _startTimer();

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 40, bottom: 5),
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(250, 250, 250, 1), border: Border.all(color: Color.fromRGBO(200, 200, 200, 1), width: 1), borderRadius: BorderRadius.all(Radius.circular(8))),
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Row(
                        children: [
                          Container(
                            width: 35,
                            height: 35,
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
                                  // color:35olors.red,
                                  height: 35,
                                  width: 35,
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://firebasestorage.googleapis.com/v0/b/deliveryfood-9c436.appspot.com/o/icon%2Fcutlery.png?alt=media&token=18690a73-6b12-40b6-a055-3c212ebcdad4"),
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
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(250, 250, 250, 1), border: Border.all(color: Color.fromRGBO(200, 200, 200, 1), width: 1), borderRadius: BorderRadius.all(Radius.circular(8))),
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.all(15),
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
                                  Container(
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: MaterialColors.secondary),
                                    width: 10,
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 45,
                                    decoration: const BoxDecoration(border: Border(right: BorderSide(color: Color.fromRGBO(200, 200, 200, 1), width: 1))),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: MaterialColors.primary),
                                    width: 10,
                                    height: 10,
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
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        "Bánh Mì Kebab Gia Thành Bánh Mì Kebab Gia Thành",
                                        style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Bold", fontSize: 18),
                                        maxLines: 1,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      child: Text(
                                        "20 Trương Công Định",
                                        style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Ruglar", fontSize: 14),
                                      ),
                                      height: 40,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        "Tòa S1.07",
                                        style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Bold", fontSize: 18),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      child: Text(
                                        "Tòa S1.07, Rainbow, Vinhomes Grand Park",
                                        style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Ruglar", fontSize: 14),
                                      ),
                                    ),
                                    Container(
                                        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(230, 230, 230, 1), width: 1))),
                                        margin: EdgeInsets.only(top: 15, bottom: 15)),
                                    Container(
                                      child: Text(
                                        "FD-0939",
                                        style: const TextStyle(color: Color.fromRGBO(100, 100, 100, 1), fontFamily: "SF Ruglar", fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(250, 250, 250, 1), border: Border.all(color: Color.fromRGBO(200, 200, 200, 1), width: 1), borderRadius: BorderRadius.all(Radius.circular(8))),
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(
                                      "Phương thức thanh toán",
                                      style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Tiền mặt",
                                      style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                                    ),
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
                                  Container(
                                    child: Text(
                                      "Cước phí",
                                      style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "₫ 15.000",
                                      style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                                    ),
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
                                  Container(
                                    child: Text(
                                      "Tổng phí",
                                      style: const TextStyle(color: Color.fromRGBO(255, 105, 0, 1), fontFamily: "SF Regular", fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "₫ 70.000",
                                      style: const TextStyle(color: Color.fromRGBO(255, 105, 0, 1), fontFamily: "SF Regular", fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                      // height: 70,
                      decoration: BoxDecoration(color: Colors.white),
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: SlideAction(
                          alignment: Alignment.bottomCenter,
                          textStyle: TextStyle(fontSize: 18, fontFamily: "SF Bold", color: Colors.white),
                          // innerColor: Color.fromRGBO(219, 98, 71, 1),
                          outerColor: Color.fromARGB(255, 12, 120, 209),
                          innerColor: MaterialColors.secondary,
                          // text: "Chấp nhận" + ,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 140,
                                child: Text("Chấp nhận", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontFamily: "SF Bold", color: Colors.white)),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(color: Color.fromRGBO(200, 200, 200, 1).withOpacity(0.5), borderRadius: BorderRadius.all(Radius.circular(50))),
                                  child: Text(count.toString(), style: TextStyle(fontSize: 18, fontFamily: "SF Bold", color: Colors.white))),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                          height: 55,
                          sliderButtonIconSize: 35,
                          sliderRotate: false,
                          borderRadius: 10,
                          sliderButtonIconPadding: 15,
                          submittedIcon: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          sliderButtonYOffset: -8,
                          sliderButtonIcon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          onSubmit: () {
                            Future.delayed(
                              Duration(milliseconds: 200),
                              () => {
                                Navigator.pop(context),
                              },
                            );
                          },
                        ),
                      ))),
            ],
          ))
    ]);
  }
}
