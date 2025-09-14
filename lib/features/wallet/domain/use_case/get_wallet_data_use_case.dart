import 'package:ton_keeper/core/resources/data_state.dart';
import 'package:ton_keeper/core/usecase/use_case.dart';
import 'package:ton_keeper/features/wallet/domain/entities/wallet_entity.dart';
import 'package:ton_keeper/features/wallet/domain/repository/wallet_repository.dart';

class GetWalletDataUseCase  extends UseCase<DataState<WalletEntity> , void>{
  final WalletRepository _walletRepository;

  GetWalletDataUseCase(this._walletRepository);
  @override
  Future<DataState<WalletEntity>> call(void param) {
    return _walletRepository.getWalletData();
  }

}