
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ton_keeper/features/wallet/domain/entities/wallet_entity.dart';

@immutable
sealed class WalletStatus extends Equatable{
  const WalletStatus();

  @override
  List<Object?> get props => [];
}

class WalletInitial extends WalletStatus{}

class WalletLoading extends WalletStatus{}

class WalletSuccess extends WalletStatus{
  final WalletEntity walletEntity;

  const WalletSuccess(this.walletEntity);

  @override
  // TODO: implement props
  List<Object?> get props => [walletEntity];
}


class WalletError extends WalletStatus{
  final String errorMessage;

 const WalletError(this.errorMessage);

 @override
  List<Object?> get props => [errorMessage];
}