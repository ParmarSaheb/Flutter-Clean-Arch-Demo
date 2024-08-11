import 'dart:convert';
import 'dart:io';

import 'package:mvvm_arch/data/app_exceptions.dart';
import 'package:mvvm_arch/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseData;
    try {
      final parsedUri = Uri.parse(url);
      final response =
          await http.get(parsedUri).timeout(const Duration(seconds: 10));
      responseData = fetchResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeoutException {
      throw RequestTimeoutException();
    } catch (e) {
      throw ServerException(e.toString());
    }
    return responseData;
  }

  @override
  Future<dynamic> postApi(String url,dynamic data) async {
    dynamic responseData;

    try {
      final parsedUri = Uri.parse(url);
      final response = await http.post(parsedUri, body: jsonEncode(data));
      responseData = fetchResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeoutException {
      throw RequestTimeoutException();
    } catch (e) {
      throw ServerException(e.toString());
    }

    return responseData;
  }

  dynamic fetchResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final data = jsonDecode(response.body);
        return data;
      case 400:
        throw TimeOutException("Cannt connect to server..try again later..!");
      default:
        throw FetchDataException(
            "Cannot fetch data due to some unexcepted reason..try again..!");
    }
  }
}
