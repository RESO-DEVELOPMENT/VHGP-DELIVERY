// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:vh_shipper_app/Colors/color.dart';
// import 'package:slide_to_act/slide_to_act.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:vh_shipper_app/Json/constrain.dart';
// import 'package:vh_shipper_app/widgets/accordion_order.dart';

// class OrderShip extends StatefulWidget {
//   const OrderShip({Key? key}) : super(key: key);

//   @override
//   _OrderShipState createState() => _OrderShipState();
// }

// class _OrderShipState extends State<OrderShip> {
//   int activeRadio = 0;
//   Future<void> _makePhoneCall(String phoneNumber) async {
//     if (phoneNumber != "") {
//       final Uri launchUri = Uri(
//         scheme: 'tel',
//         path: phoneNumber,
//       );
//       await launchUrl(launchUri);
//     }
//   }

//   service() {
//     return Container(
//         color: Colors.white,
//         child: Container(
//           padding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 10),
//           // height: kSpacingUnit * 10.5,
//           // width: kSpacingUnit * 40,

//           child: Column(
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           // padding: EdgeInsets.only(left: 15),
//                           child: Row(
//                             children: [
//                               Text(
//                                 "Dịch vụ",
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     fontFamily: "SF Medium",
//                                     color: Color.fromRGBO(170, 170, 170, 1)),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           // padding: EdgeInsets.only(right: 15),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Image(
//                                   // color:70olors.red,
//                                   height: 30,
//                                   width: 30,
//                                   fit: BoxFit.cover,
//                                   image: NetworkImage(
//                                       "https://cdn-icons-png.flaticon.com/512/2844/2844235.png")),
//                               SizedBox(
//                                 width: 8,
//                               ),
//                               Text(
//                                 "Siêu tốc",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontFamily: "SF SemiBold",
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: kSpacingUnit * 1,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(
//                                 color: Color.fromRGBO(240, 240, 240, 1)))),
//                   ),
//                   SizedBox(
//                     height: kSpacingUnit * 1.5,
//                   ),
//                   Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           // padding: EdgeInsets.only(left: 15),
//                           child: Row(
//                             children: [
//                               Text(
//                                 "Dịch vụ kèm theo",
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: kSpacingUnit * 1.5,
//                   ),
//                   Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Image(
//                             // color:70olors.red,
//                             height: 25,
//                             width: 25,
//                             fit: BoxFit.cover,
//                             image: NetworkImage(
//                                 "https://cdn-icons-png.flaticon.com/512/1532/1532672.png")),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                             child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               // padding: EdgeInsets.only(left: 30),
//                               child: Text(
//                                 "Giao hàng tận tay",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontFamily: "SF SemiBold",
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               // padding: EdgeInsets.only(right: 30),
//                               child: Text(
//                                 "x1",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontFamily: "SF SemiBold",
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ))
//                       ],
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ));
//   }

