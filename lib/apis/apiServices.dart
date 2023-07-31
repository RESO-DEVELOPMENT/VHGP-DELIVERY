import 'dart:async';
import 'dart:convert' as convert;
import 'package:vh_shipper_app/models/DriverModel.dart';
import 'package:http/http.dart' as http;
import 'package:vh_shipper_app/models/EdgeModel.dart';
import 'package:vh_shipper_app/models/HistoryModel.dart';
import 'package:vh_shipper_app/models/MessageEdgeModel.dart';
import 'package:vh_shipper_app/models/MessageEdgeModelHistory.dart';
import 'package:vh_shipper_app/models/TransactionModel.dart';
import 'package:vh_shipper_app/models/orderModel.dart';

class ApiServices {
  static const baseURL = 'https://api.vhgp.net/api/v1';
  static const SHIP = "shipper-management";

//https://deliveryvhgp-webapi.azurewebsites.net/api/v1/shipper-management/shippers/ByShipId?id=1
  static Future<dynamic> getDriver(
    String id,
  ) async {
    print('getDriver');
    var driverModel = Completer<DriverModel>();
    var body;
    try {
      var response = await http.get(
        Uri.parse('${baseURL}/${SHIP}/${"shippers"}/ByShipId?id=${id}'),
      );
      body = convert.jsonDecode(response.body);
      driverModel.complete(DriverModel.fromJson(body['data']));
    } catch (_) {
      driverModel.complete(DriverModel.fromJson(body));
    }
    return driverModel.future;
  }

//https://deliveryvhgp-webapi.azurewebsites.net/api/v1/routes/b6261fcf-4b85-41b5-be97-84237f956022/edges
  static Future<dynamic> getListEdge(
    String id,
  ) async {
    print('getListEdge');
    var messageEdgeModel = Completer<MessageEdgeModel>();
    var body;
    try {
      var response = await http.get(
        Uri.parse('${baseURL}/routes/${id}/edges'),
      );
      body = convert.jsonDecode(response.body);
      messageEdgeModel.complete(MessageEdgeModel.fromJson(body));
      // List<EdgeModel> edgeList =
      //       body.map((dynamic item) => EdgeModel.fromJson(item)).toList();
    } catch (e) {
      // messageEdgeModel.complete(MessageEdgeModel.fromJson(body));
      print('Error with status code: ${e}');
    }
    return messageEdgeModel.future;
  }

//https://deliveryvhgp-webapi.azurewebsites.net/api/v1/orders/history?shipperId=shipper1%40gmail.com&status=1&page=1&pageSize=20
  static Future<dynamic> getListHistory(
      String shipperId, int status, page, size) async {
    var messageEdgeModel = Completer<MessageEdgeModel>();
    var body;
    try {
      print('getListHistory');
      var response = await http.get(
        Uri.parse(
            '${baseURL}/orders/history?shipperId=${shipperId}&status=${status}&page=${page}&pageSize=${size}'),
      );
      body = convert.jsonDecode(response.body);
      messageEdgeModel.complete(MessageEdgeModel.fromJson(body));
      // List<EdgeModel> edgeList =
      //       body.map((dynamic item) => EdgeModel.fromJson(item)).toList();
    } catch (e) {
      // messageEdgeModel.complete(MessageEdgeModel.fromJson(body));
      print('Error with status code: ${e}');
      return null;
    }
    return messageEdgeModel.future;
  }

//https://deliveryvhgp-webapi.azurewebsites.net/api/v1/orders/history/detail?shipperHistoryId=6b1bffe9-b0be-4fa5-b363-a8d65e6e712c
  static Future<dynamic> getHistoryDetail(String id) async {
    var messageEdgeModel = Completer<MessageEdgeModelHistory>();
    var body;
    try {
      print('getHistoryDetail');
      var response = await http.get(
        Uri.parse('${baseURL}/orders/history/detail?shipperHistoryId=${id}'),
      );
      body = convert.jsonDecode(response.body);
      messageEdgeModel.complete(MessageEdgeModelHistory.fromJson(body));
      // List<EdgeModel> edgeList =
      //       body.map((dynamic item) => EdgeModel.fromJson(item)).toList();
    } catch (e) {
      // messageEdgeModel.complete(MessageEdgeModel.fromJson(body));
      print('Error with status code: ${e}');
      return null;
    }
    return messageEdgeModel.future;
  }

//https://deliveryvhgp-webapi.azurewebsites.net/api/v1/transactions/byShipper?shipperId=shipper2%40gmail.com&page=1&pageSize=20
  static Future<dynamic> getListTransaction(
      String shipperId, page, size) async {
    var messageEdgeModel = Completer<MessageEdgeModel>();
    var body;
    try {
      print('getListTransaction');
      var response = await http.get(
        Uri.parse(
            '${baseURL}/transactions/byShipper?shipperId=${shipperId}&page=${page}&pageSize=${size}'),
      );
      body = convert.jsonDecode(response.body);
      messageEdgeModel.complete(MessageEdgeModel.fromJson(body));
    } catch (e) {
      // messageEdgeModel.complete(MessageEdgeModel.fromJson(body));
      print('Error with status code: ${e}');
      return null;
    }
    return messageEdgeModel.future;
  }

//https://deliveryvhgp-webapi.azurewebsites.net/api/v1/routes/d2292b46-0bc4-43d0-b5b4-26f1e8dce400
  static Future<dynamic> getEdgeDetail(
    String id,
  ) async {
    print('getEdgeDetail');
    var messageEdgeModel = Completer<MessageEdgeModel>();
    var body;
    try {
      var response = await http.get(
        Uri.parse('${baseURL}/routes/${id}'),
      );
      body = convert.jsonDecode(response.body);
      messageEdgeModel.complete(MessageEdgeModel.fromJson(body));
      // List<EdgeModel> edgeList =
      //       body.map((dynamic item) => EdgeModel.fromJson(item)).toList();
    } catch (e) {
      // messageEdgeModel.complete(MessageEdgeModel.fromJson(body));
      print('Error with status code: ${e}');
      return null;
    }
    return messageEdgeModel.future;
  }

//https://deliveryvhgp-webapi.azurewebsites.net/api/v1/shippers/shipper1%40gmail.com/current-job
  static Future<dynamic> getCurrentJob(
    String id,
  ) async {
    var edgeModel = Completer<EdgeModel>();
    var body;
    try {
      print('getCurrentJob');
      var response = await http.get(
        Uri.parse('${baseURL}/shippers/${id}/current-job'),
      );
      body = convert.jsonDecode(response.body);
      edgeModel.complete(EdgeModel.fromJson(body));
      // List<EdgeModel> edgeList =
      //       body.map((dynamic item) => EdgeModel.fromJson(item)).toList();
    } catch (e) {
      // messageEdgeModel.complete(MessageEdgeModel.fromJson(body));
      print('Error with status code: ${e}');
      return null;
    }
    return edgeModel.future;
  }

//https://deliveryvhgp-webapi.azurewebsites.net/api/v1/shippers/shipper%40gmail.com/report?DateFilter=11%2F30%2F2022
  static Future<dynamic> getReportOrder(
    String id,
    String dayFilter,
    String monthFilter,
    String yearFilter,
  ) async {
    print('getReportOrder');
    var messageEdgeModel = Completer<MessageEdgeModelHistory>();
    var body;
    String url = "";
    try {
      if (dayFilter == "") {
        url = "Month=${monthFilter}&Year=${yearFilter}";
      } else {
        url = "DateFilter=${dayFilter}";
      }
      var response = await http.get(
        Uri.parse('${baseURL}/shippers/${id}/report?${url}'),
      );
      body = convert.jsonDecode(response.body);
      messageEdgeModel.complete(MessageEdgeModelHistory.fromJson(body));
      // List<EdgeModel> edgeList =
      //       body.map((dynamic item) => EdgeModel.fromJson(item)).toList();
    } catch (e) {
      // messageEdgeModel.complete(MessageEdgeModel.fromJson(body));
      print('Error with status code: ${e}');
      return null;
    }
    return messageEdgeModel.future;
  }

//https://deliveryvhgp-webapi.azurewebsites.net/api/v1/shippers/shipper1%40gmail.com/wallet
  static Future<dynamic> getWallet(
    String id,
  ) async {
    print('getWallet');
    var messageEdgeModel = Completer<MessageEdgeModelHistory>();
    var body;
    try {
      var response = await http.get(
        Uri.parse('${baseURL}/shippers/${id}/wallet'),
      );
      body = convert.jsonDecode(response.body);
      messageEdgeModel.complete(MessageEdgeModelHistory.fromJson(body));
      // List<EdgeModel> edgeList =
      //       body.map((dynamic item) => EdgeModel.fromJson(item)).toList();
    } catch (e) {
      // messageEdgeModel.complete(MessageEdgeModel.fromJson(body));
      print('Error with status code: ${e}');
      return null;
    }
    return messageEdgeModel.future;
  }

//https://deliveryvhgp-webapi.azurewebsites.net/api/v1/orders/complete?orderActionId=1&shipperId=2&actionType=3
  static Future<dynamic> orderComplete(
    String orderActionId,
    String shipperId,
    int actionType,
  ) async {
    print('orderComplete');
    var messageEdgeModel = Completer<MessageEdgeModel>();
    var body;
    try {
      print(orderActionId);
      print(shipperId);
      print(actionType);
      var response = await http.put(
        Uri.parse(
            '$baseURL/orders/complete?orderActionId=$orderActionId&shipperId=$shipperId&actionType=$actionType'),
      );
      body = convert.jsonDecode(response.body);
      messageEdgeModel.complete(MessageEdgeModel.fromJson(body));
      print(response.statusCode.toString() + "status code");
      print(response.body.toString());
      // List<EdgeModel> edgeList =
      //       body.map((dynamic item) => EdgeModel.fromJson(item)).toList();
    } catch (e) {
      // messageEdgeModel.complete(MessageEdgeModel.fromJson(body));
      print('Error with status code: ${e}');
      return null;
    }
    return messageEdgeModel.future;
  }

//https://deliveryvhgp-webapi.azurewebsites.net/api/v1/orders/cancel?orderActionId=1&shipperId=1&actionType=1&messageFail=1
  static Future<dynamic> orderCancel(String orderActionId, String shipperId,
      int actionType, String message) async {
    var messageEdgeModel = Completer<MessageEdgeModel>();
    var body;
    try {
      print('orderCancel');
      var response = await http.put(
        Uri.parse(
            '${baseURL}/orders/cancel?orderActionId=${orderActionId}&shipperId=${shipperId}&actionType=${actionType}&messageFail=${message}'),
      );
      body = convert.jsonDecode(response.body);
      messageEdgeModel.complete(MessageEdgeModel.fromJson(body));
      // List<EdgeModel> edgeList =
      //       body.map((dynamic item) => EdgeModel.fromJson(item)).toList();
    } catch (e) {
      // messageEdgeModel.complete(MessageEdgeModel.fromJson(body));
      print('Error with status code: ${e}');
      return null;
    }
    return messageEdgeModel.future;
  }

