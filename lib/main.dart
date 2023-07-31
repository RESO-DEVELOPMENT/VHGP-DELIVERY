import 'package:flutter/material.dart';
import 'package:vh_shipper_app/Colors/color.dart';
import 'package:vh_shipper_app/Json/constrain.dart';
import 'package:vh_shipper_app/apis/apiServices.dart';
import 'package:vh_shipper_app/models/DriverModel.dart';
import 'package:vh_shipper_app/pages/app.dart';
import 'package:vh_shipper_app/pages/login_screen.dart';
import 'package:vh_shipper_app/pages/notification_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:vh_shipper_app/pages/list_order_page.dart';
import 'package:provider/provider.dart';
import 'package:vh_shipper_app/provider/appProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // you need to initialize firebase first
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: kDarkTheme,
      theme: kLightTheme,
      home: LandingScreen(),
      //home: OrderPage(),
    ),
  ));
}

class LandingScreen extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  checkUserAuth() async {
    try {
      User user = auth.currentUser!;
      return user;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    checkUserAuth().then((success) {
      if (success != null) {
        context.read<AppProvider>().setUserLogin(success.email);
        context.read<AppProvider>().setUid(success.uid);
        DriverModel driverModel = DriverModel();
        print("ok");
        ApiServices.getDriver(success.email)
            .then((value) => {
                  driverModel = value,
                  context.read<AppProvider>().setName(driverModel.fullName),
                  context.read<AppProvider>().setAvatar(driverModel.image),
                  context.read<AppProvider>().setDriverModel(driverModel),
                  context.read<AppProvider>().setStatus(driverModel.status!),

                  Navigator.push(context, MaterialPageRoute(builder: (context) => RootApp()))
                  // context.read<AppProvider>().setName(store.name)
                })
            .catchError((onError) => {print(onError)});
      } else {
        print("login");
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: MaterialColors.primary),
      ),
    );
  }
}
