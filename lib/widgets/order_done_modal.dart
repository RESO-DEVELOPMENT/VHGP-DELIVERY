import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:vh_shipper_app/pages/home_page.dart';

class OrderDoneModal extends StatefulWidget {
  late ValueChanged<void> function;
  late String menuId;
  late String storeId;
  OrderDoneModal({required this.function, required this.menuId, required this.storeId});
  @override
  State<StatefulWidget> createState() => _OrderDoneModal();
}

class _OrderDoneModal extends State<OrderDoneModal> {
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

  void _modalCancelSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(55),
                ),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                          Text(
                            "Hãy chọn lý do giao hàng thất bại",
                            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontFamily: "SF Bold", fontSize: 15),
                          ),
                        ]),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color.fromRGBO(200, 200, 200, 1)),
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
                                      Icon(Icons.radio_button_unchecked, color: Color.fromARGB(255, 179, 176, 173)),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text(
                                        "Người nhận không nghe máy",
                                        style: TextStyle(color: Color.fromARGB(255, 179, 176, 173), fontFamily: "SF Bold", fontSize: 16),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Icon(Icons.radio_button_unchecked, color: Color.fromARGB(255, 179, 176, 173)),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text(
                                        "Thuê bao không liên lạc được",
                                        style: TextStyle(color: Color.fromARGB(255, 179, 176, 173), fontFamily: "SF Bold", fontSize: 16),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Icon(Icons.radio_button_unchecked, color: Color.fromARGB(255, 179, 176, 173)),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text(
                                        "Sai số điện thoại",
                                        style: TextStyle(color: Color.fromARGB(255, 179, 176, 173), fontFamily: "SF Bold", fontSize: 16),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Icon(Icons.radio_button_unchecked, color: Color.fromARGB(255, 179, 176, 173)),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text(
                                        "Người nhận không xuất hiện",
                                        style: TextStyle(color: Color.fromARGB(255, 179, 176, 173), fontFamily: "SF Bold", fontSize: 16),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Icon(Icons.radio_button_unchecked, color: Color.fromARGB(255, 179, 176, 173)),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text(
                                        "Người nhận hẹn lại ngày giao",
                                        style: TextStyle(color: Color.fromARGB(255, 179, 176, 173), fontFamily: "SF Bold", fontSize: 16),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Icon(Icons.radio_button_unchecked, color: Color.fromARGB(255, 179, 176, 173)),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text(
                                        "Người nhận hẹn giao lại trong ngày",
                                        style: TextStyle(color: Color.fromARGB(255, 179, 176, 173), fontFamily: "SF Bold", fontSize: 16),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Icon(Icons.radio_button_unchecked, color: Color.fromARGB(255, 179, 176, 173)),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text(
                                        "Người nhận đổi địa chỉ giao hàng",
                                        style: TextStyle(color: Color.fromARGB(255, 179, 176, 173), fontFamily: "SF Bold", fontSize: 16),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Icon(Icons.radio_button_unchecked, color: Color.fromARGB(255, 179, 176, 173)),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text(
                                        "Hàng hóa không như người nhận yêu cầu",
                                        style: TextStyle(color: Color.fromARGB(255, 179, 176, 173), fontFamily: "SF Bold", fontSize: 16),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Icon(Icons.radio_button_unchecked, color: Color.fromARGB(255, 179, 176, 173)),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text(
                                        "Sai tiền thu hộ COD",
                                        style: TextStyle(color: Color.fromARGB(255, 179, 176, 173), fontFamily: "SF Bold", fontSize: 16),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Icon(Icons.radio_button_unchecked, color: Color.fromARGB(255, 179, 176, 173)),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text(
                                        "Người nhận đổi ý",
                                        style: TextStyle(color: Color.fromARGB(255, 179, 176, 173), fontFamily: "SF Bold", fontSize: 16),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Icon(Icons.radio_button_unchecked, color: Color.fromARGB(255, 179, 176, 173)),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text(
                                        "Không được kiểm/thử hàng",
                                        style: TextStyle(color: Color.fromARGB(255, 179, 176, 173), fontFamily: "SF Bold", fontSize: 16),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Icon(Icons.radio_button_unchecked, color: Color.fromARGB(255, 179, 176, 173)),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text(
                                        "Người nhận không đặt hàng, đơn trùng",
                                        style: TextStyle(color: Color.fromARGB(255, 179, 176, 173), fontFamily: "SF Bold", fontSize: 16),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Icon(Icons.radio_button_unchecked, color: Color.fromARGB(255, 179, 176, 173)),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text(
                                        "Hàng hóa hư hỏng",
                                        style: TextStyle(color: Color.fromARGB(255, 179, 176, 173), fontFamily: "SF Bold", fontSize: 16),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Icon(Icons.radio_button_unchecked, color: Color.fromARGB(255, 179, 176, 173)),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text(
                                        "Hàng hóa thất lạc",
                                        style: TextStyle(color: Color.fromARGB(255, 179, 176, 173), fontFamily: "SF Bold", fontSize: 16),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Icon(Icons.radio_button_unchecked, color: Color.fromARGB(255, 179, 176, 173)),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text(
                                        "Người nhận không đủ tiền thanh toán",
                                        style: TextStyle(color: Color.fromARGB(255, 179, 176, 173), fontFamily: "SF Bold", fontSize: 16),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Icon(Icons.radio_button_unchecked, color: Color.fromARGB(255, 179, 176, 173)),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    child: Row(children: [
                                      Text(
                                        "Bất đồng ngoại ngữ",
                                        style: TextStyle(color: Color.fromARGB(255, 179, 176, 173), fontFamily: "SF Bold", fontSize: 16),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5, right: 5, bottom: 15),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: MaterialColors.primary,
                            border: Border.all(color: Color.fromRGBO(200, 200, 200, 1)),
                          ),
                          child: Container(
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _modalRateSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(55),
                ),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                          Text(
                            "Vui lòng đánh giá khách hàng này",
                            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontFamily: "SF Bold", fontSize: 15),
                          ),
                        ]),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                          Icon(
                            Icons.star_rate,
                            color: Colors.yellow,
                            size: 50,
                          ),
                          Icon(
                            Icons.star_rate,
                            color: Colors.yellow,
                            size: 50,
                          ),
                          Icon(
                            Icons.star_rate,
                            color: Colors.yellow,
                            size: 50,
                          ),
                          Icon(
                            Icons.star_rate,
                            color: Colors.yellow,
                            size: 50,
                          ),
                          Icon(
                            Icons.star_rate,
                            color: Colors.yellow,
                            size: 50,
                          ),
                        ]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tốt",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontFamily: "SF Bold", fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5, right: 5, bottom: 15),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: MaterialColors.primary,
                            border: Border.all(color: Color.fromRGBO(200, 200, 200, 1)),
                          ),
                          child: Container(
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 20, bottom: 5),
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
                                Icon(
                                  Icons.phone_in_talk,
                                  size: 24,
                                  color: Color.fromRGBO(100, 100, 100, 1),
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
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: MaterialColors.secondary),
                                    width: 25,
                                    height: 25,
                                    child: Icon(Icons.location_on, color: Colors.white, size: 18),
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
                                    height: 35,
                                    width: 35,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://firebasestorage.googleapis.com/v0/b/deliveryfood-9c436.appspot.com/o/icon%2Froom-service.png?alt=media&token=67d36528-b39c-4acc-bfb2-96cf318ddf39"),
                                  ),
                                ),
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
                                      "Thu tiền mặt",
                                      style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Bold", fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "₫ 70.000",
                                      style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Bold", fontSize: 16),
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
                                FloatingActionButton(
                                  onPressed: () {
                                    _modalCancelSheetMenu();
                                  },
                                  child: Icon(
                                    Icons.cancel_outlined,
                                    color: Color.fromARGB(255, 221, 45, 45),
                                    size: 30,
                                  ),
                                  backgroundColor: Colors.white,
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
                          outerColor: Colors.green[400],
                          innerColor: Color.fromRGBO(10, 158, 36, 1),
                          // text: "Chấp nhận" + ,
                          text: "Hoàn thành đơn hàng",
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
                                //Navigator.pop(context),
                                _modalRateSheetMenu()
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