  //https://deliveryvhgp-webapi.azurewebsites.net/api/v1/shipper-management/shippers/1
  static Future<dynamic> putDriver(DriverModel store, String id) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    try {
      print('putDriver');
      Map<String, String> headers = {"Content-type": "application/json"};
      var response = await http.put(
          Uri.parse('${baseURL}/${SHIP}/${"shippers"}/${id}?imgUpdate=false'),
          headers: headers,
          body: convert.jsonEncode({
            "id": store.id,
            "fullName": store.fullName,
            "phone": store.phone,
            "email": store.email,
            "image": store.image,
            "deliveryTeam": store.deliveryTeam,
            "password": store.password,
            "vehicleType": store.vehicleType,
            "licensePlates": store.licensePlates,
            "colour": store.colour
          }));

      if (response.statusCode == 200) {
        var body;
        Completer<DriverModel> store = Completer<DriverModel>();
        body = convert.jsonDecode(response.body);
        store.complete(DriverModel.fromJson(body));

        return store.future;
      } else if (response.statusCode == 404 || response.statusCode == 409) {
        return null;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  //https://deliveryvhgp-webapi.azurewebsites.net/api/v1/routes/1453cc31-c18c-4194-852d-2e2ccc1eab84/accept?shipperId=shipper1%40gmail.com
  static Future<dynamic> postAcceptRoute(
      String routeId, String shipperId) async {
    //12c9cd48-8cb7-4145-8fd9-323e20b329dd
    try {
      print('postAcceptRoute');
      Map<String, String> headers = {"Content-type": "application/json"};
      // var messageEdgeModel = Completer<MessageEdgeModel>();
      var body;
      var response = await http.get(
        Uri.parse('${baseURL}/routes/${routeId}/accept?shipperId=${shipperId}'),
        headers: headers,
      );
      print("dat vip pro" + response.statusCode.toString());
      if (response.statusCode == 200) {
        // Completer<MessageEdgeModel> message = Completer<MessageEdgeModel>();
        body = convert.jsonDecode(response.body);
        // message.complete(MessageEdgeModel.fromJson(body));
        return body["statusCode"] ?? "Fail";
      } else if (response.statusCode == 404 || response.statusCode == 409) {
        return null;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }

  static Future<dynamic> fetechOrders(String shipperId) async {
    try {
      print('fetechOrders');
      Map<String, String> headers = {"Content-type": "application/json"};
      // var messageEdgeModel = Completer<MessageEdgeModel>();
      var response = await http.get(
        Uri.parse('$baseURL/orders/shipperId?shipperId=$shipperId'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        return orderResponseFromJson(response.body);
      } else if (response.statusCode == 404 || response.statusCode == 409) {
        return null;
      }
    } catch (e) {
      print('Error with status code: ${e}');
    }
  }
}