//   showModal() {
//     return showModalBottomSheet(
//         isScrollControlled: true,
//         context: context,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(8.0))),
//         builder: (BuildContext context) {
//           return StatefulBuilder(
//               builder: (BuildContext context, StateSetter mystate) {
//             return Container(
//               height: MediaQuery.of(context).size.height * 0.9,
//               width: MediaQuery.of(context).size.width,
//               padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.only(top: 5),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           InkWell(
//                             child: Icon(
//                               Icons.arrow_back_ios,
//                               size: 18,
//                               color: Colors.black87,
//                             ),
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text("Hãy chọn lý do giao hàng thất bại?",
//                               style: const TextStyle(
//                                   fontFamily: "SF Bold",
//                                   fontSize: 18,
//                                   color: Colors.black87)),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(top: 10),
//                     ),
//                     Expanded(
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             ...MessageCancel.map((e) {
//                               return InkWell(
//                                 child: Container(
//                                   padding: EdgeInsets.only(left: 15, right: 15),
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                   ),
//                                   child: Column(
//                                     children: [
//                                       SizedBox(
//                                         height: 15,
//                                       ),
//                                       Container(
//                                         child: Row(
//                                           children: [
//                                             Container(
//                                               child: Row(children: [
//                                                 Icon(
//                                                     activeRadio == e["id"]
//                                                         ? Icons
//                                                             .radio_button_checked
//                                                         : Icons
//                                                             .radio_button_unchecked,
//                                                     size: 18,
//                                                     color: Color.fromRGBO(
//                                                         100, 100, 100, 1)),
//                                               ]),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Container(
//                                               child: Row(children: [
//                                                 Text(
//                                                   e["message"],
//                                                   style: TextStyle(
//                                                       color: Color.fromRGBO(
//                                                           100, 100, 100, 1),
//                                                       fontFamily: "SF Medium",
//                                                       fontSize: 16),
//                                                 ),
//                                               ]),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   mystate(() {
//                                     activeRadio = e["id"];
//                                   });
//                                 },
//                               );
//                             }).toList()
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       color: Colors.white,
//                       padding: EdgeInsets.only(top: 10),
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 45,
//                             margin: EdgeInsets.only(
//                                 left: 15, right: 15, top: 0, bottom: 0),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: MaterialColors.primary,
//                               border: Border.all(
//                                   color: Color.fromRGBO(200, 200, 200, 1)),
//                             ),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   child: Row(children: [
//                                     TextButton(
//                                       child: Text(
//                                         "Xác nhận",
//                                         style: TextStyle(
//                                             color: Color.fromARGB(
//                                                 255, 255, 255, 255),
//                                             fontFamily: "SF Bold",
//                                             fontSize: 16),
//                                       ),
//                                       onPressed: () {},
//                                     ),
//                                   ]),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ]),
//             );
//           });
//         });
//   }

//   dialogOrder() {
//     return showDialog<String>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         insetPadding: EdgeInsets.all(15),
//         actionsPadding:
//             EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 10),
//         titlePadding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
//         title: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'Chi tiết đơn hàng',
//                 style: TextStyle(
//                     color: Colors.black, fontFamily: "SF Bold", fontSize: 18),
//               ),
//               InkWell(
//                 child: Icon(
//                   Icons.close,
//                   size: 20,
//                   color: Colors.black54,
//                 ),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               )
//             ]),
//         actions: <Widget>[
//           Container(
//             // padding: EdgeInsets.all(0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 25,
//                   height: 25,
//                   margin: const EdgeInsets.only(right: 15),
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(50),
//                         bottomLeft: Radius.circular(50),
//                         topRight: Radius.circular(50),
//                         bottomRight: Radius.circular(50),
//                       ),

//                       // padding: const EdgeInsets.only(right: 15, left: 0),
//                       child: Image(
//                         // color:25olors.red,
//                         height: 25,
//                         width: 25,
//                         fit: BoxFit.cover,
//                         image: NetworkImage(
//                             "https://firebasestorage.googleapis.com/v0/b/deliveryfood-9c436.appspot.com/o/icon%2Fcutlery.png?alt=media&token=18690a73-6b12-40b6-a055-3c212ebcdad4"),
//                       )),
//                 ),
//                 Expanded(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Đặt bởi",
//                             style: const TextStyle(
//                                 color: Color.fromRGBO(100, 100, 100, 1),
//                                 fontFamily: "SF Regular",
//                                 fontSize: 16),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             "Văn Dương",
//                             style: const TextStyle(
//                                 color: MaterialColors.black,
//                                 fontFamily: "SF Bold",
//                                 fontSize: 16),
//                           ),
//                         ],
//                       ),
//                       InkWell(
//                         onTap: () {
//                           _makePhoneCall("09873782823");
//                         },
//                         child: Icon(
//                           Icons.phone_in_talk,
//                           size: 24,
//                           color: Color.fromRGBO(100, 100, 100, 1),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 15, bottom: 15),
//             decoration: BoxDecoration(
//                 border: Border(
//                     top: BorderSide(color: Color.fromRGBO(230, 230, 230, 1)))),
//           ),
//           Row(
//             children: [
//               Text(
//                 "Ghi chú khách hàng",
//                 style: const TextStyle(
//                     color: Color.fromRGBO(150, 150, 150, 1),
//                     fontFamily: "SF Regular",
//                     fontSize: 16),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: Color.fromRGBO(240, 240, 240, 1),
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     child: ConstrainedBox(
//                       constraints: BoxConstraints(
//                         minHeight: 32,
//                       ),
//                       child: Text(
//                         "Xin ớt",
//                         style: const TextStyle(
//                             color: MaterialColors.black,
//                             fontFamily: "SF Medium",
//                             fontSize: 16),
//                       ),
//                     )),
//               )
//             ],
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 15, bottom: 15),
//             decoration: BoxDecoration(
//                 border: Border(
//                     top: BorderSide(color: Color.fromRGBO(230, 230, 230, 1)))),
//           ),
//           Row(
//             children: [
//               Text(
//                 "Danh sách món",
//                 style: const TextStyle(
//                     color: Color.fromRGBO(150, 150, 150, 1),
//                     fontFamily: "SF Regular",
//                     fontSize: 16),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             padding: EdgeInsets.only(bottom: 0, top: 0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "1 x",
//                         style: const TextStyle(
//                             color: MaterialColors.black,
//                             fontFamily: "SF Regular",
//                             fontSize: 16),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: Text(
//                           "Kebab Thịt heo",
//                           style: const TextStyle(
//                               color: MaterialColors.black,
//                               fontFamily: "SF Regular",
//                               fontSize: 16),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Text(
//                   "₫ 25.000",
//                   style: const TextStyle(
//                       color: MaterialColors.black,
//                       fontFamily: "SF Regular",
//                       fontSize: 16),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Container(
//             padding: EdgeInsets.only(bottom: 0, top: 0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "1 x",
//                         style: const TextStyle(
//                             color: MaterialColors.black,
//                             fontFamily: "SF Regular",
//                             fontSize: 16),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: Text(
//                           "Kebab Thịt heo đặc biệt có phô mai mai mai",
//                           style: const TextStyle(
//                               color: MaterialColors.black,
//                               fontFamily: "SF Regular",
//                               fontSize: 16),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Text(
//                   "₫ 25.000",
//                   style: const TextStyle(
//                       color: MaterialColors.black,
//                       fontFamily: "SF Regular",
//                       fontSize: 16),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 15, bottom: 15),
//             decoration: BoxDecoration(
//                 border: Border(
//                     top: BorderSide(color: Color.fromRGBO(230, 230, 230, 1)))),
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Thu tiền mặt khách hàng",
//                 style: TextStyle(
//                     color: Color.fromRGBO(150, 150, 150, 1),
//                     fontFamily: "SF Regular",
//                     fontSize: 16),
//               ),
//               Text(
//                 "đ50.000",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontFamily: "SF Semibold",
//                     fontSize: 16),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Tổng cộng",
//                 style: TextStyle(
//                     color: Color.fromRGBO(150, 150, 150, 1),
//                     fontFamily: "SF Regular",
//                     fontSize: 16),
//               ),
//               Text(
//                 "đ50.000",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontFamily: "SF Semibold",
//                     fontSize: 16),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: SizedBox(
//                       height: 40,
//                       child: ElevatedButton(
//                         child: Text(
//                           "Thất bại",
//                           style: TextStyle(
//                               color: Colors.black45,
//                               fontFamily: "SF Medium",
//                               fontSize: 16),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.white,
//                           textStyle: TextStyle(color: Colors.black),
//                           shadowColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5),
//                               side:
//                                   BorderSide(color: Colors.black45, width: 1)),
//                         ),
//                         onPressed: () => {showModal()},
//                       ),
//                     ),
//                   ),
//                   Padding(padding: EdgeInsets.all(7)),
//                   Expanded(
//                     child: SizedBox(
//                       height: 40,
//                       child: ElevatedButton(
//                         child: const Text(
//                           "Thành công",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontFamily: "SF Medium",
//                               fontSize: 16),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           primary: MaterialColors.primary,
//                           textStyle: TextStyle(color: Colors.white),
//                           shadowColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                         ),
//                         onPressed: () => {},
//                       ),
//                     ),
//                   )
//                 ]),
//           )
//         ],
//       ),
//     );
//   }

//   way(status, segment) {
//     return Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(5),
//         ),
//         child: Container(
//           padding: EdgeInsets.only(left: 15, right: 15),
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     border: Border(
//                         top: BorderSide(
//                             color: Color.fromRGBO(220, 220, 220, 1)))),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 15, bottom: 10),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "1 x",
//                             style: const TextStyle(
//                                 color: MaterialColors.black,
//                                 fontFamily: "SF Regular",
//                                 fontSize: 14),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             child: Text(
//                               "Kebab Thịt heo",
//                               style: const TextStyle(
//                                   color: MaterialColors.black,
//                                   fontFamily: "SF Regular",
//                                   fontSize: 14),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Text(
//                       "25.000 ₫",
//                       style: const TextStyle(
//                           color: MaterialColors.black,
//                           fontFamily: "SF Regular",
//                           fontSize: 14),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 10, bottom: 10),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "1 x",
//                             style: const TextStyle(
//                                 color: MaterialColors.black,
//                                 fontFamily: "SF Regular",
//                                 fontSize: 14),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             child: Text(
//                               "Kebab Thịt heo đặc biệt có phô mai mai mai",
//                               style: const TextStyle(
//                                   color: MaterialColors.black,
//                                   fontFamily: "SF Regular",
//                                   fontSize: 14),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Text(
//                       "25.000 ₫",
//                       style: const TextStyle(
//                           color: MaterialColors.black,
//                           fontFamily: "SF Regular",
//                           fontSize: 14),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                   decoration: BoxDecoration(color: Colors.white),
//                   padding: EdgeInsets.only(top: 10, bottom: 10),
//                   width: MediaQuery.of(context).size.width,
//                   child: Row(
//                     children: [
//                       Expanded(
//                           flex: 1,
//                           child: InkWell(
//                             onTap: () {
//                               dialogOrder();
//                             },
//                             child: Container(
//                               height: 40,
//                               child: TextButton(
//                                 child: Text(
//                                   "Xem chi tiết",
//                                   style: TextStyle(
//                                       color: MaterialColors.primary,
//                                       fontFamily: "SF SemiBold",
//                                       fontSize: 15),
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                   primary: MaterialColors.white,
//                                   textStyle:
//                                       TextStyle(color: MaterialColors.primary),
//                                   shadowColor: Colors.white,
//                                   shape: RoundedRectangleBorder(
//                                     side: BorderSide(
//                                         color: MaterialColors.primary),
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                 ),
//                                 onPressed: null,
//                               ),
//                             ),
//                           )),
//                       SizedBox(width: 15),
//                       Expanded(
//                         child: Container(
//                           height: 40,
//                           child: ElevatedButton(
//                             child: Text(
//                               "Đã lấy món",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: "SF SemiBold",
//                                   fontSize: 15),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               primary: MaterialColors.primary,
//                               textStyle: TextStyle(color: Colors.white),
//                               shadowColor: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             onPressed: () => {},
//                           ),
//                         ),
//                         flex: 1,
//                       )
//                     ],
//                   ))
//             ],
//           ),
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           padding: EdgeInsets.all(15),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image(
//                 // color:25olors.red,
//                 height: 25,
//                 width: 25,
//                 fit: BoxFit.cover,
//                 image: NetworkImage(
//                     "https://cdn-icons-png.flaticon.com/512/3788/3788029.png"),
//               ),
//               SizedBox(width: 15),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(),
//                       child: Text(
//                         overflow: TextOverflow.ellipsis,
//                         "Tòa S2.05",
//                         style: const TextStyle(
//                             color: MaterialColors.black,
//                             fontFamily: "SF Bold",
//                             fontSize: 18),
//                         maxLines: 1,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 7,
//                     ),
//                     Container(
//                       child: Text(
//                         "S2.05, Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9",
//                         style: const TextStyle(
//                             color: MaterialColors.black,
//                             fontFamily: "SF Ruglar",
//                             height: 1.3,
//                             fontSize: 14),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//         // Container(
//         //   decoration: const BoxDecoration(
//         //       border: Border(
//         //           bottom: BorderSide(
//         //               color: Color.fromRGBO(230, 230, 230, 1), width: 1))),
//         // ),

//         Container(
//             color: MaterialColors.grey, padding: EdgeInsets.only(top: 10)),
//         service(),
//         Container(
//             color: MaterialColors.grey, padding: EdgeInsets.only(top: 10)),
//         Container(
//           padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 width: 25,
//                 height: 25,
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(50),
//                       bottomLeft: Radius.circular(50),
//                       topRight: Radius.circular(50),
//                       bottomRight: Radius.circular(50),
//                     ),

//                     // padding: const EdgeInsets.only(right: 15, left: 0),
//                     child: Image(
//                       // color:40olors.red,
//                       height: 25,
//                       width: 25,
//                       fit: BoxFit.cover,
//                       image: NetworkImage(
//                           "https://cdn-icons-png.flaticon.com/512/4507/4507529.png"),
//                     )),
//               ),
//               SizedBox(
//                 width: 15,
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 child: Text("Danh sách đơn",
//                     style: const TextStyle(
//                         color: MaterialColors.black,
//                         fontFamily: "SF Bold",
//                         fontSize: 16)),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         Container(
//           margin: EdgeInsets.only(left: 10, right: 10),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//               border: Border.all(color: Color.fromRGBO(200, 200, 200, 1))),
//           child: AccordionOrder(
//             status: StatusAccordionOrder.done,
//             content: way(StatusAccordionOrder.done, 1),
//             title: "#CDCC-000012",
//           ),
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         Container(
//           margin: EdgeInsets.only(left: 10, right: 10),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//               border: Border.all(color: Color.fromRGBO(200, 200, 200, 1))),
//           child: AccordionOrder(
//             status: StatusAccordionOrder.create,
//             content: way(StatusAccordionOrder.create, 1),
//             title: "#CDCC-000013",
//           ),
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         Container(
//             color: MaterialColors.grey, padding: EdgeInsets.only(top: 10)),
//         Container(
//           padding: EdgeInsets.all(15),
//           child: Column(
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     child: Text(
//                       "Thu tiền mặt khách hàng",
//                       style: const TextStyle(
//                           color: MaterialColors.black,
//                           fontFamily: "SF SemiBold",
//                           fontSize: 16),
//                     ),
//                   ),
//                   Container(
//                     child: Text(
//                       "50.000 ₫",
//                       style: const TextStyle(
//                           color: MaterialColors.black,
//                           fontFamily: "SF SemiBold",
//                           fontSize: 16),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               LayoutBuilder(
//                 builder: (BuildContext context, BoxConstraints constraints) {
//                   final boxWidth = constraints.constrainWidth();
//                   const dashWidth = 5.0;
//                   final dashHeight = 1;
//                   final dashCount = (boxWidth / (2 * dashWidth)).floor();
//                   return Flex(
//                     children: List.generate(dashCount, (_) {
//                       return SizedBox(
//                         width: dashWidth,
//                         height: 1,
//                         child: DecoratedBox(
//                             decoration: BoxDecoration(
//                           color: Color.fromRGBO(200, 200, 200, 1),
//                         )),
//                       );
//                     }),
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     direction: Axis.horizontal,
//                   );
//                 },
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               // Row(
//               //   crossAxisAlignment: CrossAxisAlignment.center,
//               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //   children: [
//               //     Text(
//               //       "Phương thức thanh toán",
//               //       style: const TextStyle(
//               //           color: MaterialColors.black,
//               //           fontFamily: "SF Regular",
//               //           fontSize: 16),
//               //     ),
//               //     Text(
//               //       "Tiền mặt",
//               //       style: const TextStyle(
//               //           color: MaterialColors.black,
//               //           fontFamily: "SF Regular",
//               //           fontSize: 16),
//               //     )
//               //   ],
//               // ),
//               // SizedBox(
//               //   height: 15,
//               // ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     child: Text(
//                       "Tài khoản thu hộ",
//                       style: const TextStyle(
//                           color: MaterialColors.black,
//                           fontFamily: "SF Regular",
//                           fontSize: 16),
//                     ),
//                   ),
//                   Container(
//                     child: Text(
//                       "+ 50.000 ₫",
//                       style: const TextStyle(
//                           color: MaterialColors.black,
//                           fontFamily: "SF Regular",
//                           fontSize: 16),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     child: Text(
//                       "Tổng cộng",
//                       style: const TextStyle(
//                           color: Color(0xfff7892b),
//                           fontFamily: "SF Regular",
//                           fontSize: 16),
//                     ),
//                   ),
//                   Container(
//                     child: Text(
//                       "50.000 ₫",
//                       style: const TextStyle(
//                           color: Color(0xfff7892b),
//                           fontFamily: "SF Regular",
//                           fontSize: 16),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Container(
//             decoration: const BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//                         color: Color.fromRGBO(230, 230, 230, 1), width: 1))),
//             margin: EdgeInsets.only(top: 15, bottom: 30)),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.cancel_outlined,
//                   color: Colors.black26,
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   "Hủy",
//                   style: TextStyle(
//                       color: Colors.black26,
//                       fontFamily: "SF Regular",
//                       fontSize: 16),
//                 )
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.help_outline_rounded,
//                     color: Color.fromRGBO(100, 100, 100, 1)),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   "Trợ giúp",
//                   style: TextStyle(
//                       color: Color.fromRGBO(100, 100, 100, 1),
//                       fontFamily: "SF Regular",
//                       fontSize: 16),
//                 )
//               ],
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 100,
//         ),
//       ],
//     );
//   }
// }
