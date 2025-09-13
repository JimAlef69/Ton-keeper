import 'package:equatable/equatable.dart';
import 'package:ton_keeper/features/wallet/domain/entities/asset_entity.dart';

class WalletEntity  extends Equatable{
  final double totalBalanceUsd;
  final String walletAddress;
  final String walletType;
  final List<AssetEntity> assets;

  const WalletEntity({
    required this.totalBalanceUsd,
    required this.walletAddress,
    required this.walletType,
    required this.assets,
  });

  @override
  List<Object?> get props => [totalBalanceUsd,walletAddress,walletType,assets];
}
