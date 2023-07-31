import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:vh_shipper_app/Json/constrain.dart';
import 'package:vh_shipper_app/models/notificationModel.dart';
import 'package:vh_shipper_app/pages/contact_page.dart';
import 'package:vh_shipper_app/pages/history_page.dart';
import 'package:vh_shipper_app/pages/home_page.dart';
import 'package:vh_shipper_app/pages/list_order_aceept_page.dart';
import 'package:vh_shipper_app/pages/list_order_page.dart';
import 'package:vh_shipper_app/pages/transaction_page.dart';
import 'package:vh_shipper_app/widgets/order_accept_modal.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  //AppBar appBar = Null;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
            // backgroundColor: Color.fromARGB(255, 254, 254, 254),
            bottomNavigationBar: getFooter(),
            appBar: getAppBar(),
            body: getBody()));
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        ListOrderAceeptPage(),
        HistoryPage(),
        TransactionPage(),
        ContactPage(),
      ],
    );
  }

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  late PushNotificationModel _notificationInfo;
  FirebaseFirestore db = FirebaseFirestore.instance;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late StreamSubscription fcmListener;

  void _ModalAccept(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
        builder: (BuildContext bc) {
          return OrderAcceptModal(function: (func) {});
        });
  }

  void registerNotification() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(alert: true, badge: true, provisional: false, sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      fcmListener = FirebaseMessaging.onMessage.asBroadcastStream().listen((RemoteMessage message) {
        print("on app");
        PushNotificationModel notification =
            PushNotificationModel(title: message.notification!.title, body: message.notification!.body, dataTitle: message.data['title'], dataBody: message.data['body']);

        setState(() {
          _notificationInfo = notification;
        });
        print("body: ${notification.body}");
        print("title: ${notification.title}");
        _ModalAccept(context);
        _showNotification(_notificationInfo.title!, _notificationInfo.body!);
      });
    } else {
      print("not permission");
    }
  }

  Future<void> _showNotification(String title, String content) async {
    final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails('your channel id', 'your channel name',
        channelDescription: 'your channel description', importance: Importance.max, priority: Priority.high, icon: '@drawable/logoicon', tag: "Cộng Đồng Chung Cư", ticker: 'ticker');

    final NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, title, content, platformChannelSpecifics, payload: 'item x');
  }

  @override
  void initState() {
    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: (value) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => RootApp()));
    });

    registerNotification();
    checkForInitialMessage();
    super.initState();
    print("init");
  }

  checkForInitialMessage() async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => RootApp()));
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
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
  getAppBar() {
    switch (activeTab) {
      case 0:
        return null;
      // AppBar(
      //   centerTitle: true,
      //   elevation: 10.0,
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.white,
      //   shadowColor: MaterialColors.primary,
      //   title: Text(
      //     "Trang chủ",
      //     style:
      //         TextStyle(color: MaterialColors.black, fontFamily: "SF Bold"),
      //   ),
      //   actions: <Widget>[
      //     IconButton(
      //       padding: EdgeInsets.only(right: 25),
      //       icon: Icon(
      //         Icons.light_mode,
      //         color: Color.fromARGB(255, 0, 0, 0),
      //         size: 25,
      //       ),
      //       onPressed: () {
      //         // do something
      //       },
      //     )
      //   ],
      // );
      case 1:
        return AppBar(
          centerTitle: true,
          elevation: 10.0,
          automaticallyImplyLeading: false,
          // backgroundColor: MaterialColors.primary,
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
          title: Text(
            "Đơn hàng",
            style: TextStyle(color: MaterialColors.white, fontFamily: "SF Bold"),
          ),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.only(right: 25),
              icon: Icon(
                Icons.light_mode,
                color: MaterialColors.white,
                size: 25,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        );
      case 2:
        return AppBar(
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
            ));
      case 3:
        return AppBar(
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
          title: Text(
            "Giao dịch",
            style: TextStyle(color: MaterialColors.white, fontFamily: "SF Bold"),
          ),
        );
      case 4:
        return AppBar(
          centerTitle: true,
          elevation: 10.0,
          automaticallyImplyLeading: false,
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
          title: Text(
            "Tài khoản",
            style: TextStyle(color: MaterialColors.black, fontFamily: "SF Bold"),
          ),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.only(right: 25),
              icon: Icon(
                Icons.light_mode,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 25,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        );
        break;
    }
  }

  BottomNavigationBarItem _buildItem(tabItem, index) {
    return BottomNavigationBarItem(
      icon: Icon(tabItem[index]['icon']),
      label: tabItem[index]['label'],
    );
  }

  Widget getFooter() {
    return
        // Container(
        //   height: 70,
        //   decoration: BoxDecoration(
        //     color: Color.fromARGB(255, 255, 255, 255),
        //     // border: Border(
        //     //   top: BorderSide(
        //     //     color: Color.fromARGB(255, 105, 76, 76),
        //     //   ),
        //     // ),
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        //     child: Row(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: List.generate(5, (index) {
        //           return IconButton(
        //             icon: Icon(
        //               itemsTab[index]['icon'],
        //               size: itemsTab[index]["size"],
        //               color: activeTab == index ? accent : black,
        //             ),
        //             onPressed: () {
        //               setState(() {
        //                 activeTab = index;
        //               });
        //             },
        //           );
        //         })),
        //   ),
        // );
        BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: IconThemeData(color: MaterialColors.primary),
            type: BottomNavigationBarType.fixed,
            currentIndex: activeTab,
            selectedItemColor: MaterialColors.primary,
            items: [
              _buildItem(itemsTab, 0),
              _buildItem(itemsTab, 1),
              _buildItem(itemsTab, 2),
              _buildItem(itemsTab, 3),
              _buildItem(itemsTab, 4),
            ],
            onTap: (index) => {
                  setState(() {
                    activeTab = index;
                  })
                });
  }
}
