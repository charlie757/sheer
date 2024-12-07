import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:sheero/core/constants/app_constants.dart';
import 'package:sheero/core/services/internet_connectivity.dart';
import 'package:sheero/core/utils/logout_helper.dart';
import 'package:sheero/core/utils/message_helper.dart';

class ApiService{
Future<Response?> makeRequest({
  required String apiUrl,
  required String method,  
  Map<String, dynamic>? data, 
  Map<String, dynamic>? queryParameters, 
  bool isErrorMessageShow=true,
  required String authKey
}) async {
  Dio dio = Dio();
  Options options = Options(method: method,headers: {
    // 'authKey':authKey,
    // 'username':SessionManager.username /// user name for after authentication api's
  });

  print(
    authKey
  );
  // print(SessionManager.username);

  Response response;  
  try {
    bool isConnected = await InternetConnectivity.isConnected();
    if(!isConnected){
      MessageHelper.showInternetSnackBar();
      return null;
    }
    print(data);
     response = await dio.request(
        apiUrl,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      print(response.statusCode);
      log(json.encode(response.data));
    // if (method.toUpperCase() == 'GET') {
    //   // GET request: Use query parameters
    //   response = await dio.request(
    //     apiUrl,
    //     queryParameters: queryParameters,
    //     options: options,
    //   );
    // } else {
    //   // POST, PUT, DELETE, etc.: Use data in the body
    //   response = await dio.request(
    //     apiUrl,
    //     data: data,
    //     queryParameters: queryParameters,
    //     options: options,
    //   );
    // }
    return _handleResponse(response, isErrorMessageShow);
  } on DioException catch (e) {
    print(e.response!.realUri);
    log(json.encode(e.response!.data));
    _handleResponse(e.response!, isErrorMessageShow);
    // print('Request failed: ${e.response!.statusCode}');
    // rethrow;  
  }
  return null;
}
  _handleResponse(Response response, bool showErrorMessage) {
    switch (response.statusCode) {
      case 200:
        return response; // Success
      case 401:
        LogoutHelper.logout();
        if (showErrorMessage) {
          MessageHelper.showErrorSnackBar(navigatorKey.currentContext!,response.data['message']);
        }
        // throw Exception('Unauthorized access');
      case 400:
      if (showErrorMessage) {
          MessageHelper.showErrorSnackBar(navigatorKey.currentContext!, response.data['message']);
        }
        // throw Exception('Request failed: ${response.data}');
      case 404||405:
      if (showErrorMessage) {
          MessageHelper.showErrorSnackBar(navigatorKey.currentContext!, response.data['message']);
        }
        return null;
        // throw Exception('Request failed: ${response.data}');
      case 500:
        if (showErrorMessage) {
          MessageHelper.showErrorSnackBar(navigatorKey.currentContext!, response.data['message']);
        }
        // throw Exception('Request failed: ${response.data}');
      default:
        // throw Exception('Unexpected error: ${response.statusCode}');
    }
  }}