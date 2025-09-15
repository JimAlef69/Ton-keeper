part of 'wallet_bloc.dart';

@immutable
class WalletState extends Equatable{
  final WalletStatus walletStatus;

  const WalletState({required this.walletStatus});

  WalletState copyWith({WalletStatus? newWalletStatus}){
    return WalletState(walletStatus: newWalletStatus ?? walletStatus);
  }

  @override
  List<Object?> get props => [walletStatus];
}
