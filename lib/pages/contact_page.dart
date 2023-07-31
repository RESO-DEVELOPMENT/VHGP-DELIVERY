import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:vh_shipper_app/Json/constrain.dart';
import 'package:vh_shipper_app/pages/change_password_screen.dart';
import 'package:vh_shipper_app/pages/login_screen.dart';
import 'package:vh_shipper_app/pages/update_profile_screen.dart';
import 'package:vh_shipper_app/provider/appProvider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isLoading = false;
  void handleLogout() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    var docSnapshot = await db.collection("users").doc(auth.currentUser!.email).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      var fcmToken = data?['fcmToken'];
      var userId = auth.currentUser!.email;
      await db.collection("users").doc(userId).delete().then((value) => {
            auth.signOut().then((value) => {
                  setState(() {
                    isLoading = false;
                  }),
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
                })
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    // String image = context.read<AppProvider>().getAvatar.toString();
    return Consumer<AppProvider>(builder: (context, provider, child) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 10.0,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      MaterialColors.primary,
                      MaterialColors.primary2,
                    ]),
              ),
            ),
            title: Text(
              "Tài khoản",
              style:
                  TextStyle(color: MaterialColors.white, fontFamily: "SF Bold"),
            ),
          ),
          body: Stack(
            children: [
              Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15, right: 15),
                          child: Row(
                            children: [
                              Container(
                                  width: 70,
                                  height: 70,
                                  margin: const EdgeInsets.only(right: 15),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        bottomLeft: Radius.circular(50),
                                        topRight: Radius.circular(50),
                                        bottomRight: Radius.circular(50),
                                      ),
                                      child: Container(
                                        height: 70,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            bottomLeft: Radius.circular(50),
                                            topRight: Radius.circular(50),
                                            bottomRight: Radius.circular(50),
                                          ),
                                        ),
                                        width: 70,
                                        child: Icon(
                                          Icons.account_circle_rounded,
                                          size: 70,
                                          color: MaterialColors.primary,
                                        ),
                                      ))),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UpdateProfileScreen(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        context.read<AppProvider>().getName,
                                        style: const TextStyle(
                                            color: MaterialColors.black,
                                            fontFamily: "SF Bold",
                                            fontSize: 22),
                                      ),
                                      Padding(padding: EdgeInsets.all(2)),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Chỉnh sửa tài khoản",
                                            style: const TextStyle(
                                                color: Colors.black54,
                                                fontFamily: "SF Medium",
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 12,
                                            color: Colors.black54,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: MaterialColors.grey,
                          padding: const EdgeInsets.all(5),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Thiết lập tài khoản",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "SF Medium",
                                    fontSize: 17),
                              ),
                              const Padding(padding: EdgeInsets.all(15)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.settings,
                                        size: 24,
                                      ),
                                      Padding(padding: EdgeInsets.all(8)),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          "Cài đặt ",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontFamily: "SF SemiBold",
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 16,
                                    color: Colors.black45,
                                  ),
                                ],
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black12, width: 1),
                                  ),
                                ),
                                margin: EdgeInsets.only(top: 20, bottom: 20),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChangePasswordScreen()));
                                },
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.privacy_tip_outlined,
                                            size: 24,
                                          ),
                                          Padding(padding: EdgeInsets.all(8)),
                                          Text(
                                            "Đổi mật khẩu",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontFamily: "SF SemiBold",
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 16,
                                        color: Colors.black45,
                                      ),
                                    ]),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black12, width: 1),
                                  ),
                                ),
                                margin: EdgeInsets.only(top: 20, bottom: 20),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.settings,
                                        size: 24,
                                      ),
                                      Padding(padding: EdgeInsets.all(8)),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          "Điều khoản hợp tác ",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontFamily: "SF SemiBold",
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 16,
                                    color: Colors.black45,
                                  ),
                                ],
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black12, width: 1),
                                  ),
                                ),
                                margin: EdgeInsets.only(top: 20, bottom: 20),
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.support_agent,
                                          size: 24,
                                        ),
                                        Padding(padding: EdgeInsets.all(8)),
                                        Text(
                                          "Trung tâm hỗ trợ",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontFamily: "SF SemiBold",
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 16,
                                      color: Colors.black45,
                                    ),
                                  ]),
                              Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12,
                                              width: 1))),
                                  margin: const EdgeInsets.only(
                                      top: 20, bottom: 20)),
                              InkWell(
                                onTap: () {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text(
                                        'Đăng xuất ngay',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "SF Bold",
                                            fontSize: 18),
                                      ),
                                      actions: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: SizedBox(
                                                    height: 40,
                                                    child: ElevatedButton(
                                                      child: Text(
                                                        "Hủy",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black45,
                                                            fontFamily:
                                                                "SF Medium",
                                                            fontSize: 16),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Colors.white,
                                                        textStyle: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        shadowColor:
                                                            Colors.white,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            side: BorderSide(
                                                                color: Colors
                                                                    .black45,
                                                                width: 1)),
                                                      ),
                                                      onPressed: () => {
                                                        Navigator.pop(context)
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.all(7)),
                                                Expanded(
                                                  child: SizedBox(
                                                    height: 40,
                                                    child: ElevatedButton(
                                                      child: const Text(
                                                        "Đồng ý",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                "SF Medium",
                                                            fontSize: 16),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: MaterialColors
                                                            .primary,
                                                        textStyle: TextStyle(
                                                            color:
                                                                Colors.white),
                                                        shadowColor:
                                                            Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                      ),
                                                      onPressed: () =>
                                                          {handleLogout()},
                                                    ),
                                                  ),
                                                )
                                              ]),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.logout,
                                            size: 24,
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.all(8)),
                                          const Text(
                                            "Đăng xuất",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontFamily: "SF SemiBold",
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 16,
                                        color: Colors.black45,
                                      ),
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              if (isLoading) ...[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white.withOpacity(0.5),
                  child: SpinKitDualRing(
                    color: MaterialColors.primary,
                    size: 50.0,
                  ),
                )
              ],
            ],
          ));
    });
  }
}
