import 'package:flutter/material.dart';
import 'package:vh_shipper_app/models/DriverModel.dart';

class AppProvider with ChangeNotifier {
  String userId = "shipper1@gmail.com";
  String uid = "";
  String name = "";
  String avatar = "";
  late DriverModel driverModel = DriverModel();
  bool status = false;

  void setStatus(bool bool) {
    status = true;
    notifyListeners();
  }

  void setDriverModel(DriverModel driver) {
    driverModel = driver;
    notifyListeners();
  }

  void setAvatar(img) {
    avatar = img;
    notifyListeners();
  }

  // void setIsLogout() {
  //   status = false;
  //   notifyListeners();
  // }

  void setUserLogin(id) {
    userId = id;
    notifyListeners();
  }

  void setUid(id) {
    uid = id;
    notifyListeners();
  }

  void setName(driverName) {
    name = driverName;
    notifyListeners();
  }

  bool get getStatus => status;
  String get getUserId => userId;
  String get getAvatar => avatar;
  String get getUid => uid;
  String get getName => name;
  DriverModel get getDriverModel => driverModel;
}
