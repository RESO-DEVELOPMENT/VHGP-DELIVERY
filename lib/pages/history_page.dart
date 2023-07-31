import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:vh_shipper_app/provider/appProvider.dart';
import 'package:vh_shipper_app/widgets/order_history_tab.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TabBar get _tabBar => TabBar(
        labelColor: MaterialColors.primary,
        unselectedLabelColor: Colors.black45,
        tabs: [
          Tab(
            child: Container(
              padding: EdgeInsets.only(top: 3),
              width: 85,
              child: Text(
                "Hoàn thành",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "SF SemiBold",
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Tab(
            child: Container(
              padding: EdgeInsets.only(top: 3),
              width: 85,
              child: Text(
                "Đã Hủy",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "SF SemiBold",
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                    MaterialColors.primary,
                    MaterialColors.primary2,
                  ]),
                ),
              ),
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                "Lịch sử",
                style: TextStyle(color: MaterialColors.white, fontFamily: "SF Bold"),
              ),
              bottom: PreferredSize(
                preferredSize: _tabBar.preferredSize,
                child: ColoredBox(
                  color: Colors.white,
                  child: _tabBar,
                ),
              )),
          body: TabBarView(
            children: <Widget>[
              OrderHistoryTab(status: 1),
              OrderHistoryTab(status: 2),
            ],
          ),
        ));
  }
}
