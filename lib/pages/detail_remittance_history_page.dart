import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:vh_shipper_app/Json/constrain.dart';
import 'package:vh_shipper_app/models/TransactionModel.dart';
import 'package:vh_shipper_app/provider/appProvider.dart';
import 'package:intl/intl.dart';

class DetailRemittanceHistory extends StatefulWidget {
  TransactionModel transaction;
  String shipperId;
  String name;
  DetailRemittanceHistory({super.key, required this.transaction, required this.shipperId, required this.name});

  @override
  State<DetailRemittanceHistory> createState() => _DetailRemittanceHistoryState();
}

historyTitle(amount, transactionAction) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Text(
            "SỐ TIỀN GIAO DỊCH",
            style: TextStyle(color: MaterialColors.primary, fontSize: 16, fontFamily: "SF Medium"),
          ),
        ),
        SizedBox(
          height: kSpacingUnit * 1,
        ),
        Container(
          child: Text(
            "${transactionAction == 1 ? "+ " : "-"}$amount VND",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(
          height: kSpacingUnit * 1.5,
        ),
      ],
    ),
  );
}

historyInfor(shipperId, name) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: Text(
                  "Tài khoản giao dịch",
                  style: TextStyle(
                    color: MaterialColors.primary.withOpacity(0.7),
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: kSpacingUnit * 1,
        ),
        Text(
          "$name".toUpperCase(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: "SF SemiBold",
          ),
        ),
        SizedBox(
          height: kSpacingUnit * 0.5,
        ),
        Container(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: Text(
                  shipperId,
                  style: TextStyle(
                    color: Color.fromRGBO(100, 100, 100, 1),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Color.fromRGBO(240, 240, 240, 1), width: 1),
            ),
          ),
          margin: EdgeInsets.only(top: 30),
        ),
      ],
    ),
  );
}

historyTime(date, id, transactionType, status) {
  getTime(date) {
    var inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
    var inputDate = inputFormat.parse(date);
    var formatterDate = DateFormat('HH:mm:ss dd/MM/yyyy');
    String actualDate = formatterDate.format(inputDate);
    return actualDate;
  }

  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    child: Column(
      children: [
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //flex: 6,
                child: Text(
                  "Thời gian thực hiện",
                  style: TextStyle(
                    color: MaterialColors.primary.withOpacity(0.7),
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                //flex: 6,
                child: Text(
                  getTime(date),
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15, fontFamily: "SF Medium"),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: kSpacingUnit * 2.5,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //flex: 6,
                child: Text(
                  "Mã giao dịch",
                  style: TextStyle(
                    color: MaterialColors.primary.withOpacity(0.7),
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                //flex: 6,
                child: Text(
                  id,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15, fontFamily: "SF Medium"),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: kSpacingUnit * 2.5,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //flex: 6,
                child: Text(
                  "Danh mục",
                  style: TextStyle(
                    color: MaterialColors.primary.withOpacity(0.7),
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                //flex: 6,
                child: Text(
                  getTransactionType(transactionType).toUpperCase(),
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15, fontFamily: "SF Medium"),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: kSpacingUnit * 2.5,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //flex: 6,
                child: Text(
                  "Trạng thái",
                  style: TextStyle(
                    color: MaterialColors.primary.withOpacity(0.7),
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                //flex: 6,
                child: Text(
                  status == 1 ? "Thành công" : "Thất bại",
                  style: TextStyle(color: status == 1 ? MaterialColors.success : Colors.red[400], fontSize: 15, fontFamily: "SF Medium"),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _DetailRemittanceHistoryState extends State<DetailRemittanceHistory> {
  final currencyFormatter = NumberFormat('#,##0', 'ID');
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                  MaterialColors.primary,
                  MaterialColors.primary.withOpacity(0.99),
                  MaterialColors.primary.withOpacity(0.97),
                  MaterialColors.primary.withOpacity(0.95),
                  MaterialColors.primary.withOpacity(0.9),
                ]),
              ),
            ),
            centerTitle: true,
            shadowColor: MaterialColors.primary,
            title: Text(
              "Chi tiết giao dịch",
              style: TextStyle(color: Colors.white, fontFamily: "SF Bold"),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: kSpacingUnit * 3,
                ),
                historyTitle("${currencyFormatter.format((widget.transaction.amount!).toInt()).toString()}", widget.transaction.transactionAction),
                SizedBox(
                  height: kSpacingUnit * 0.5,
                ),
                historyInfor(widget.shipperId, widget.name),
                historyTime(widget.transaction.fullDate, widget.transaction.id ?? "", widget.transaction.transactionType, widget.transaction.status)
              ],
            ),
          ),
        );
      },
    );
  }
}
