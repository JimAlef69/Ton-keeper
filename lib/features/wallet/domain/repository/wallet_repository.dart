import 'package:ton_keeper/core/resources/data_state.dart';
import 'package:ton_keeper/features/wallet/domain/entities/wallet_entity.dart';

abstract class WalletRepository{
  Future<DataState<WalletEntity>>  getWalletData();
}