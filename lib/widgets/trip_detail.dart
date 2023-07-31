// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:slide_to_act/slide_to_act.dart';
// import 'package:vh_shipper_app/Colors/color.dart';
// import 'package:vh_shipper_app/Json/constrain.dart';
// import 'package:vh_shipper_app/apis/apiServices.dart';
// import 'package:vh_shipper_app/models/EdgeModel.dart';
// import 'package:vh_shipper_app/models/MessageEdgeModel.dart';
// import 'package:vh_shipper_app/pages/list_order_page.dart';
// import 'package:vh_shipper_app/pages/order_detail_page.dart';
// import 'package:vh_shipper_app/provider/appProvider.dart';

// class TripDetail extends StatefulWidget {
//   int status;
//   String routeId;
//   double totalBill;
//   double totalCod;
//   TripDetail(
//       {super.key,
//       required this.status,
//       required this.routeId,
//       required this.totalBill,
//       required this.totalCod});

//   @override
//   State<TripDetail> createState() => _TripDetailState();
// }

// pointPickup(EdgeModel edge, index) {
//   getStatusTrip(status) {
//     if (status == StatusEdge.done) {
//       return "Hoàn thành";
//     } else if (status == StatusEdge.todo) {
//       return "Đang thực hiện";
//     } else {
//       return "Chưa làm";
//     }
//   }

//   Color getColorStatusTrip(status) {
//     if (status == StatusEdge.done) {
//       return Colors.green;
//     } else if (status == StatusEdge.todo) {
//       return MaterialColors.primary;
//     } else {
//       return Color.fromRGBO(180, 180, 180, 1);
//     }
//   }

//   return Container(
//     margin: EdgeInsets.only(right: 10, top: 5, bottom: 5, left: 10),
//     padding: EdgeInsets.all(10),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(5),
//       color: Colors.white,
//       boxShadow: <BoxShadow>[
//         BoxShadow(
//             color: Colors.grey.shade200,
//             offset: const Offset(2, 4),
//             blurRadius: 5,
//             spreadRadius: 2)
//       ],
//     ),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//           Row(
//             children: [
//               Container(
//                 padding:
//                     EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(3),
//                     border:
//                         Border.all(color: Color.fromRGBO(230, 230, 230, 1))),
//                 child: Text(alphabet[index],
//                     style: TextStyle(fontSize: 14, fontFamily: "SF SemiBold")),
//               ),
//               SizedBox(width: 5),
//               Container(
//                 padding:
//                     EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(3),
//                   color: getColorStatusTrip(edge.status),
//                   border: Border.all(color: getColorStatusTrip(edge.status)),
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(Icons.podcasts, size: 14, color: Colors.white),
//                     SizedBox(width: 7),
//                     Text(
//                       getStatusTrip(edge.status),
//                       style: TextStyle(
//                           fontFamily: "SF Medium",
//                           fontSize: 13,
//                           color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Text(
//             "${edge.orderNum} đơn hàng",
//             style: TextStyle(
//                 fontFamily: "SF Regular",
//                 fontSize: 15,
//                 color: Color.fromRGBO(150, 150, 150, 1)),
//           ),
//         ]),
//         SizedBox(
//           height: kSpacingUnit * 1,
//         ),
//         SizedBox(
//           height: kSpacingUnit * .5,
//         ),
//         Container(
//           child: Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   "${edge.buildingName} Vinhome Grand Park, Quận 9",
//                   style: TextStyle(fontFamily: "SF Medium", fontSize: 16),
//                 ),
//               )
//             ],
//           ),
//         ),
//         SizedBox(
//           height: kSpacingUnit * .5,
//         ),
//       ],
//     ),
//   );
// }

