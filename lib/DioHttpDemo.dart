import 'package:dio/dio.dart';
import 'package:startup_namer/util/HttpClient.dart';

main() {
  findCode().then((value){

  });

//请求一个登录接口
  login();
}

Future<dynamic> findCode() async {
  String url = "/user-application/admin/user/findLoginCode";
  var response = await dio().post(url);
  return response.data;
}

void login() async {
  String url = "/user-application/userLoginAuth/mobile/login";

  var param = {
    "channelNo": "",
    "clientType": "ANDROID",
    "code": "",
    "deviceSn": "",
    "deviceType": "",
    "imie": "",
    "loginIp": "172.16.0.1",
    "mobile": "",
    "promoterId": 0,
    "promoterUrlId": 0,
    "pullnewUserId": 0,
    "realmType": ""
  };

  var response = await dio().post(url, queryParameters: param);
  print('$response');
}
