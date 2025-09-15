import 'package:dio/dio.dart';
import 'package:ton_keeper/core/utils/constants.dart';
import 'package:ton_keeper/locator.dart';

class ApiProvider{
  final Dio _dio = locator.get();

  Future<dynamic> getWalletData() async{
    final response =await _dio.get(Constants.walletBaseUrl , queryParameters: {
      "path":"wallet"
    });
    return response;
  }

}