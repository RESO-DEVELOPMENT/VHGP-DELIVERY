import 'package:flutter/material.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:intl/intl.dart';

const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);

const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color.fromARGB(255, 255, 190, 105);
const kAccentColorButton = Color.fromARGB(255, 3, 82, 151);

enum StatusAccordionOrder { create, doing, done, fail }

class StatusEdge {
  static const notyet = 1;
  static const todo = 2;
  static const done = 3;
}

class StatusOrderAction {
  static const todo = 1;
  static const done = 2;
  static const fail = 3;
}

class OrderAction {
  static const pickupStore = 1;
  static const deliveryHub = 3;
  static const pickupHub = 2;
  static const deliveryCus = 4;
}

enum StatusHistoryOrder { done, fail }

var alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];

StatusAccordionOrder getAccordionOrder(status) {
  switch (status) {
    case StatusOrderAction.todo:
      return StatusAccordionOrder.create;
    case StatusOrderAction.done:
      return StatusAccordionOrder.done;
    case StatusOrderAction.fail:
      return StatusAccordionOrder.fail;

    default:
      return StatusAccordionOrder.create;
  }
}

Color getColor(status) {
  switch (status) {
    case StatusAccordionOrder.create:
      return const Color.fromRGBO(150, 150, 150, 1);
    case StatusAccordionOrder.doing:
      return MaterialColors.primary;
    case StatusAccordionOrder.done:
      return Colors.green;
    case StatusAccordionOrder.fail:
      return Colors.red;

    default:
      return const Color.fromRGBO(150, 150, 150, 1);
  }
}

List itemsTab = [
  {"icon": Icons.home, "size": 30.0, "label": "Trang chủ"},
  {"icon": Icons.notes_rounded, "size": 22.0, "label": "Đơn hàng"},
  {"icon": Icons.history, "size": 21.0, "label": "Lịch sử"},
  {"icon": Icons.account_balance_wallet_outlined, "size": 24.0, "label": "Giao dịch"},
  {"icon": Icons.account_circle_outlined, "size": 30.0, "label": "Tài khoản"},
];

const kSpacingUnit = 10;

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'SFProText',
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
        color: kLightSecondaryColor,
      ),
  textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: kLightSecondaryColor,
        displayColor: kLightSecondaryColor,
      ),
);

String getIconOrder(modeId) {
  if (modeId == "1") {
    return "assets/images/breakfast.png";
  } else if (modeId == "2") {
    return "assets/images/dicho-active.png";
  } else {
    return "assets/images/giaohang.png";
  }
}

List getMessageCancel(action) {
  switch (action) {
    case OrderAction.pickupStore:
      return MessageCancelStore;
    case OrderAction.deliveryHub:
      return MessageCancelHub;
    case OrderAction.pickupHub:
      return MessageCancelHub;
    case OrderAction.deliveryCus:
      return MessageCancelCustomer;

    default:
      return MessageCancelCustomer;
  }
}

double getSizeDialog(action) {
  switch (action) {
    case OrderAction.pickupStore:
      return 400;
    case OrderAction.deliveryHub:
      return 500;
    case OrderAction.pickupHub:
      return 500;
    case OrderAction.deliveryCus:
      return 700;

    default:
      return 400;
  }
}

List MessageCancelHub = [
  {"id": 1, "message": "Người nhận không nghe máy"},
  {"id": 2, "message": "Thuê bao không liên lạc được"},
  {"id": 3, "message": "Người nhận hẹn lại ngày giao"},
  {"id": 4, "message": "Người nhận hẹn giao lại trong ngày"},
  {"id": 5, "message": "Người nhận đổi địa chỉ giao hàng"},
  {"id": 6, "message": "Hàng hóa không như yêu cầu"},
  {"id": 7, "message": "Người nhận không đặt hàng, đơn trùng"},
  {"id": 8, "message": "Hàng hóa hư hỏng"},
  {"id": 9, "message": "Hàng hóa thất lạc"},
];
List MessageCancelCustomer = [
  {"id": 1, "message": "Người nhận không nghe máy"},
  {"id": 2, "message": "Thuê bao không liên lạc được"},
  {"id": 3, "message": "Sai số điện thoại"},
  {"id": 4, "message": "Người nhận hẹn lại ngày giao"},
  {"id": 5, "message": "Người nhận hẹn giao lại trong ngày"},
  {"id": 6, "message": "Người nhận đổi địa chỉ giao hàng"},
  {"id": 7, "message": "Hàng hóa không như yêu cầu"},
  {"id": 8, "message": "Sai tiền thu hộ COD"},
  {"id": 9, "message": "Người nhận đổi ý"},
  {"id": 10, "message": "Không được kiểm/thử hàng"},
  {"id": 11, "message": "Người nhận không đặt hàng, đơn trùng"},
  {"id": 12, "message": "Hàng hóa hư hỏng"},
  {"id": 13, "message": "Hàng hóa thất lạc"},
  {"id": 14, "message": "Người nhận không đủ tiền thanh toán"},
  {"id": 15, "message": "Bất đồng ngoại ngữ"},
];
List MessageCancelStore = [
  {"id": 1, "message": "Cửa hàng hết món"},
  {"id": 2, "message": "Cửa hàng đã đóng cửa"},
  {"id": 3, "message": "Người nhận không nghe máy"},
  {"id": 4, "message": "Hàng không như yêu cầu"},
  {"id": 5, "message": "Sai tiền thu hộ COD"},
  {"id": 6, "message": "Người nhận đổi ý"},
  {"id": 7, "message": "Người nhận không đặt hàng, đơn trùng"},
];

final kLightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'SF Regular',
    primaryColor: kLightPrimaryColor,
    canvasColor: kLightPrimaryColor,
    backgroundColor: kLightSecondaryColor,
    accentColor: kAccentColor,
    scaffoldBackgroundColor: MaterialColors.grey,
    iconTheme: ThemeData.light().iconTheme.copyWith(
          color: kDarkSecondaryColor,
        ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MaterialColors.primary)),
    )
    // textTheme: ThemeData.light().textTheme.apply(
    //       fontFamily: 'SFProText',
    //       bodyColor: kDarkSecondaryColor,
    //       displayColor: kDarkSecondaryColor,
    //     ),
    );

// List Routes = [
//   {
//     "id": 1,
//     "name": "A",
//     "status": StatusTrip.done,
//     "countOrder": 2,
//     "building": "S5.05, Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9"
//   },
//   {
//     "id": 2,
//     "name": "B",
//     "status": StatusTrip.doing,
//     "countOrder": 3,
//     "building": "S7.05, Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9"
//   },
//   {
//     "id": 3,
//     "name": "C",
//     "status": StatusTrip.create,
//     "countOrder": 3,
//     "building": "S2.05, Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9"
//   },
//   {
//     "id": 4,
//     "name": "D",
//     "status": StatusTrip.create,
//     "countOrder": 1,
//     "building": "S8.05, Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9"
//   },
// ];

class TransactionType {
  static const refund = 1; //hoàn trả
  static const cod = 2; // thu hộ
  static const shippingCost = 3;
  static const recharge = 4; //nạp
  static const withdraw = 5; //rút
}

String getTransactionType(transactionType) {
  switch (transactionType) {
    case TransactionType.refund:
      return "Hoàn trả";
    case TransactionType.cod:
      return "Phí thu hộ khách hàng";
    case TransactionType.shippingCost:
      return "Phí giao hàng";
    case TransactionType.recharge:
      return "Nạp tiền";
    case TransactionType.withdraw:
      return "Rút tiền";
    default:
      return "---";
  }
}

String getTimeTransaction(time) {
  var inputFormat = DateFormat('dd/MM/yyyy');
  var inputDate = inputFormat.parse(time);

  var weekFormat = DateFormat('EEEE');
  var outputWeek = weekFormat.format(inputDate);

  switch (outputWeek) {
    case "Monday":
      outputWeek = "Thứ hai";
      break;
    case "Tuesday":
      outputWeek = "Thứ ba";
      break;
    case "Wednesday":
      outputWeek = "Thứ tư";
      break;
    case "Thursday":
      outputWeek = "Thứ năm";
      break;
    case "Friday":
      outputWeek = "Thứ sáu";
      break;
    case "Saturday":
      outputWeek = "Thứ bảy";
      break;
    case "Sunday":
      outputWeek = "Chủ nhật";
      break;
    default:
  }
  return "$time, $outputWeek";
}

String getDateHistory(time) {
  var inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
  var inputDate = inputFormat.parse(time);
  var outputFormat = DateFormat('HH:mm, dd/MM/yyyy');
  var outputDate = outputFormat.format(inputDate);
  return outputDate.toString();
}

String getDateHistoryToday(time) {
  var inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
  var inputDate = inputFormat.parse(time);
  var outputFormat = DateFormat('HH:mm a');
  var outputDate = outputFormat.format(inputDate);
  return outputDate.toString();
}
