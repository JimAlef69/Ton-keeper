import 'package:dio/dio.dart';
import 'package:ton_keeper/core/error_handling/check_exceptions.dart';
import 'package:ton_keeper/core/resources/data_state.dart';
import 'package:ton_keeper/features/wallet/data/data_source/remote/api_provider.dart';
import 'package:ton_keeper/features/wallet/data/models/wallet_model.dart';
import 'package:ton_keeper/features/wallet/domain/entities/wallet_entity.dart';
import 'package:ton_keeper/features/wallet/domain/repository/wallet_repository.dart';

class WalletRepositoryImpl extends WalletRepository{
 final ApiProvider _apiProvider;

  WalletRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<WalletEntity>> getWalletData() async{
    try{
      Response response = await _apiProvider.getWalletData();
      WalletEntity walletEntity = WalletModel.fromJson(response.data);
      return DataSuccess(walletEntity);
    }catch(e){
      return CheckExceptions.getError(e);
    }
  }
}