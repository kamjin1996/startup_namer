import 'package:dio/dio.dart';

Dio dio() {
// or new Dio with a BaseOptions instance.
  var options = BaseOptions(
    baseUrl: 'http://192.168.10.4:10000',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  return Dio(options);
}
