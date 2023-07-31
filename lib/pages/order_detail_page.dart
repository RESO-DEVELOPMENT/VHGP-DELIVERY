import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:vh_shipper_app/Json/constrain.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vh_shipper_app/apis/apiServices.dart';
import 'package:vh_shipper_app/models/MessageEdgeModel.dart';
import 'package:vh_shipper_app/models/OrderEdgeModel.dart';
import 'package:vh_shipper_app/widgets/order_ship.dart';
import 'package:vh_shipper_app/widgets/order_store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OrderDetailPage extends StatefulWidget {
  String alphabet;
  String edgeId;
  String building;
  int statusEdge;
  OrderDetailPage({super.key, required this.statusEdge, required this.building, required this.edgeId, required this.alphabet});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  MessageEdgeModel messageEdgeModel = MessageEdgeModel();
  bool isLoadingButtonCancelDialog = false;

  List<OrderEdgeModel> orderEdgeList = [];
  bool isLoading = true;
  Color getColorAppBar(status) {
    if (status == StatusEdge.notyet) {
      return Color.fromRGBO(150, 150, 150, 1);
    } else if (status == StatusEdge.todo) {
      return MaterialColors.primary;
    } else {
      return Colors.green;
    }
  }

  hanldeGetEdgeDetail(String edgeId) {
    ApiServices.getEdgeDetail(edgeId)
        .then((value) => {
              messageEdgeModel = value,
              if (messageEdgeModel.statusCode == "Successful")
                {
                  setState(() => {
                        orderEdgeList = messageEdgeModel.data!.map((item) {
                          return OrderEdgeModel.fromJson(item);
                        }).toList(),
                        isLoading = false
                      })
                }
              else
                {
                  setState(() => {isLoading = false})
                }
            })
        .catchError((onError) => {
              print("onError: " + onError.toString()),
              setState(() {
                isLoading = false;
              })
            });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hanldeGetEdgeDetail(widget.edgeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          // backgroundColor: Color.fromARGB(255, 255, 255, 255),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [getColorAppBar(widget.statusEdge), getColorAppBar(widget.statusEdge)]),
            ),
          ),
          titleSpacing: 0,
          toolbarHeight: 65,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Địa điểm ${widget.alphabet}",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "SF Regular",
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.statusEdge == StatusEdge.done ? "Đã hoàn thành" : "Di chuyển đến nơi giao nhận hàng",
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: "SF Bold",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: Stack(alignment: Alignment.center, children: [
          Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Stack(
                children: [
                  if (!isLoading)
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          // header(),
                          OrderStore(
                            building: widget.building,
                            statusEdge: widget.statusEdge,
                            orderEdgeList: orderEdgeList,
                            callbackLoading: (isLoading) {
                              setState(() {
                                isLoadingButtonCancelDialog = isLoading;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  if (isLoading)
                    Positioned(
                      child: Container(
                        // color: Colors.white.withOpacity(0.5),
                        child: SpinKitDualRing(
                          color: MaterialColors.primary,
                          size: 40.0,
                        ),
                      ),
                    ),
                  if (widget.statusEdge == StatusEdge.done)
                    Positioned(
                        bottom: 0,
                        child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                            padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              height: 45,
                              child: ElevatedButton(
                                child: Text(
                                  "Địa điểm tiếp theo",
                                  style: TextStyle(color: Colors.white, fontFamily: "SF Bold", fontSize: 16),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: MaterialColors.primary,
                                  textStyle: TextStyle(color: Colors.black),
                                  shadowColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () => {},
                              ),
                            ))),
                  if (isLoadingButtonCancelDialog)
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        color: Colors.white.withOpacity(0.5),
                        child: SpinKitDualRing(
                          color: MaterialColors.primary,
                          size: 50.0,
                        ),
                      ),
                    ),
                  // else ...[
                  //   Positioned(
                  //       bottom: 0,
                  //       child: Container(
                  //           // height: 70,
                  //           decoration: BoxDecoration(color: Colors.white),
                  //           padding: EdgeInsets.only(
                  //               left: 15, right: 15, top: 10, bottom: 10),
                  //           width: MediaQuery.of(context).size.width,
                  //           child: Center(
                  //             child: SlideAction(
                  //               alignment: Alignment.bottomCenter,
                  //               textStyle: TextStyle(
                  //                   fontSize: 18,
                  //                   fontFamily: "SF Bold",
                  //                   color: Colors.white),
                  //               // innerColor: Color.fromRGBO(219, 98, 71, 1),
                  //               outerColor: Colors.green[500],
                  //               innerColor: Color.fromRGBO(10, 158, 36, 1),
                  //               // text: "Chấp nhận" + ,
                  //               text: "Hoàn thành đơn hàng",
                  //               height: 55,
                  //               sliderButtonIconSize: 35,
                  //               sliderRotate: false,
                  //               borderRadius: 10,
                  //               sliderButtonIconPadding: 15,
                  //               submittedIcon: Icon(
                  //                 Icons.check,
                  //                 color: Colors.white,
                  //               ),
                  //               sliderButtonYOffset: -8,
                  //               sliderButtonIcon: Icon(
                  //                 Icons.arrow_forward,
                  //                 color: Colors.white,
                  //               ),
                  //               onSubmit: () {
                  //                 Future.delayed(
                  //                   Duration(milliseconds: 200),
                  //                   () => {
                  //                     Navigator.pop(context),
                  //                   },
                  //                 );
                  //               },
                  //             ),
                  //           ))),
                  // ]
                ],
              ))
        ]));
  }
}
