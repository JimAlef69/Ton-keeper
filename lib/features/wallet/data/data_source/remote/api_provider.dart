import 'package:dio/dio.dart';
import 'package:ton_keeper/core/utils/constants.dart';

class ApiProvider{
  final Dio _dio = Dio();

  Future<dynamic> getWalletData() async{
    final response =await _dio.get(Constants.walletBaseUrl , queryParameters: {
      "path":"wallet"
    });
    return response;
  }

}