// pointDelivery(index) {
//   return Container(
//     margin: EdgeInsets.only(right: 10, top: 5, bottom: 5, left: 10),
//     padding: EdgeInsets.all(10),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(5),
//       color: Colors.white,
//       boxShadow: <BoxShadow>[
//         BoxShadow(
//             color: Colors.grey.shade200,
//             offset: const Offset(2, 4),
//             blurRadius: 5,
//             spreadRadius: 2)
//       ],
//     ),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(children: [
//           Container(
//             padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(3),
//                 border: Border.all(color: Color.fromRGBO(230, 230, 230, 1))),
//             child: Text(index,
//                 style: TextStyle(fontSize: 14, fontFamily: "SF SemiBold")),
//           ),
//           SizedBox(width: 5),
//           Container(
//             padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(3),
//               color: MaterialColors.primary,
//               border: Border.all(color: MaterialColors.primary),
//             ),
//             child: Row(
//               children: [
//                 Icon(Icons.podcasts, size: 14, color: Colors.white),
//                 Text(
//                   "  Điểm giao hàng",
//                   style: TextStyle(
//                       fontFamily: "SF Medium",
//                       fontSize: 13,
//                       color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ]),
//         SizedBox(
//           height: kSpacingUnit * 1,
//         ),
//         Container(
//           child: Row(
//             children: [
//               Text(
//                 "Trà sữa 5 Ngon",
//                 style: TextStyle(fontFamily: "SF Medium", fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: kSpacingUnit * .5,
//         ),
//         Text(
//           "S5.05, Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9",
//           style: TextStyle(
//               fontFamily: "SF Regular",
//               fontSize: 15,
//               color: Color.fromRGBO(150, 150, 150, 1)),
//         ),
//       ],
//     ),
//   );
// }

// total_order(totalBill, totalCod) {
//   final currencyFormatter = NumberFormat('#,##0', 'ID');
//   return Container(
//     padding: EdgeInsets.only(top: 30, bottom: 15, left: 15, right: 15),
//     color: Colors.white,
//     child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Column(
//             children: [
//               Text(
//                 "Tổng phí".toUpperCase(),
//                 style: TextStyle(
//                   fontFamily: "SF SemiBold",
//                   fontSize: 14,
//                   color: Color.fromRGBO(170, 170, 170, 1),
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 "đ${currencyFormatter.format((totalBill!).toInt()).toString()}",
//                 style: TextStyle(
//                   fontFamily: "SF SemiBold",
//                   fontSize: 17,
//                   color: MaterialColors.primary,
//                 ),
//               )
//             ],
//           ),
//           Column(
//             children: [
//               Text(
//                 "Tiền ứng tối thiểu".toUpperCase(),
//                 style: TextStyle(
//                   fontFamily: "SF SemiBold",
//                   fontSize: 14,
//                   color: Color.fromRGBO(170, 170, 170, 1),
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 "đ${currencyFormatter.format((totalCod!).toInt()).toString()}",
//                 style: TextStyle(
//                   fontFamily: "SF SemiBold",
//                   fontSize: 17,
//                   color: MaterialColors.black,
//                 ),
//               )
//             ],
//           ),
//         ]),
//   );
// }

// TabBar get _tabBar => TabBar(
//       labelColor: MaterialColors.primary,
//       unselectedLabelColor: Colors.black45,
//       tabs: [
//         Tab(
//           child: Container(
//             padding: EdgeInsets.only(top: 3),
//             width: 85,
//             child: Text(
//               "Điểm đến",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontFamily: "SF SemiBold",
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//         Tab(
//           child: Container(
//             padding: EdgeInsets.only(top: 3),
//             width: 85,
//             child: Text(
//               "Đơn hàng",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontFamily: "SF SemiBold",
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );

// class _TripDetailState extends State<TripDetail> with TickerProviderStateMixin {
//   MessageEdgeModel messageEdgeModel = MessageEdgeModel();
//   List<EdgeModel> listEdge = [];
//   bool isLoading = true;
//   bool isLoadingSubmit = false;
//   hanldeAcceptRoute(routeId, shipId) {
//     setState(() {
//       isLoadingSubmit = true;
//     });
//     String statusCode = "";
//     ApiServices.postAcceptRoute(routeId, shipId)
//         .then((value) => {
//               statusCode = value,
//               if (statusCode == "Successful")
//                 {
//                   setState(() => {widget.status = 2}),
//                   hanldeGetListEdge(widget.routeId),
//                   Fluttertoast.showToast(
//                       msg: "Nhận chuyến hàng thành công",
//                       toastLength: Toast.LENGTH_SHORT,
//                       gravity: ToastGravity.TOP,
//                       timeInSecForIosWeb: 1,
//                       backgroundColor: Colors.green,
//                       textColor: Colors.white,
//                       fontSize: 16.0)
//                 }
//               else
//                 {
//                   dialog(),
//                   setState(() {
//                     isLoading = false;
//                     isLoadingSubmit = false;
//                   })
//                 },
//             })
//         .catchError((onError) => {
//               print("onError: " + onError.toString()),
//               setState(() {
//                 isLoading = false;
//               })
//             });
//   }

