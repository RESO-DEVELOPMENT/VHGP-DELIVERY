import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vh_shipper_app/Json/constrain.dart';
import 'package:vh_shipper_app/pages/home_page.dart';

class OrderShippingModal extends StatefulWidget {
  late ValueChanged<void> function;
  late String menuId;
  late String storeId;
  OrderShippingModal({required this.function, required this.menuId, required this.storeId});
  @override
  State<StatefulWidget> createState() => _OrderShippingModal();
}

class _OrderShippingModal extends State<OrderShippingModal> {
  int activeRadio = 0;

  bool checkInclude(ele, arr) {
    for (var index = 0; index < arr.length; index++) {
      if (arr[index].id == ele) {
        return true;
      }
    }
    return false;
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    if (phoneNumber != "") {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    }
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
                      Text("Tại sao bạn hủy đơn?", style: const TextStyle(fontFamily: "SF Bold", fontSize: 18, color: Colors.black87)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15, top: 10),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...MessageCancelCustomer.map((e) {
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

  // void _modalCancelSheetMenu(context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (builder) {
  //         return Container(
  //           // decoration: BoxDecoration(
  //           //   borderRadius: BorderRadius.only(
  //           //     topLeft: Radius.circular(45),
  //           //     topRight: Radius.circular(55),
  //           //   ),
  //           // ),
  //           child: Column(
  //             children: [
  //               Container(
  //                 padding: EdgeInsets.only(top: 15, bottom: 15),
  //                 decoration: BoxDecoration(
  //                   border: Border.all(color: Color.fromRGBO(200, 200, 200, 1)),
  //                 ),
  //                 child: Row(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Text(
  //                         "Hãy chọn lý do giao hàng thất bại",
  //                         style: TextStyle(
  //                             color: Color.fromARGB(255, 0, 0, 0),
  //                             fontFamily: "SF Bold",
  //                             fontSize: 15),
  //                       ),
  //                     ]),
  //               ),
  //               Expanded(
  //                 child: SingleChildScrollView(
  //                   child: Column(
  //                     children: [
  //                       ...MessageCancel.map((e) {
  //                         return Container(
  //                           padding: EdgeInsets.only(left: 15, right: 15),
  //                           decoration: BoxDecoration(
  //                             color: Colors.white,
  //                           ),
  //                           child: Column(
  //                             children: [
  //                               SizedBox(
  //                                 height: 15,
  //                               ),
  //                               Container(
  //                                 child: Row(
  //                                   children: [
  //                                     Container(
  //                                       child: Row(children: [
  //                                         Icon(Icons.radio_button_unchecked,
  //                                             color: Color.fromRGBO(
  //                                                 100, 100, 100, 1)),
  //                                       ]),
  //                                     ),
  //                                     SizedBox(
  //                                       width: 10,
  //                                     ),
  //                                     Container(
  //                                       child: Row(children: [
  //                                         Text(
  //                                           e["message"],
  //                                           style: TextStyle(
  //                                               color: Color.fromRGBO(
  //                                                   100, 100, 100, 1),
  //                                               fontFamily: "SF Medium",
  //                                               fontSize: 16),
  //                                         ),
  //                                       ]),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ),
  //                               SizedBox(
  //                                 height: 10,
  //                               ),
  //                             ],
  //                           ),
  //                         );
  //                       }).toList()
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               Container(
  //                 color: Colors.white,
  //                 padding: EdgeInsets.only(top: 10),
  //                 child: Column(
  //                   children: [
  //                     Container(
  //                       height: 45,
  //                       margin: EdgeInsets.only(
  //                           left: 15, right: 15, top: 0, bottom: 0),
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(10),
  //                         color: MaterialColors.primary,
  //                         border: Border.all(
  //                             color: Color.fromRGBO(200, 200, 200, 1)),
  //                       ),
  //                       child: Row(
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Container(
  //                             child: Row(children: [
  //                               TextButton(
  //                                 child: Text(
  //                                   "Xác nhận",
  //                                   style: TextStyle(
  //                                       color:
  //                                           Color.fromARGB(255, 255, 255, 255),
  //                                       fontFamily: "SF Bold",
  //                                       fontSize: 16),
  //                                 ),
  //                                 onPressed: () {},
  //                               ),
  //                             ]),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 30, bottom: 5),
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
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
                    Container(decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(230, 230, 230, 1), width: 1))), margin: EdgeInsets.only(top: 5, bottom: 5)),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
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
                                    Container(margin: EdgeInsets.only(top: 0, bottom: 15)),
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
                        Container(color: MaterialColors.grey, padding: EdgeInsets.only(top: 10)),
                        Container(
                          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                      bottomRight: Radius.circular(50),
                                    ),

                                    // padding: const EdgeInsets.only(right: 15, left: 0),
                                    child: Image(
                                      // color:40olors.red,
                                      height: 25,
                                      width: 25,
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://firebasestorage.googleapis.com/v0/b/deliveryfood-9c436.appspot.com/o/icon%2Froom-service.png?alt=media&token=67d36528-b39c-4acc-bfb2-96cf318ddf39"),
                                    )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text("Danh sách món", style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Bold", fontSize: 16)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 35, right: 15, bottom: 10, top: 10),
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
                                "₫ 55.000",
                                style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 35, right: 15, bottom: 10, top: 10),
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
                                "₫ 55.000",
                                style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Container(color: MaterialColors.grey, padding: EdgeInsets.only(top: 10)),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(
                                      "Trả tiền mặt cho nhà hàng",
                                      style: const TextStyle(color: MaterialColors.black, fontFamily: "SF SemiBold", fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "₫ 55.000",
                                      style: const TextStyle(color: MaterialColors.black, fontFamily: "SF SemiBold", fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              LayoutBuilder(
                                builder: (BuildContext context, BoxConstraints constraints) {
                                  final boxWidth = constraints.constrainWidth();
                                  const dashWidth = 5.0;
                                  final dashHeight = 1;
                                  final dashCount = (boxWidth / (2 * dashWidth)).floor();
                                  return Flex(
                                    children: List.generate(dashCount, (_) {
                                      return SizedBox(
                                        width: dashWidth,
                                        height: 1,
                                        child: DecoratedBox(
                                            decoration: BoxDecoration(
                                          color: Color.fromRGBO(200, 200, 200, 1),
                                        )),
                                      );
                                    }),
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    direction: Axis.horizontal,
                                  );
                                },
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
                                      "Thu tiền mặt",
                                      style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "₫ 70.000",
                                      style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(230, 230, 230, 1), width: 1))), margin: EdgeInsets.only(top: 15, bottom: 30)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    showModal();
                                  },
                                  child: Icon(
                                    Icons.cancel_outlined,
                                    color: Color.fromARGB(255, 221, 45, 45),
                                    size: 30,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Hủy",
                                  style: TextStyle(color: Colors.red[800], fontFamily: "SF Regular", fontSize: 16),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.help_outline_rounded, color: Color.fromRGBO(100, 100, 100, 1)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Trợ giúp",
                                  style: TextStyle(color: Color.fromRGBO(100, 100, 100, 1), fontFamily: "SF Regular", fontSize: 16),
                                )
                              ],
                            ),
                          ],
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
                      text: "Đã lấy đơn hàng",
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
                  ),
                ),
              ),
            ],
          ))
    ]);
  }
}
