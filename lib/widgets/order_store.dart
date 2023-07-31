import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:vh_shipper_app/Json/constrain.dart';
import 'package:vh_shipper_app/apis/apiServices.dart';
import 'package:vh_shipper_app/models/MessageEdgeModel.dart';
import 'package:vh_shipper_app/models/OrderEdgeModel.dart';
import 'package:vh_shipper_app/provider/appProvider.dart';
import 'package:vh_shipper_app/widgets/accordion_order.dart';
import 'package:vh_shipper_app/widgets/order_Item.dart';

class OrderStore extends StatefulWidget {
  int statusEdge;
  String building;
  Function callbackLoading;
  List<OrderEdgeModel> orderEdgeList;
  OrderStore({Key? key, required this.statusEdge, required this.orderEdgeList, required this.building, required this.callbackLoading}) : super(key: key);

  @override
  _OrderStoreState createState() => _OrderStoreState();
}

class _OrderStoreState extends State<OrderStore> {
  int indexOpen = -1;
  double totalCod = 0;
  double totalReceive = 0;
  final currencyFormatter = NumberFormat('#,##0', 'ID');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool check = false;
    widget.orderEdgeList.forEach((element) {
      if (element.actionStatus == StatusOrderAction.todo && !check) {
        setState(() {
          indexOpen = widget.orderEdgeList.indexOf(element);
        });
        check = true;
      }
      if (element.actionType == OrderAction.pickupStore) {
        setState(() {
          totalCod = totalCod + element.total!;
        });
      } else if (element.actionType == OrderAction.deliveryCus) {
        setState(() {
          totalReceive = totalReceive + element.total!;
        });
      }
    });
  }

  void _updateListOrder(int index) {
    setState(() {
      widget.orderEdgeList[index].actionStatus = 2;
    });
  }

  void _cancelListOrder(int index, String orderActionId, String shipperId, int actionType, String message) {
    setState(() {
      widget.callbackLoading(true);
      Navigator.pop(context);
      Navigator.pop(context);
    });
    // new Timer(
    //     const Duration(seconds: 2),
    //     () => {
    //           setState(() {
    //             // isLoadingButtonCancelDialog = false;
    //             widget.callbackLoading(false);
    //             widget.orderEdgeList[index].actionStatus = 3;
    //           }),
    //           // orderState(() {
    //           //   statusOrder = StatusOrderAction.fail;
    //           // }),
    //         });
    MessageEdgeModel messageEdgeModel;
    ApiServices.orderCancel(orderActionId, shipperId, actionType, message)
        .then((value) => {
              if (value != null)
                {
                  messageEdgeModel = value,
                  if (messageEdgeModel.statusCode == "Successful")
                    {
                      setState(() {
                        widget.callbackLoading(false);
                        widget.orderEdgeList[index].actionStatus = 3;
                      }),
                    }
                  else
                    {
                      setState(() {
                        widget.callbackLoading(false);
                      }),
                    },
                }
              else
                {
                  setState(() {
                    widget.callbackLoading(false);
                  }),
                }
            })
        .catchError((onError) => {
              print("onError: " + onError.toString()),
              setState(() {
                widget.callbackLoading(false);
              }),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Image(
                  //   // color:25olors.red,
                  //   height: 25,
                  //   width: 25,
                  //   fit: BoxFit.cover,
                  //   image: NetworkImage(
                  //       "https://cdn-icons-png.flaticon.com/512/1532/1532692.png"),
                  // ),
                  Image(
                    // color:25olors.red,
                    height: 25,
                    width: 25,
                    fit: BoxFit.cover,
                    image: NetworkImage("https://cdn-icons-png.flaticon.com/512/3788/3788029.png"),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            "Tòa ${widget.building}",
                            style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Bold", fontSize: 18),
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          child: Text(
                            "${widget.building}, Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9",
                            style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Ruglar", height: 1.3, fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Container(
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.only(
                        //           topLeft: Radius.circular(10),
                        //           bottomLeft: Radius.circular(10),
                        //           topRight: Radius.circular(10),
                        //           bottomRight: Radius.circular(10),
                        //         ),
                        //         border: Border.all(
                        //             color: Color.fromRGBO(230, 230, 230, 1),
                        //             width: 1)),
                        //     width: 170,
                        //     padding: EdgeInsets.only(
                        //         left: 5, right: 5, top: 5, bottom: 5),
                        //     child: InkWell(
                        //       onTap: () {
                        //         _makePhoneCall("09873782823");
                        //       },
                        //       child: Row(
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Icon(Icons.phone_rounded,
                        //               size: 24, color: MaterialColors.black),
                        //           SizedBox(
                        //             width: 15,
                        //           ),
                        //           Text(
                        //             "Gọi cho nhà hàng",
                        //             style: const TextStyle(
                        //                 color: MaterialColors.black,
                        //                 fontFamily: "SF Medium",
                        //                 fontSize: 15),
                        //           )
                        //         ],
                        //       ),
                        //     ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Container(
            //     color: MaterialColors.grey, padding: EdgeInsets.only(top: 10)),
            // Container(
            //   padding: EdgeInsets.all(15),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Container(
            //         width: 25,
            //         height: 25,
            //         margin: const EdgeInsets.only(right: 15),
            //         child: ClipRRect(
            //             borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(50),
            //               bottomLeft: Radius.circular(50),
            //               topRight: Radius.circular(50),
            //               bottomRight: Radius.circular(50),
            //             ),

            //             // padding: const EdgeInsets.only(right: 15, left: 0),
            //             child: Image(
            //               // color:25olors.red,
            //               height: 25,
            //               width: 25,
            //               fit: BoxFit.cover,
            //               image: NetworkImage(
            //                   "https://firebasestorage.googleapis.com/v0/b/deliveryfood-9c436.appspot.com/o/icon%2Fcutlery.png?alt=media&token=18690a73-6b12-40b6-a055-3c212ebcdad4"),
            //             )),
            //       ),
            //       Expanded(
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   "Đặt bởi",
            //                   style: const TextStyle(
            //                       color: Color.fromRGBO(100, 100, 100, 1),
            //                       fontFamily: "SF Regular",
            //                       fontSize: 16),
            //                 ),
            //                 SizedBox(
            //                   height: 5,
            //                 ),
            //                 Text(
            //                   "Văn Dương",
            //                   style: const TextStyle(
            //                       color: MaterialColors.black,
            //                       fontFamily: "SF Bold",
            //                       fontSize: 16),
            //                 ),
            //               ],
            //             ),
            //             InkWell(
            //               onTap: () {
            //                 _makePhoneCall("09873782823");
            //               },
            //               child: Icon(
            //                 Icons.phone_in_talk,
            //                 size: 24,
            //                 color: Color.fromRGBO(100, 100, 100, 1),
            //               ),
            //             )
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.only(left: 15, right: 15),
            //   decoration: const BoxDecoration(
            //       border: Border(
            //           bottom: BorderSide(
            //               color: Color.fromRGBO(230, 230, 230, 1), width: 1))),
            // ),
            Consumer<AppProvider>(builder: (context, provider, child) {
              var shipperId = context.read<AppProvider>().getUserId;
              return Container(
                child: Column(children: [
                  // note(),
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
                                image: NetworkImage("https://cdn-icons-png.flaticon.com/512/4507/4507529.png"),
                              )),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text("Danh sách đơn", style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Bold", fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  if (widget.orderEdgeList.isNotEmpty)
                    ...widget.orderEdgeList.map((item) {
                      var index = widget.orderEdgeList.indexOf(item);
                      if (item.paymentType == 1) {
                        item.shipCost = 0;
                      }
                      return Container(
                        margin: EdgeInsets.only(top: 10, bottom: 5),
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Color.fromRGBO(200, 200, 200, 1))),
                          child: AccordionOrder(
                            open: index == indexOpen ? true : false,
                            status: getAccordionOrder(item.actionStatus),
                            // item.actionStatus, item.actionType!, index, item.orderId!, item.total!, item.shipCost!, item.orderDetailActions!, item.note!, item.phone ?? "", item.name!,
                            //     shipperId, item.actionId!, item.paymentType!
                            content: OrderItem(
                                orderEdgeList: widget.orderEdgeList,
                                status: item.actionStatus!,
                                statusEdge: widget.statusEdge,
                                callback: _updateListOrder,
                                callbackCancel: _cancelListOrder,
                                segment: item.actionType!,
                                index: index,
                                orderId: item.orderId!,
                                total: item.total!,
                                shipCost: item.shipCost!,
                                listProduct: item.orderDetailActions!,
                                note: item.note!,
                                phone: item.phone ?? "",
                                name: item.name!,
                                shipperId: shipperId,
                                orderActionId: item.actionId!,
                                paymentType: item.paymentType!),
                            title: item.name.toString(),
                          ),
                        ),
                      );
                    }).toList(),

                  SizedBox(
                    height: 15,
                  ),
                ]),
              );
            }),

            Container(color: MaterialColors.grey, padding: EdgeInsets.only(top: 10)),
            //thanh toán
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
                          "Thanh toán",
                          style: const TextStyle(color: MaterialColors.black, fontFamily: "SF SemiBold", fontSize: 16),
                        ),
                      ),
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
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "Tổng tiền cần ứng ",
                                style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.error_outline,
                                color: Color.fromARGB(255, 125, 125, 131),
                                size: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "- ₫",
                                style: const TextStyle(color: MaterialColors.orange, fontFamily: "SF Regular", fontSize: 16),
                              ),
                            ),
                            Container(
                              child: Text(
                                "${currencyFormatter.format((totalCod).toInt()).toString()}",
                                style: const TextStyle(color: MaterialColors.orange, fontFamily: "SF Regular", fontSize: 16),
                              ),
                            )
                          ],
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
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "Tổng tiền cần thu ",
                                style: const TextStyle(color: MaterialColors.black, fontFamily: "SF Regular", fontSize: 16),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.error_outline,
                                color: Color.fromARGB(255, 125, 125, 131),
                                size: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "+ ₫",
                                style: const TextStyle(color: MaterialColors.success, fontFamily: "SF Regular", fontSize: 16),
                              ),
                            ),
                            Container(
                              child: Text(
                                "${currencyFormatter.format((totalReceive).toInt()).toString()}",
                                style: const TextStyle(color: MaterialColors.success, fontFamily: "SF Regular", fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            // Container(
            //     decoration: const BoxDecoration(
            //         border: Border(
            //             bottom: BorderSide(
            //                 color: Color.fromRGBO(230, 230, 230, 1),
            //                 width: 1))),
            //     margin: EdgeInsets.only(top: 15, bottom: 30)),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     InkWell(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Icon(
            //             Icons.cancel_outlined,
            //             color: Colors.red[800],
            //           ),
            //           SizedBox(
            //             height: 5,
            //           ),
            //           Text(
            //             "Hủy",
            //             style: TextStyle(
            //                 color: Colors.red[800],
            //                 fontFamily: "SF Regular",
            //                 fontSize: 16),
            //           )
            //         ],
            //       ),
            //       onTap: () {
            //         // showModal();
            //       },
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Icon(Icons.help_outline_rounded,
            //             color: Color.fromRGBO(100, 100, 100, 1)),
            //         SizedBox(
            //           height: 5,
            //         ),
            //         Text(
            //           "Trợ giúp",
            //           style: TextStyle(
            //               color: Color.fromRGBO(100, 100, 100, 1),
            //               fontFamily: "SF Regular",
            //               fontSize: 16),
            //         )
            //       ],
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 100,
            // ),
          ],
        ),
      ],
    );
  }
}