//   dialog() {
//     return showDialog<String>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         titlePadding: EdgeInsets.only(bottom: 0, top: 20),
//         // title: const Text(
//         //   'Đã xảy ra lỗi gì đó!!',
//         //   textAlign: TextAlign.center,
//         //   style: TextStyle(
//         //       color: Colors.black,
//         //       fontFamily: "SF Bold",
//         //       fontSize: 18),
//         // ),
//         actions: <Widget>[
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image(
//                 // color:25olors.red,
//                 height: 40,
//                 width: 40,
//                 fit: BoxFit.cover,
//                 image: NetworkImage(
//                     "https://cdn-icons-png.flaticon.com/512/2058/2058197.png"),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Đã xảy ra lỗi gì đó!!',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     color: Color.fromRGBO(120, 120, 120, 1),
//                     fontFamily: "SF Regular",
//                     fontSize: 18),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             padding: EdgeInsets.all(5),
//             child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: SizedBox(
//                       height: 40,
//                       child: ElevatedButton(
//                         child: const Text(
//                           "Quay lại",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontFamily: "SF SemiBold",
//                               fontSize: 16),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           primary: Color.fromRGBO(239, 81, 58, 1),
//                           textStyle: TextStyle(color: Colors.white),
//                           shadowColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                         ),
//                         onPressed: () => {
//                           Navigator.pop(context),
//                         },
//                       ),
//                     ),
//                   )
//                 ]),
//           )
//         ],
//       ),
//     ).then((value) => {
//           Navigator.pop(context),
//         });
//   }

//   hanldeGetListEdge(String id) {
//     ApiServices.getListEdge(id)
//         .then((value) => {
//               messageEdgeModel = value,
//               if (messageEdgeModel.statusCode == "Successful")
//                 {
//                   listEdge = messageEdgeModel.data!
//                       .map((item) => EdgeModel.fromJson(item))
//                       .toList(),
//                 }
//               else
//                 {dialog()},
//               setState(() {
//                 isLoading = false;
//                 isLoadingSubmit = false;
//               })
//             })
//         .catchError((onError) => {print(onError)});
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     hanldeGetListEdge(widget.routeId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var shipperId = context.read<AppProvider>().getUserId;
//     return Consumer<AppProvider>(builder: (context, provider, child) {
//       return DefaultTabController(
//         initialIndex: 0,
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//               centerTitle: true,
//               backgroundColor: MaterialColors.primary,
//               title: Text(
//                 "Chi tiết chuyến hàng",
//                 style: TextStyle(
//                     color: MaterialColors.white, fontFamily: "SF Bold"),
//               ),
//               bottom: PreferredSize(
//                 preferredSize: _tabBar.preferredSize,
//                 child: ColoredBox(
//                   color: Colors.white,
//                   child: _tabBar,
//                 ),
//               )),
//           body: TabBarView(children: [
//             Stack(
//               children: [
//                 Container(
//                     padding: EdgeInsets.only(bottom: 65),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           total_order(widget.totalBill, widget.totalCod),
//                           // Container(
//                           //   width: MediaQuery.of(context).size.width,
//                           //   padding: EdgeInsets.only(
//                           //     bottom: 15,
//                           //   ),
//                           //   color: Colors.white,
//                           //   child: Row(
//                           //       crossAxisAlignment: CrossAxisAlignment.center,
//                           //       mainAxisAlignment: MainAxisAlignment.center,
//                           //       children: [
//                           //         Text(
//                           //           "TỔNG ĐIỂM ĐẾN: ",
//                           //           style: TextStyle(
//                           //               color: Color.fromRGBO(170, 170, 170, 1),
//                           //               fontSize: 14,
//                           //               fontFamily: "SF SemiBold"),
//                           //         ),
//                           //         Text(
//                           //           "5",
//                           //           style: TextStyle(
//                           //               color: MaterialColors.black,
//                           //               fontSize: 16,
//                           //               fontFamily: "SF SemiBold"),
//                           //         )
//                           //       ]),
//                           // ),
//                           SizedBox(
//                             height: kSpacingUnit * 1.5,
//                           ),
//                           ...listEdge.map((item) {
//                             var index = listEdge.indexOf(item);
//                             return InkWell(
//                               child: pointPickup(item, index),
//                               onTap: () {
//                                 if (widget.status == 2) {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => OrderDetailPage(
//                                               edgeId: item.id!,
//                                               building: item.buildingName!,
//                                               alphabet: alphabet[index],
//                                               statusEdge: item.status!)));
//                                 }
//                               },
//                             );
//                           }).toList(),

//                           SizedBox(
//                             height: kSpacingUnit * 1,
//                           ),
//                         ],
//                       ),
//                     )),
//                 if (isLoading)
//                   Positioned(
//                     child: Container(
//                       // color: Colors.white.withOpacity(0.5),
//                       child: SpinKitDualRing(
//                         color: MaterialColors.primary,
//                         size: 40.0,
//                         lineWidth: 6,
//                       ),
//                     ),
//                   ),
//                 // Positioned(
//                 //     bottom: 0,
//                 //     child: Container(
//                 //         decoration: BoxDecoration(color: Colors.white),
//                 //         padding: EdgeInsets.only(
//                 //             left: 15, right: 15, top: 10, bottom: 10),
//                 //         width: MediaQuery.of(context).size.width,
//                 //         child: Container(
//                 //           height: 45,
//                 //           child: ElevatedButton(
//                 //             child: Text(
//                 //               "Nhận chuyến hàng",
//                 //               style: TextStyle(
//                 //                   color: Colors.white,
//                 //                   fontFamily: "SF Bold",
//                 //                   fontSize: 16),
//                 //             ),
//                 //             style: ElevatedButton.styleFrom(
//                 //               primary: MaterialColors.primary,
//                 //               textStyle: TextStyle(color: Colors.white),
//                 //               shadowColor: Colors.white,
//                 //               shape: RoundedRectangleBorder(
//                 //                 borderRadius: BorderRadius.circular(8),
//                 //               ),
//                 //             ),
//                 //             onPressed: () => {},
//                 //           ),
//                 //         ))),

//                 if (widget.status == 1)
//                   Positioned(
//                       bottom: 0,
//                       child: Container(
//                           // height: 70,
//                           decoration: BoxDecoration(color: Colors.white),
//                           padding: EdgeInsets.only(
//                               left: 15, right: 15, top: 10, bottom: 10),
//                           width: MediaQuery.of(context).size.width,
//                           child: Center(
//                             child: SlideAction(
//                               alignment: Alignment.bottomCenter,
//                               textStyle: TextStyle(
//                                   fontSize: 18,
//                                   fontFamily: "SF Bold",
//                                   color: Colors.white),
//                               // innerColor: Color.fromRGBO(219, 98, 71, 1),
//                               outerColor: Color.fromARGB(255, 12, 120, 209),
//                               innerColor: MaterialColors.secondary,
//                               // text: "Chấp nhận" + ,
//                               text: "Nhận chuyến hàng",
//                               height: 50,
//                               sliderButtonIconSize: 35,
//                               sliderRotate: false,
//                               borderRadius: 10,
//                               sliderButtonIconPadding: 13,
//                               submittedIcon: Icon(
//                                 Icons.check,
//                                 color: Colors.white,
//                               ),
//                               sliderButtonYOffset: -8,
//                               sliderButtonIcon: Icon(
//                                 Icons.arrow_forward,
//                                 color: Colors.white,
//                               ),
//                               onSubmit: () {
//                                 Future.delayed(
//                                   Duration(milliseconds: 200),
//                                   () => {
//                                     // Navigator.pop(context),

//                                     hanldeAcceptRoute(widget.routeId, shipperId)

//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(
//                                     //     builder: (context) => OrderDetailPage(
//                                     //         status: 2,
//                                     //         statusEdge: StatusEdge.done),
//                                     //   ),
//                                     // )
//                                   },
//                                 );
//                               },
//                             ),
//                           )))
//                 else
//                   Positioned(
//                       bottom: 0,
//                       child: Container(
//                           decoration: BoxDecoration(color: Colors.white),
//                           padding: EdgeInsets.only(
//                               left: 15, right: 15, top: 10, bottom: 10),
//                           width: MediaQuery.of(context).size.width,
//                           child: Container(
//                             height: 45,
//                             child: ElevatedButton(
//                               child: Text(
//                                 "Xem lộ trình hiện tại",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: "SF Bold",
//                                     fontSize: 16),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 primary: MaterialColors.primary,
//                                 textStyle: TextStyle(color: Colors.black),
//                                 shadowColor: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                               ),
//                               onPressed: () => {},
//                             ),
//                           ))),
//                 if (isLoadingSubmit)
//                   Positioned(
//                     child: Container(
//                       color: Colors.white.withOpacity(0.5),
//                       child: SpinKitDualRing(
//                         color: MaterialColors.primary,
//                         size: 50.0,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//             Stack(
//               children: [
//                 ListOrderPage(
//                     totalBill: widget.totalBill, totalCod: widget.totalCod),
//                 if (widget.status == 1)
//                   Positioned(
//                       bottom: 0,
//                       child: Container(
//                           // height: 70,
//                           decoration: BoxDecoration(color: Colors.white),
//                           padding: EdgeInsets.only(
//                               left: 15, right: 15, top: 10, bottom: 10),
//                           width: MediaQuery.of(context).size.width,
//                           child: Center(
//                             child: SlideAction(
//                               alignment: Alignment.bottomCenter,
//                               textStyle: TextStyle(
//                                   fontSize: 18,
//                                   fontFamily: "SF Bold",
//                                   color: Colors.white),
//                               // innerColor: Color.fromRGBO(219, 98, 71, 1),
//                               outerColor: Color.fromARGB(255, 12, 120, 209),
//                               innerColor: MaterialColors.secondary,
//                               // text: "Chấp nhận" + ,
//                               text: "Nhận chuyến hàng",
//                               height: 50,
//                               sliderButtonIconSize: 35,
//                               sliderRotate: false,
//                               borderRadius: 10,
//                               sliderButtonIconPadding: 13,
//                               submittedIcon: Icon(
//                                 Icons.check,
//                                 color: Colors.white,
//                               ),
//                               sliderButtonYOffset: -8,
//                               sliderButtonIcon: Icon(
//                                 Icons.arrow_forward,
//                                 color: Colors.white,
//                               ),
//                               onSubmit: () {
//                                 Future.delayed(
//                                   Duration(milliseconds: 200),
//                                   () => {
//                                     Navigator.pop(context),
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(
//                                     //     builder: (context) => OrderDetailPage(
//                                     //         status: 2,
//                                     //         statusEdge: StatusEdge.done),
//                                     //   ),
//                                     // )
//                                   },
//                                 );
//                               },
//                             ),
//                           )))
//                 else
//                   Positioned(
//                       bottom: 0,
//                       child: Container(
//                           decoration: BoxDecoration(color: Colors.white),
//                           padding: EdgeInsets.only(
//                               left: 15, right: 15, top: 10, bottom: 10),
//                           width: MediaQuery.of(context).size.width,
//                           child: Container(
//                             height: 45,
//                             child: ElevatedButton(
//                               child: Text(
//                                 "Xem lộ trình hiện tại",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: "SF Bold",
//                                     fontSize: 16),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 primary: MaterialColors.primary,
//                                 textStyle: TextStyle(color: Colors.black),
//                                 shadowColor: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                               ),
//                               onPressed: () => {},
//                             ),
//                           ))),
//                 if (isLoadingSubmit)
//                   Positioned(
//                     child: Container(
//                       color: Colors.white.withOpacity(0.5),
//                       child: SpinKitDualRing(
//                         color: MaterialColors.primary,
//                         size: 50.0,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ]),
//         ),
//       );
//     });
//   }
// }
